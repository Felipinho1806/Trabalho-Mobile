import 'package:flutter/material.dart';

class CheckersGameScreen extends StatefulWidget {
  const CheckersGameScreen({super.key});

  @override
  _CheckersGameScreenState createState() => _CheckersGameScreenState();
}

// Tipo de peça
enum PieceType { normal, king }

// Classe peça
class Piece {
  PieceType type;
  Color color; // Colors.red ou Colors.black

  Piece(this.color, {this.type = PieceType.normal});
}

class _CheckersGameScreenState extends State<CheckersGameScreen> {
  static const int size = 8;

  late List<List<Piece?>> board;
  Color currentPlayer = Colors.red;

  int? selectedRow;
  int? selectedCol;

  @override
  void initState() {
    super.initState();
    _initBoard();
  }

  void _initBoard() {
    board = List.generate(size, (row) {
      return List.generate(size, (col) {
        if ((row + col) % 2 == 1) {
          if (row < 3) return Piece(Colors.black);
          if (row > 4) return Piece(Colors.red);
        }
        return null;
      });
    });
    selectedRow = null;
    selectedCol = null;
  }

  void selectOrMove(int row, int col) {
    final piece = board[row][col];

    if (selectedRow == null && selectedCol == null) {
      if (piece != null && piece.color == currentPlayer) {
        setState(() {
          selectedRow = row;
          selectedCol = col;
        });
      }
    } else {
      final sRow = selectedRow!;
      final sCol = selectedCol!;
      final selectedPiece = board[sRow][sCol]!;

      if (_isValidMove(sRow, sCol, row, col)) {
        setState(() {
          board[row][col] = selectedPiece;
          board[sRow][sCol] = null;

          // Captura simples
          if ((row - sRow).abs() == 2) {
            int capRow = (row + sRow) ~/ 2;
            int capCol = (col + sCol) ~/ 2;
            board[capRow][capCol] = null;
          }

          // Promoção a dama
          if (board[row][col]!.type == PieceType.normal) {
            if (board[row][col]!.color == Colors.red && row == 0) {
              board[row][col]!.type = PieceType.king;
            }
            if (board[row][col]!.color == Colors.black && row == size - 1) {
              board[row][col]!.type = PieceType.king;
            }
          }

          // Alterna jogador
          currentPlayer = currentPlayer == Colors.red ? Colors.black : Colors.red;
          selectedRow = null;
          selectedCol = null;
        });

        _checkWin();
      } else {
        setState(() {
          selectedRow = null;
          selectedCol = null;
        });
      }
    }
  }

  bool _isValidMove(int sRow, int sCol, int dRow, int dCol) {
    final piece = board[sRow][sCol];
    final target = board[dRow][dCol];

    if (piece == null || target != null) return false;

    int rowDiff = dRow - sRow;
    int colDiff = (dCol - sCol).abs();

    // Movimento diagonal
    if (colDiff != rowDiff.abs() || (colDiff != 1 && colDiff != 2)) return false;

    // Movimento normal
    if (piece.type == PieceType.normal) {
      if (piece.color == Colors.red && rowDiff >= 0) return false;
      if (piece.color == Colors.black && rowDiff <= 0) return false;
    }

    // Captura
    if (colDiff == 2) {
      int midRow = (sRow + dRow) ~/ 2;
      int midCol = (sCol + dCol) ~/ 2;
      final middle = board[midRow][midCol];
      if (middle == null || middle.color == piece.color) return false;
    }

    return true;
  }

  void _checkWin() {
    bool redLeft = false;
    bool blackLeft = false;

    for (var row in board) {
      for (var piece in row) {
        if (piece != null) {
          if (piece.color == Colors.red) redLeft = true;
          if (piece.color == Colors.black) blackLeft = true;
        }
      }
    }

    if (!redLeft || !blackLeft) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(!redLeft ? "Preto venceu!" : "Vermelho venceu!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _initBoard();
                  currentPlayer = Colors.red;
                });
              },
              child: const Text("Jogar novamente"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Sair"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double boardSize = MediaQuery.of(context).size.width - 20;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Damas 2 Jogadores"),
        backgroundColor: const Color(0xFF5E8BFF),
      ),
      body: Center(
        child: Container(
          width: boardSize,
          height: boardSize,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.brown[400],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: List.generate(size, (row) {
              return Expanded(
                child: Row(
                  children: List.generate(size, (col) {
                    bool isDark = (row + col) % 2 == 1;
                    final piece = board[row][col];
                    bool isSelected = selectedRow == row && selectedCol == col;

                    return Expanded(
                      child: GestureDetector(
                        onTap: () => selectOrMove(row, col),
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: isDark ? Colors.brown[800] : Colors.brown[200],
                            border: isSelected
                                ? Border.all(color: Colors.yellow, width: 3)
                                : null,
                          ),
                          child: Center(
                            child: piece == null
                                ? null
                                : Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: piece.color,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      if (piece.type == PieceType.king)
                                        const Text(
                                          "K",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

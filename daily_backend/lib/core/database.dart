import 'package:postgres/postgres.dart';

class Connection {
  static PostgreSQLConnection? _conn;

  PostgreSQLConnection get connection {
    _conn ??= PostgreSQLConnection(
      'localhost', // host
      5432,        // porta
      'dailyxp_db', // nome do banco
      username: 'postgres',
      password: 'postgres', // ajuste se a senha for diferente
    );

    return _conn!;
  }

  Future<void> open() async {
    if (_conn == null || _conn!.isClosed) {
      await connection.open();
      print('✅ Conexão com PostgreSQL aberta!');
    }
  }

  Future<void> close() async {
    if (_conn != null && !_conn!.isClosed) {
      await _conn!.close();
      print('🔌 Conexão com PostgreSQL encerrada!');
    }
  }
}

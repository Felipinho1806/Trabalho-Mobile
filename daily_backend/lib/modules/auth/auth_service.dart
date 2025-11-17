// lib/modules/auth/auth_service.dart
//import 'package:postgres/postgres.dart';
import '../../core/database.dart';

class AuthService {
  final Connection _connection;

  AuthService(this._connection);

  Future<Map<String, dynamic>?> register(String nome, String email, String senha) async {
    await _connection.open();
    final conn = _connection.connection;

    // Verifica se o email já existe
    final verify = await conn.query(
      'SELECT id_usuario FROM usuarios WHERE email = @email',
      substitutionValues: {'email': email},
    );

    if (verify.isNotEmpty) {
      return null; // já existe
    }

    // 🚨 Aqui você está salvando a senha em texto puro
    // No futuro, trocar por hash com bcrypt
    final result = await conn.query(
      '''
      INSERT INTO usuarios (nome, email, senha_hash)
      VALUES (@nome, @email, @senha)
      RETURNING id_usuario, nome, email
      ''',
      substitutionValues: {
        'nome': nome,
        'email': email,
        'senha': senha,
      },
    );

    final row = result.first;

    return {
      'id': row[0],
      'nome': row[1],
      'email': row[2],
    };
  }
}

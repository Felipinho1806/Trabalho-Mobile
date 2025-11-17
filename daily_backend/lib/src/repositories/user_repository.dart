import 'package:postgres/postgres.dart';
import '../models/user_model.dart';

class UserRepository {
  final PostgreSQLConnection connection;

  UserRepository(this.connection);

  Future<UserModel> createUser(String nome, String email, String senhaCriptografada) async {
    final result = await connection.query('''
      INSERT INTO usuarios (nome, email, senha)
      VALUES (@nome, @email, @senha)
      RETURNING id, nome, email;
    ''', substitutionValues: {
      'nome': nome,
      'email': email,
      'senha': senhaCriptografada,
    });

    final row = result.first;
    return UserModel(
      id: row[0] as int,
      nome: row[1] as String,
      email: row[2] as String,
    );
  }
}

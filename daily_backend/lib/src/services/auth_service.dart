import '../repositories/user_repository.dart';
import '../models/user_model.dart';

class AuthService {
  final UserRepository userRepository;

  AuthService(this.userRepository);

  Future<UserModel> register(String nome, String email, String senha) async {
    // TODO: implementar validação e criptografia
    final user = await userRepository.createUser(nome, email, senha);
    return user;
  }
}

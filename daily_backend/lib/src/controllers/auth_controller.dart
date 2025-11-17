import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../services/auth_service.dart';
import 'package:shelf_router/shelf_router.dart';


class AuthController {
  final AuthService authService;

  AuthController(this.authService);

  Router get router {
    final router = Router();

    router.post('/register', (Request request) async {
      final body = jsonDecode(await request.readAsString());

      final nome = body['nome'];
      final email = body['email'];
      final senha = body['senha'];

      if (nome == null || email == null || senha == null) {
        return Response(400, body: jsonEncode({
          'message': 'Dados inválidos. Envie nome, email e senha.'
        }));
      }

      final user = await authService.register(nome, email, senha);

      return Response.ok(jsonEncode({
        'message': 'Usuário criado com sucesso!',
        'usuario': user.toMap()
      }));
    });

    return router;
  }
}

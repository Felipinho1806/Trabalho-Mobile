// lib/modules/auth/auth_controller.dart
import 'dart:convert';
import '../../core/database.dart';
import 'auth_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class AuthController {
  late final AuthService _service;

  AuthController(Connection connection) {
    _service = AuthService(connection);
  }

  Router get router {
    final router = Router();

    router.post('/register', (Request request) async {
      final body = await request.readAsString();
      final data = jsonDecode(body);

      final nome = data['nome'];
      final email = data['email'];
      final senha = data['senha'];

      if (nome == null || email == null || senha == null) {
        return Response.badRequest(
          body: jsonEncode({'error': 'Campos obrigatórios: nome, email, senha'}),
        );
      }

      final user = await _service.register(nome, email, senha);

      if (user == null) {
        return Response(409, body: jsonEncode({'error': 'Email já cadastrado'}));
      }

      return Response.ok(jsonEncode(user));
    });

    return router;
  }
}

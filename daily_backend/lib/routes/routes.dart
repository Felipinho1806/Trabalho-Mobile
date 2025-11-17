import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import '../src/controllers/auth_controller.dart';
import '../src/services/auth_service.dart';
import '../src/repositories/user_repository.dart';
import '../core/database.dart';

Router appRoutes() {

  final router = Router();
  final connection = Connection(); // classe de conexão ao PostgreSQL
final authController =
    AuthController(AuthService(UserRepository(connection.connection)));

  // 🔹 Rota de teste
  router.get('/teste', (Request req) {
    return Response.ok(
      '✅ API do DailyXP está rodando!',
      headers: {'Content-Type': 'text/plain; charset=utf-8'},
    );
  });

  //  Rotas de autenticação
  router.mount('/auth/', authController.router);

  return router;
}

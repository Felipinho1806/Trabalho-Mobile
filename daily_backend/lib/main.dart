import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

import 'routes/routes.dart';
import 'core/env.dart';

void main() async {
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(appRoutes());

  final server = await serve(handler, InternetAddress.anyIPv4, 8081);

  print('🚀 Servidor rodando em http://localhost:${server.port}');
}

class PostModel {
  String texto;
  int curtidas;
  bool curtido;

  PostModel({
    required this.texto,
    this.curtidas = 0,
    this.curtido = false,
  });
}

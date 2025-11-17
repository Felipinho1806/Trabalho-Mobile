class UserModel {
  final int id;
  final String nome;
  final String email;

  UserModel({
    required this.id,
    required this.nome,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
    };
  }
}

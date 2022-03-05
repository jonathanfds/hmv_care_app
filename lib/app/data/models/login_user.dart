class User {
  String username;
  String? userId;
  String? cpf;
  String? email;
  String? name;
  String? foto;
  String? dtNascimento;
  String? sexo;
  String? telefone;
  String? endereco;
  List<String> groups = [];

  User(
      {required this.username,
      this.userId,
      this.cpf,
      this.email,
      this.name,
      this.foto,
      this.dtNascimento,
      this.telefone,
      this.sexo,
      this.endereco,
      this.groups = const []});
}

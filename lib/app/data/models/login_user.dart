class User {
  String username;
  String? userId;
  String? email;
  String? name;
  List<String> groups = [];

  User(
      {required this.username,
      this.userId,
      this.email,
      this.name,
      this.groups = const []});
}

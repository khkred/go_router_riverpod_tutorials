class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> jsonUser) => User(
      id: jsonUser['id'], name: jsonUser['name'], email: jsonUser['email']);
}

class User {
  int id;
  String name;
  String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> user) =>
      User(id: user['id'], name: user['name'], email: user['email']);
}

class User {
  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.pathToPhoto,
  });
  final String? id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String? pathToPhoto;
}

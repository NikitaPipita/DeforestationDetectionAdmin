class User {
  final int? id;
  final String email;
  final String role;
  final String fullName;
  final String? password;

  User({
    required this.email,
    required this.role,
    required this.fullName,
    this.id,
    this.password,
  });
}

class UserDto {
  final int? id;
  final String email;
  final String role;
  final String fullName;
  final String? password;

  UserDto({
    required this.email,
    required this.role,
    required this.fullName,
    this.id,
    this.password,
  });
}

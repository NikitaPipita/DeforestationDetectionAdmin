import 'package:deforestation_detection_admin/domain/repositoies/user_repository.dart';

abstract class DeleteUserUseCase {
  Future<void> deleteUser(int id);
}

class ApiDeleteUserUseCase implements DeleteUserUseCase {
  final UserRepository _userRepository;

  ApiDeleteUserUseCase(
      this._userRepository,
      );

  @override
  Future<void> deleteUser(int id) => _userRepository.deleteUser(id);
}

import 'package:deforestation_detection_admin/domain/entities/user.dart';
import 'package:deforestation_detection_admin/domain/repositories/user_repository.dart';

abstract class UpdateUserUseCase {
  Future<void> updateUser(User user);
}

class ApiUpdateUserUseCase implements UpdateUserUseCase {
  final UserRepository _userRepository;

  ApiUpdateUserUseCase(
    this._userRepository,
  );

  @override
  Future<void> updateUser(User user) => _userRepository.updateUser(user);
}

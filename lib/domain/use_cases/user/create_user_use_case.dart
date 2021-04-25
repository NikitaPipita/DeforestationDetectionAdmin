import 'package:deforestation_detection_admin/domain/entities/user.dart';
import 'package:deforestation_detection_admin/domain/repositories/user_repository.dart';

abstract class CreateUserUseCase {
  Future<void> createUser(User user);
}

class ApiCreateUserUseCase implements CreateUserUseCase {
  final UserRepository _userRepository;

  ApiCreateUserUseCase(
    this._userRepository,
  );

  @override
  Future<void> createUser(User user) => _userRepository.createUser(user);
}

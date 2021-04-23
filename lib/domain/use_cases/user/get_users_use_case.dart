import 'package:deforestation_detection_admin/domain/entities/user.dart';
import 'package:deforestation_detection_admin/domain/repositoies/user_repository.dart';

abstract class GetUsersUseCase {
  Future<List<User>> getUsers();
}

class ApiGetUsersUseCase implements GetUsersUseCase {
  final UserRepository _userRepository;

  ApiGetUsersUseCase(
    this._userRepository,
  );

  @override
  Future<List<User>> getUsers() => _userRepository.getUsers();
}

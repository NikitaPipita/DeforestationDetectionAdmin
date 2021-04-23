import 'package:deforestation_detection_admin/converters/factory.dart';
import 'package:deforestation_detection_admin/data/gateways/api_user_gateway.dart';
import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/domain/entities/user.dart';
import 'package:deforestation_detection_admin/domain/repositoies/user_repository.dart';

class ApiUserRepository implements UserRepository {
  final ApiUserGateWay _userGateWay;
  final Factory<User, UserDto> _userFactory;

  ApiUserRepository(
    this._userGateWay,
    this._userFactory,
  );

  @override
  Future<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() async {
    final List<UserDto> usersDto = await _userGateWay.getUsers();
    return usersDto.map((UserDto e) => _userFactory.create(e)).toList();
  }

  @override
  Future<void> createUser(User user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(int id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
}

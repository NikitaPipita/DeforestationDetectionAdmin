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
  Future<User> getUser({String? token}) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers({String? token}) async {
    if (token != null) {
      final List<UserDto> usersDto = await _userGateWay.getUsers(token);
      return usersDto.map((UserDto e) => _userFactory.create(e)).toList();
    } else {
      throw Exception('Token is required.');
    }
  }

  @override
  Future<void> createUser(User user, {String? token}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(User user, {String? token}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(int id, {String? token}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
}

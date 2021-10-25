import 'package:deforestation_detection_admin/data/gateways/api_authentication_gateway.dart';
import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/domain/entities/user.dart';
import 'package:deforestation_detection_admin/domain/services/login_service.dart';
import 'package:deforestation_detection_admin/factories/factory.dart';

class ApiLoginService implements LoginService {
  final ApiAuthenticationGateWay _jsonWebTokenGateWay;
  final Factory<User, UserDto> _userFactory;

  ApiLoginService(
    this._jsonWebTokenGateWay,
    this._userFactory,
  );

  @override
  Future<User> authentication(String email, String password) async {
    final UserDto userDto =
        await _jsonWebTokenGateWay.authentication(email, password);
    return _userFactory.create(userDto);
  }
}

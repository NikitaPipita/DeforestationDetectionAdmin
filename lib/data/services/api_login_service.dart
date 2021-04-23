import 'package:deforestation_detection_admin/data/gateways/api_jwt_gateway.dart';
import 'package:deforestation_detection_admin/domain/services/login_service.dart';

class ApiLoginService implements LoginService {
  final ApiAuthenticationGateWay _jsonWebTokenGateWay;

  ApiLoginService(
    this._jsonWebTokenGateWay,
  );

  @override
  Future<void> authentication(String email, String password) async {
    await _jsonWebTokenGateWay.authentication(email, password);
  }
}

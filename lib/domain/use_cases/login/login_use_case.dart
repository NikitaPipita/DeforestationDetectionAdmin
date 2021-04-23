import 'package:deforestation_detection_admin/domain/services/login_service.dart';

abstract class LoginUseCase {
  Future<void> login(String email, String password);
}

class ApiLoginUseCase implements LoginUseCase {
  final LoginService _loginService;

  ApiLoginUseCase(
    this._loginService,
  );

  @override
  Future<void> login(String email, String password) =>
      _loginService.authentication(email, password);
}

import 'package:deforestation_detection_admin/domain/entities/user.dart';

abstract class LoginService {
  Future<User> authentication(String email, String password);
}
import 'package:deforestation_detection_admin/converters/factory.dart';
import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/domain/entities/user.dart';

class UserFromDtoFactory implements Factory<User, UserDto> {
  @override
  User create(UserDto arg) {
    return User(
      id: arg.id,
      email: arg.email,
      fullName: arg.fullName,
      role: arg.role,
      password: arg.password,
    );
  }
}

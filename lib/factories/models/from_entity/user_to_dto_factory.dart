import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/domain/entities/user.dart';
import 'package:deforestation_detection_admin/factories/factory.dart';

class UserToDtoFactory implements Factory<UserDto, User> {
  @override
  UserDto create(User arg) {
    return UserDto(
      id: arg.id,
      email: arg.email,
      fullName: arg.fullName,
      role: arg.role,
      password: arg.password,
    );
  }
}
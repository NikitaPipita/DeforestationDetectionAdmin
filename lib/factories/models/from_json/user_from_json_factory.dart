import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/factories/factory.dart';

class UserDtoFromJsonFactory implements Factory<UserDto, Map<String, dynamic>> {
  @override
  UserDto create(Map<String, dynamic> arg) => UserDto(
        id: arg['user_id'] as int,
        email: arg['email'] as String,
        role: arg['user_role'] as String,
        fullName: arg['full_name'] as String,
      );
}

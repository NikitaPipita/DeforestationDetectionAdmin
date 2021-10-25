import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/factories/factory.dart';

class UserToJsonFactory implements Factory<Map<String, dynamic>, UserDto> {
  @override
  Map<String, dynamic> create(UserDto arg) => <String, dynamic>{
        if (arg.email != null) 'email': arg.email,
        if (arg.password != null) 'password': arg.password,
        if (arg.role != null) 'user_role': arg.role,
        if (arg.fullName != null) 'full_name': arg.fullName,
      };
}

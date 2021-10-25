import 'package:deforestation_detection_admin/data/models/group_dto.dart';
import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/factories/factory.dart';

class GroupDtoFromJsonFactory
    implements Factory<GroupDto, Map<String, dynamic>> {
  final Factory<UserDto, Map<String, dynamic>> _userDtoFormJsonFactory;

  GroupDtoFromJsonFactory(this._userDtoFormJsonFactory);

  @override
  GroupDto create(Map<String, dynamic> arg) => GroupDto(
        id: arg['group_id'] as int,
        userDto: arg['user'] != null
            ? _userDtoFormJsonFactory
                .create(arg['user'] as Map<String, dynamic>)
            : null,
        updateDurationSeconds: arg['update_duration_seconds'] as int,
        lastIotChangesTimeUnix: arg['last_iot_changes_time_unix'] as int,
      );
}

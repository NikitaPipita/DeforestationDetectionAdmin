import 'package:deforestation_detection_admin/converters/factory.dart';
import 'package:deforestation_detection_admin/data/models/group_dto.dart';
import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/domain/entities/group.dart';
import 'package:deforestation_detection_admin/domain/entities/user.dart';

class GroupFromDtoFactory implements Factory<Group, GroupDto> {
  final Factory<User, UserDto> _userFactory;

  GroupFromDtoFactory(
    this._userFactory,
  );

  @override
  Group create(GroupDto arg) {
    return Group(
      id: arg.id,
      user: _userFactory.create(arg.userDto),
      updateDurationSeconds: arg.updateDurationSeconds,
      lastIotChangesTimeUnix: arg.lastIotChangesTimeUnix,
    );
  }
}

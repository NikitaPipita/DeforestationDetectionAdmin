import 'package:deforestation_detection_admin/data/models/group_dto.dart';
import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/domain/entities/group.dart';
import 'package:deforestation_detection_admin/domain/entities/user.dart';
import 'package:deforestation_detection_admin/factories/factory.dart';

class GroupToDtoFactory implements Factory<GroupDto, Group> {
  final Factory<UserDto, User> _userFactory;

  GroupToDtoFactory(
    this._userFactory,
  );

  @override
  GroupDto create(Group arg) {
    return GroupDto(
      id: arg.id,
      userDto: arg.user != null ? _userFactory.create(arg.user!) : null,
      updateDurationSeconds: arg.updateDurationSeconds,
      lastIotChangesTimeUnix: arg.lastIotChangesTimeUnix,
    );
  }
}

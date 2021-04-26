import 'package:deforestation_detection_admin/converters/factory.dart';
import 'package:deforestation_detection_admin/data/models/group_dto.dart';
import 'package:deforestation_detection_admin/data/models/iot_dto.dart';
import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/domain/entities/group.dart';
import 'package:deforestation_detection_admin/domain/entities/iot.dart';
import 'package:deforestation_detection_admin/domain/entities/user.dart';

class IotFromDtoFactory implements Factory<Iot, IotDto> {
  final Factory<User, UserDto> _userFactory;
  final Factory<Group, GroupDto> _groupFactory;

  IotFromDtoFactory(
    this._userFactory,
    this._groupFactory,
  );

  @override
  Iot create(IotDto arg) {
    return Iot(
      id: arg.id,
      user: _userFactory.create(arg.userDto ?? UserDto()),
      group: _groupFactory.create(arg.groupDto ?? GroupDto()),
      longitude: arg.longitude,
      latitude: arg.latitude,
      lastIotChangesTimeUnix: arg.lastIotChangesTimeUnix,
      state: arg.state,
      type: arg.type,
    );
  }
}

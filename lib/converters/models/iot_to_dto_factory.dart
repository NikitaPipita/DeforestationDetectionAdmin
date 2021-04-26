import 'package:deforestation_detection_admin/converters/factory.dart';
import 'package:deforestation_detection_admin/data/models/group_dto.dart';
import 'package:deforestation_detection_admin/data/models/iot_dto.dart';
import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/domain/entities/group.dart';
import 'package:deforestation_detection_admin/domain/entities/iot.dart';
import 'package:deforestation_detection_admin/domain/entities/user.dart';

class IotFromDtoFactory implements Factory<IotDto, Iot> {
  final Factory<UserDto, User> _userFactory;
  final Factory<GroupDto, Group> _groupFactory;

  IotFromDtoFactory(
    this._userFactory,
    this._groupFactory,
  );

  @override
  IotDto create(Iot arg) {
    return IotDto(
      id: arg.id,
      userDto: _userFactory.create(arg.user ?? User()),
      groupDto: _groupFactory.create(arg.group ?? Group()),
      longitude: arg.longitude,
      latitude: arg.latitude,
      lastIotChangesTimeUnix: arg.lastIotChangesTimeUnix,
      state: arg.state,
      type: arg.type,
    );
  }
}

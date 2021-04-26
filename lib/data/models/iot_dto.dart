import 'package:deforestation_detection_admin/data/models/group_dto.dart';
import 'package:deforestation_detection_admin/data/models/user_dto.dart';

class IotDto {
  final int? id;
  final UserDto? userDto;
  final GroupDto? groupDto;
  final double longitude;
  final double latitude;
  final int? lastIotChangesTimeUnix;
  final String state;
  final String type;

  IotDto({
    required this.longitude,
    required this.latitude,
    required this.state,
    required this.type,
    this.id,
    this.userDto,
    this.groupDto,
    this.lastIotChangesTimeUnix,
  });
}

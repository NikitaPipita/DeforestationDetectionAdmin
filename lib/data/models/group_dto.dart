import 'package:deforestation_detection_admin/data/models/user_dto.dart';

class GroupDto {
  final int? id;
  final UserDto userDto;
  final int updateDurationSeconds;
  final int lastIotChangesTimeUnix;

  GroupDto({
    required this.userDto,
    required this.updateDurationSeconds,
    required this.lastIotChangesTimeUnix,
    this.id,
  });
}

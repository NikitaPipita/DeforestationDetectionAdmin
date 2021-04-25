import 'package:deforestation_detection_admin/domain/entities/user.dart';

class Group {
  final int? id;
  final User user;
  final int updateDurationSeconds;
  final int lastIotChangesTimeUnix;

  Group({
    required this.user,
    required this.updateDurationSeconds,
    required this.lastIotChangesTimeUnix,
    this.id,
  });
}

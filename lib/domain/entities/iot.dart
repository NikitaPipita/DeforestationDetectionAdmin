import 'package:deforestation_detection_admin/domain/entities/group.dart';
import 'package:deforestation_detection_admin/domain/entities/user.dart';

class Iot {
  final int? id;
  final User? user;
  final Group? group;
  final double longitude;
  final double latitude;
  final int? lastIotChangesTimeUnix;
  final String state;
  final String type;

  Iot({
    required this.longitude,
    required this.latitude,
    required this.state,
    required this.type,
    this.id,
    this.user,
    this.group,
    this.lastIotChangesTimeUnix,
  });
}

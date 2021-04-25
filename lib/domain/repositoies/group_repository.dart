import 'package:deforestation_detection_admin/domain/entities/group.dart';

abstract class GroupRepository {
  Future<List<Group>> getGroups();

  Future<Group> getGroup(int id);

  Future<void> createGroup(Group group);

  Future<void> updateGroup(Group group);

  Future<void> deleteGroup(int id);
}
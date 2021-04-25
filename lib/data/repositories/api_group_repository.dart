import 'package:deforestation_detection_admin/converters/factory.dart';
import 'package:deforestation_detection_admin/data/models/group_dto.dart';
import 'package:deforestation_detection_admin/domain/entities/group.dart';
import 'package:deforestation_detection_admin/domain/repositoies/group_repository.dart';

class ApiGroupRepository implements GroupRepository {
  Factory<Group, GroupDto> _groupFromDtoFactory;
  Factory<GroupDto, Group> _groupToDtoFactory;

  ApiGroupRepository(
    this._groupFromDtoFactory,
    this._groupToDtoFactory,
  );

  @override
  Future<List<Group>> getGroups() {
    // TODO: implement getGroups
    throw UnimplementedError();
  }

  @override
  Future<Group> getGroup(int id) {
    // TODO: implement getGroup
    throw UnimplementedError();
  }

  @override
  Future<void> createGroup(Group group) {
    // TODO: implement createGroup
    throw UnimplementedError();
  }

  @override
  Future<void> updateGroup(Group group) {
    // TODO: implement updateGroup
    throw UnimplementedError();
  }

  @override
  Future<void> deleteGroup(int id) {
    // TODO: implement deleteGroup
    throw UnimplementedError();
  }
}

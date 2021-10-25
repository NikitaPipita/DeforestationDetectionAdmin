import 'package:deforestation_detection_admin/data/gateways/api_group_gateway.dart';
import 'package:deforestation_detection_admin/data/models/group_dto.dart';
import 'package:deforestation_detection_admin/domain/entities/group.dart';
import 'package:deforestation_detection_admin/domain/repositories/group_repository.dart';
import 'package:deforestation_detection_admin/factories/factory.dart';

class ApiGroupRepository implements GroupRepository {
  final ApiGroupGateWay _apiGroupGateWay;
  final Factory<Group, GroupDto> _groupFromDtoFactory;
  final Factory<GroupDto, Group> _groupToDtoFactory;

  ApiGroupRepository(
    this._apiGroupGateWay,
    this._groupFromDtoFactory,
    this._groupToDtoFactory,
  );

  @override
  Future<List<Group>> getGroups() async {
    final List<GroupDto> groupsDto = await _apiGroupGateWay.getGroups();
    return groupsDto
        .map((GroupDto e) => _groupFromDtoFactory.create(e))
        .toList();
  }

  @override
  Future<Group> getGroup(int id) async {
    final GroupDto groupDto = await _apiGroupGateWay.getGroup(id);
    return _groupFromDtoFactory.create(groupDto);
  }

  @override
  Future<void> createGroup(Group group) =>
      _apiGroupGateWay.createGroup(_groupToDtoFactory.create(group));

  @override
  Future<void> updateGroup(Group group) =>
      _apiGroupGateWay.updateGroup(_groupToDtoFactory.create(group));

  @override
  Future<void> deleteGroup(int id) => _apiGroupGateWay.deleteGroup(id);
}

import 'package:deforestation_detection_admin/domain/entities/group.dart';
import 'package:deforestation_detection_admin/domain/repositoies/group_repository.dart';

abstract class GetGroupsUseCase {
  Future<List<Group>> getGroups();
}

class ApiGetGroupsUseCase implements GetGroupsUseCase {
  final GroupRepository _groupRepository;

  ApiGetGroupsUseCase(
    this._groupRepository,
  );

  @override
  Future<List<Group>> getGroups() => _groupRepository.getGroups();
}

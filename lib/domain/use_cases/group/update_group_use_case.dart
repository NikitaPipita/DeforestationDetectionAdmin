import 'package:deforestation_detection_admin/domain/entities/group.dart';
import 'package:deforestation_detection_admin/domain/repositoies/group_repository.dart';

abstract class UpdateGroupUseCase {
  Future<void> updateGroup(Group group);
}

class ApiUpdateGroupUseCase implements UpdateGroupUseCase {
  final GroupRepository _groupRepository;

  ApiUpdateGroupUseCase(
    this._groupRepository,
  );

  @override
  Future<void> updateGroup(Group group) => _groupRepository.updateGroup(group);
}

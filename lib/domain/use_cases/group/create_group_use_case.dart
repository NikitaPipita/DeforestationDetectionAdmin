import 'package:deforestation_detection_admin/domain/entities/group.dart';
import 'package:deforestation_detection_admin/domain/repositoies/group_repository.dart';

abstract class CreateGroupUseCase {
  Future<void> createGroup(Group group);
}

class ApiCreateGroupUseCase implements CreateGroupUseCase {
  final GroupRepository _groupRepository;

  ApiCreateGroupUseCase(
    this._groupRepository,
  );

  @override
  Future<void> createGroup(Group group) => _groupRepository.createGroup(group);
}

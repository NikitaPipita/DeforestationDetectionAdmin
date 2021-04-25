import 'package:deforestation_detection_admin/domain/repositoies/group_repository.dart';

abstract class DeleteGroupUseCase {
  Future<void> deleteGroup(int id);
}

class ApiDeleteGroupUseCase implements DeleteGroupUseCase {
  final GroupRepository _groupRepository;

  ApiDeleteGroupUseCase(
    this._groupRepository,
  );

  @override
  Future<void> deleteGroup(int id) => _groupRepository.deleteGroup(id);
}

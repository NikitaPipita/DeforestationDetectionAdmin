import 'package:deforestation_detection_admin/domain/repositories/iot_repository.dart';

abstract class DeleteIotUseCase {
  Future<void> deleteIot(int id);
}

class ApiDeleteIotUseCase implements DeleteIotUseCase {
  final IotRepository _iotRepository;

  ApiDeleteIotUseCase(
    this._iotRepository,
  );

  @override
  Future<void> deleteIot(int id) => _iotRepository.deleteIot(id);
}

import 'package:deforestation_detection_admin/domain/entities/iot.dart';
import 'package:deforestation_detection_admin/domain/repositories/iot_repository.dart';

abstract class CreateIotUseCase {
  Future<void> createIot(Iot iot);
}

class ApiCreateIotUseCase implements CreateIotUseCase {
  final IotRepository _iotRepository;

  ApiCreateIotUseCase(
    this._iotRepository,
  );

  @override
  Future<void> createIot(Iot iot) => _iotRepository.createIot(iot);
}

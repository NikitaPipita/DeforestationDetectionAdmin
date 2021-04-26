import 'package:deforestation_detection_admin/domain/entities/iot.dart';
import 'package:deforestation_detection_admin/domain/repositories/iot_repository.dart';

abstract class GetIotsUseCase {
  Future<List<Iot>> getIot();
}

class ApiGetIotsUseCase implements GetIotsUseCase {
  final IotRepository _iotRepository;

  ApiGetIotsUseCase(
    this._iotRepository,
  );

  @override
  Future<List<Iot>> getIot() => _iotRepository.getIots();
}

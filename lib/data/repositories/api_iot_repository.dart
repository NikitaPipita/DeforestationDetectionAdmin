import 'package:deforestation_detection_admin/converters/factory.dart';
import 'package:deforestation_detection_admin/data/models/iot_dto.dart';
import 'package:deforestation_detection_admin/domain/entities/iot.dart';
import 'package:deforestation_detection_admin/domain/repositories/iot_repository.dart';

class ApiIotRepository implements IotRepository {
  final Factory<Iot, IotDto> _iotFromDtoFactory;
  final Factory<IotDto, Iot> _iotToDtoFactory;

  ApiIotRepository(
    this._iotFromDtoFactory,
    this._iotToDtoFactory,
  );

  @override
  Future<List<Iot>> getIots() {
    // TODO: implement getIots
    throw UnimplementedError();
  }

  @override
  Future<Iot> getIot(int id) {
    // TODO: implement getIot
    throw UnimplementedError();
  }

  @override
  Future<void> createIot(Iot iot) {
    // TODO: implement createIot
    throw UnimplementedError();
  }

  @override
  Future<void> updateIot(Iot iot) {
    // TODO: implement updateIot
    throw UnimplementedError();
  }

  @override
  Future<void> deleteIot(int id) {
    // TODO: implement deleteIot
    throw UnimplementedError();
  }
}

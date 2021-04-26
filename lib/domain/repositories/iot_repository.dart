import 'package:deforestation_detection_admin/domain/entities/iot.dart';

abstract class IotRepository {
  Future<List<Iot>> getIots();

  Future<Iot> getIot(int id);

  Future<void> createIot(Iot iot);

  Future<void> updateIot(Iot iot);

  Future<void> deleteIot(int id);
}
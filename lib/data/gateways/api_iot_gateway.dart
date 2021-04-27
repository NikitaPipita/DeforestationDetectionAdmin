import 'package:deforestation_detection_admin/data/gateways/api_provider.dart';
import 'package:deforestation_detection_admin/data/models/group_dto.dart';
import 'package:deforestation_detection_admin/data/models/iot_dto.dart';
import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:dio/dio.dart';

class ApiIotGateWay {
  final ApiProvider _apiProvider;

  ApiIotGateWay(
    this._apiProvider,
  );

  Future<List<IotDto>> getIots() async {
    final Response<dynamic> response = await _apiProvider.apiProviderGet(
      'iots',
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data! as List<dynamic>;
      return data.map((dynamic iotData) {
        final dynamic userData = iotData['user'];
        final UserDto userDto = UserDto(
          id: userData['user_id'] as int,
          email: userData['email'] as String,
          role: userData['user_role'] as String,
          fullName: userData['full_name'] as String,
        );
        final dynamic groupData = iotData['group'];
        final GroupDto groupDto = GroupDto(
          id: groupData['group_id'] as int,
          updateDurationSeconds: groupData['update_duration_seconds'] as int,
          lastIotChangesTimeUnix:
              groupData['last_iot_changes_time_unix'] as int,
        );
        return IotDto(
          id: iotData['iot_id'] as int,
          userDto: userDto,
          groupDto: groupDto,
          longitude: iotData['longitude'] as double,
          latitude: iotData['latitude'] as double,
          lastIotChangesTimeUnix: iotData['last_update_time_unix'] as int,
          state: iotData['iot_state'] as String,
          type: iotData['iot_type'] as String,
        );
      }).toList();
    } else {
      throw Exception('Failed to load iots.');
    }
  }

  Future<IotDto> getIot(int id) async {
    final Response<dynamic> response = await _apiProvider.apiProviderGet(
      'iot/' + id.toString(),
    );

    if (response.statusCode == 200) {
      final dynamic userData = response.data['user'];
      final UserDto userDto = UserDto(
        id: userData['user_id'] as int,
        email: userData['email'] as String,
        role: userData['user_role'] as String,
        fullName: userData['full_name'] as String,
      );
      final dynamic groupData = response.data['group'];
      final GroupDto groupDto = GroupDto(
        id: groupData['group_id'] as int,
        updateDurationSeconds: groupData['update_duration_seconds'] as int,
        lastIotChangesTimeUnix: groupData['last_iot_changes_time_unix'] as int,
      );
      return IotDto(
        id: response.data['iot_id'] as int,
        userDto: userDto,
        groupDto: groupDto,
        longitude: response.data['longitude'] as double,
        latitude: response.data['latitude'] as double,
        lastIotChangesTimeUnix: response.data['last_update_time_unix'] as int,
        state: response.data['iot_state'] as String,
        type: response.data['iot_type'] as String,
      );
    } else {
      throw Exception('Failed to load iot id $id.');
    }
  }

  Future<void> createIot(IotDto iot) async {
    final Response<dynamic> response = await _apiProvider.apiProviderPost(
      'iots',
      data: <String, dynamic>{
        'user_id': iot.userDto!.id!,
        'group_id': iot.groupDto!.id!,
        'longitude': iot.longitude,
        'latitude': iot.latitude,
        'last_update_time_unix': iot.lastIotChangesTimeUnix!,
        'iot_state': iot.state,
        'iot_type': iot.type,
      },
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create iot.');
    }
  }

  Future<void> updateIot(IotDto iot) async {
    final Response<dynamic> response = await _apiProvider.apiProviderPut(
      'iot/' + iot.id!.toString(),
      data: <String, dynamic>{
        'longitude': iot.longitude,
        'latitude': iot.latitude,
        'last_update_time_unix': iot.lastIotChangesTimeUnix!,
        'iot_state': iot.state,
        'iot_type': iot.type,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update iot id ${iot.id}.');
    }
  }

  Future<void> deleteIot(int id) async {
    final Response<dynamic> response = await _apiProvider.apiProviderDelete(
      'iot/' + id.toString(),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete iot id $id.');
    }
  }
}

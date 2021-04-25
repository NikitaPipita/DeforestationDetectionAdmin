import 'package:deforestation_detection_admin/data/gateways/api_provider.dart';
import 'package:deforestation_detection_admin/data/models/group_dto.dart';
import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:dio/dio.dart';

class ApiGroupGateWay {
  final ApiProvider _apiProvider;

  ApiGroupGateWay(
    this._apiProvider,
  );

  Future<List<GroupDto>> getGroups() async {
    final Response<dynamic> response = await _apiProvider.apiProviderGet(
      'groups',
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data! as List<dynamic>;
      return data.map((dynamic groupData) {
        final dynamic userData = groupData['user'];
        final UserDto userDto = UserDto(
          id: userData['user_id'] as int,
          email: userData['email'] as String,
          role: userData['user_role'] as String,
          fullName: userData['full_name'] as String,
        );
        return GroupDto(
          id: groupData['group_id'] as int,
          userDto: userDto,
          updateDurationSeconds: groupData['update_duration_seconds'] as int,
          lastIotChangesTimeUnix:
              groupData['last_iot_changes_time_unix'] as int,
        );
      }).toList();
    } else {
      throw Exception('Failed to load groups.');
    }
  }

  Future<GroupDto> getGroup(int id) async {
    final Response<dynamic> response = await _apiProvider.apiProviderGet(
      'group/' + id.toString(),
    );

    if (response.statusCode == 200) {
      final dynamic userData = response.data['user'];
      final UserDto userDto = UserDto(
        id: userData['user_id'] as int,
        email: userData['email'] as String,
        role: userData['user_role'] as String,
        fullName: userData['full_name'] as String,
      );
      return GroupDto(
        id: response.data['group_id'] as int,
        userDto: userDto,
        updateDurationSeconds: response.data['update_duration_seconds'] as int,
        lastIotChangesTimeUnix:
            response.data['last_iot_changes_time_unix'] as int,
      );
    } else {
      throw Exception('Failed to load group id $id.');
    }
  }

  Future<void> createGroup(GroupDto group) async {
    final Response<dynamic> response = await _apiProvider.apiProviderPost(
      'groups',
      data: <String, dynamic> {
        'user_id': group.userDto!.id!,
        'update_duration_seconds': group.updateDurationSeconds!,
        'last_iot_changes_time_unix': group.lastIotChangesTimeUnix!,
      }
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create group.');
    }
  }

  Future<void> updateGroup(GroupDto group) async {
    final Response<dynamic> response = await _apiProvider.apiProviderPut(
        'group/' + group.id!.toString(),
        data: <String, dynamic> {
          'update_duration_seconds': group.updateDurationSeconds!,
          'last_iot_changes_time_unix': group.lastIotChangesTimeUnix!,
        }
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update group id ${group.id}.');
    }
  }

  Future<void> deleteGroup(int id) async {
    final Response<dynamic> response = await _apiProvider.apiProviderDelete(
      'group/' + id.toString(),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete group id $id.');
    }
  }
}

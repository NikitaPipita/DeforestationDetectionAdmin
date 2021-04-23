import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:dio/dio.dart';

import 'api_provider.dart';

class ApiUserGateWay {
  final ApiProvider _apiProvider;

  ApiUserGateWay(
    this._apiProvider,
  );

  Future<List<UserDto>> getUsers() async {
    final Response<dynamic> response =
        await _apiProvider.apiProviderGet('users');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((dynamic e) => UserDto(
                id: e['user_id'] as int,
                email: e['email'] as String,
                role: e['user_role'] as String,
                fullName: e['full_name'] as String,
              ))
          .toList();
    } else {
      throw Exception('Failed to load users.');
    }
  }
}

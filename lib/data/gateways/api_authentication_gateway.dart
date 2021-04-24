import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:dio/dio.dart';

import 'api_provider.dart';

class ApiAuthenticationGateWay {
  final ApiProvider _apiProvider;

  ApiAuthenticationGateWay(
    this._apiProvider,
  );

  Future<UserDto> authentication(String email, String password) async {
    final Response<dynamic> response =
        await _apiProvider.authentication(email, password);

    if (response.statusCode == 200) {
      return UserDto(
        id: response.data['user_id'] as int,
        email: response.data['email'] as String,
        role: response.data['user_role'] as String,
        fullName: response.data['full_name'] as String,
      );
    } else {
      throw Exception('Authentication failed.');
    }
  }
}

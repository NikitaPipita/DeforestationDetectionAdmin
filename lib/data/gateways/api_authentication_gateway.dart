import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:deforestation_detection_admin/factories/factory.dart';
import 'package:dio/dio.dart';

import 'api_provider.dart';

class ApiAuthenticationGateWay {
  final ApiProvider _apiProvider;
  final Factory<UserDto, Map<String, dynamic>> _userDtoFromJsonFactory;

  ApiAuthenticationGateWay(
    this._apiProvider,
    this._userDtoFromJsonFactory,
  );

  Future<UserDto> authentication(String email, String password) async {
    final Response<dynamic> response =
        await _apiProvider.authentication(email, password);

    return _userDtoFromJsonFactory
        .create(response.data as Map<String, dynamic>);
  }
}

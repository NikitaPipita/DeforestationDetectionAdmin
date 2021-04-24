import 'package:deforestation_detection_admin/data/models/jwt_dto.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio;

  JsonWebTokenDto? _jsonWebTokenDto;

  ApiProvider() : _dio = Dio() {
    _dio.options.baseUrl = 'http://localhost:8080/';
  }

  void _addTokenToDio(String token) {
    _dio.options.headers['Authorization'] = 'Bearer ' + token;
  }

  bool _isResponseValid(Response<dynamic> response) {
    return response.statusCode! >= 400 && response.statusCode! <= 499;
  }

  Future<void> _refreshToken() async {
    final Response<dynamic> response = await _dio.post<dynamic>(
      'refresh',
      data: <String, dynamic>{
        'token': _jsonWebTokenDto!.refreshToken,
      },
    );
    if (response.statusCode == 201) {
      _jsonWebTokenDto = JsonWebTokenDto(
        accessToken: response.data['access_token'] as String,
        refreshToken: response.data['refresh_token'] as String,
      );
      _addTokenToDio(_jsonWebTokenDto!.accessToken);
    } else {
      throw Exception('Failed to refresh token.');
    }
  }

  Future<Response<dynamic>> authentication(String email, String password) async {
    final Response<dynamic> response = await _dio.post<dynamic>(
      'sessions',
      data: <String, dynamic>{
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      _jsonWebTokenDto = JsonWebTokenDto(
        accessToken: response.data['access_token'] as String,
        refreshToken: response.data['refresh_token'] as String,
      );
      _addTokenToDio(_jsonWebTokenDto!.accessToken);
      return response;
    } else {
      throw Exception('Failed to authenticate user.');
    }
  }

  Future<Response<dynamic>> apiProviderGet(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Response<dynamic> response =
        await _dio.get<dynamic>(path, queryParameters: queryParameters);
    if (!_isResponseValid(response)) {
      await _refreshToken();
      response =
          await _dio.get<dynamic>(path, queryParameters: queryParameters);
    }
    return response;
  }
}

import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:dio/dio.dart';

import 'api_provider.dart';

class ApiUserGateWay {
  final ApiProvider _apiProvider;

  ApiUserGateWay(
    this._apiProvider,
  );

  Future<UserDto> getUser(int id) async {
    final Response<dynamic> response = await _apiProvider.apiProviderGet(
      'user/' + id.toString(),
    );

    if (response.statusCode == 200) {
      return UserDto(
        id: response.data['user_id'] as int,
        email: response.data['email'] as String,
        role: response.data['user_role'] as String,
        fullName: response.data['full_name'] as String,
      );
    } else {
      throw Exception('Failed to load user id $id.');
    }
  }

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

  Future<void> createUser(UserDto userDto) async {
    final Response<dynamic> response = await _apiProvider.apiProviderPost(
      'users',
      data: <String, dynamic>{
        'email': userDto.email!,
        'password': userDto.password!,
        'user_role': userDto.role!,
        'full_name': userDto.fullName!,
      },
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create user.');
    }
  }

  Future<void> updateUser(UserDto userDto) async {
    final Response<dynamic> response = await _apiProvider.apiProviderPut(
      'user/' + userDto.id.toString(),
      data: <String, dynamic>{
        'email': userDto.email!,
        'user_role': userDto.role!,
        'full_name': userDto.fullName!,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user id ${userDto.id}.');
    }
  }

  Future<void> deleteUser(int id) async {
    final Response<dynamic> response = await _apiProvider.apiProviderDelete(
      'user/' + id.toString(),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete user id $id.');
    }
  }
}

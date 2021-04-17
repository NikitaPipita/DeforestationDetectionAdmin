import 'dart:convert';

import 'package:deforestation_detection_admin/data/models/user_dto.dart';
import 'package:http/http.dart' as http;

class ApiUserGateWay {
  static const String requestURLBody = 'http://localhost:8080/';

  Future<List<UserDto>> getUsers(String token) async {
    final http.Response response = await http.get(
      Uri.parse(
        'http://localhost:8080/users',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
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

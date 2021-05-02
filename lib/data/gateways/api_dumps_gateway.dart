import 'dart:convert';
import 'dart:html' as html;

import 'package:deforestation_detection_admin/data/gateways/api_provider.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class ApiDumpsGateway {
  final ApiProvider _apiProvider;

  ApiDumpsGateway(
    this._apiProvider,
  );

  Future<void> downloadDump() async {
    final http.Response response = await _apiProvider.apiProviderGetFile(
      'dump/make',
    );

    if (response.statusCode == 200) {
      final String content = base64Encode(response.bodyBytes.toList());
      final html.AnchorElement anchor = html.AnchorElement(
          href:
              'data:application/octet-stream;charset=utf-16le;base64,$content')
        ..setAttribute('download', 'dt_dump.sql')
        ..click();

      html.document.body!.children.remove(anchor);
    } else {
      throw Exception('Failed to make dump.');
    }
  }

  Future<void> uploadDump(List<int> fileBytes) async {
    final FormData formData = FormData.fromMap(
      <String, dynamic>{
        'file': MultipartFile.fromBytes(
          fileBytes,
          filename: 'dt_dump.sql',
          contentType: MediaType('application', 'octet-stream'),
        ),
      },
    );

    final Response<dynamic> response = await _apiProvider.apiProviderPost(
      'dump/exec',
      data: formData,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to upload dump.');
    }
  }
}

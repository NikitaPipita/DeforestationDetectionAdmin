import 'package:deforestation_detection_admin/data/gateways/api_dumps_gateway.dart';
import 'package:deforestation_detection_admin/dependency_injection.dart' as di;
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class DumpsPage extends StatelessWidget {
  final ApiDumpsGateway _apiDumpsGateway = di.sl.get();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            child: Text(
              'make_dump'.tr(),
            ),
            onPressed: () async {
              await _apiDumpsGateway.downloadDump();
            },
          ),
          const SizedBox(
            width: 20.0,
          ),
          TextButton(
            child: Text(
              'upload_dump'.tr(),
            ),
            onPressed: () async {
              final FilePickerResult? result =
                  await FilePicker.platform.pickFiles(
                allowedExtensions: <String>['sql'],
              );
              if(result != null) {
                final PlatformFile file = result.files.first;
                await _apiDumpsGateway.uploadDump(file.bytes!.toList());
              }
            },
          ),
        ],
      ),
    );
  }
}

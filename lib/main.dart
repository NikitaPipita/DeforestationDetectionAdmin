import 'package:deforestation_detection_admin/presentation/pages/login/page.dart';
import 'package:flutter/material.dart';

import 'dependency_injection.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deforestation Detection Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
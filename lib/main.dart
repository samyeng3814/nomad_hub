import 'package:flutter/material.dart';
import 'package:nomad_hub/my_app.dart';
import 'package:nomad_hub/core/utils/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

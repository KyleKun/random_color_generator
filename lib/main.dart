import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:random_color_generator/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Enter in fullscreen mode
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // Start application
  runApp(const App());
}

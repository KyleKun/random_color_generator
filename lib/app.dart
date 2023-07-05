import 'package:flutter/material.dart';
import 'package:random_color_generator/features/random_color/random_color_screen.dart';

/// Base widget of the application.
class App extends StatelessWidget {
  /// Creates a const widget of [App].
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Color Generator',
      home: RandomColorScreen(),
    );
  }
}

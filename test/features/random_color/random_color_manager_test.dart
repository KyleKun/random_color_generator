import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_generator/features/random_color/random_color_manager.dart';

void main() {
  group('RandomColorManager', () {
    test('Should initialize with correct colors', () {
      final manager = RandomColorManager(
        initialColor: Colors.green,
        initialContrastColor: Colors.red,
      );

      expect(manager.baseColor, Colors.green);
      expect(manager.contrastColor, Colors.red);
    });

    test('Should default to black and white when no colors are provided', () {
      final manager = RandomColorManager();

      expect(manager.baseColor, Colors.black);
      expect(manager.contrastColor, Colors.white);
    });

    test('Should change base color when changeColors() is called', () {
      final manager = RandomColorManager();

      final oldBaseColor = manager.baseColor;

      manager.changeColors();

      // This may fail occasionally due to being random,
      // but in general should pass
      expect(manager.baseColor != oldBaseColor, true);
    });

    test('Should set contrast color as black if base color luminance > 0.5',
        () {
      final manager = RandomColorManager(
        initialColor: Colors.white,
        initialContrastColor: Colors.red,
      );

      manager.updateContrastColor(manager.baseColor);

      expect(manager.contrastColor, Colors.black);
    });

    test('Should set contrast color as white if base color luminance <= 0.5',
        () {
      final manager = RandomColorManager(
        initialColor: Colors.black,
        initialContrastColor: Colors.red,
      );

      manager.updateContrastColor(manager.baseColor);

      expect(manager.contrastColor, Colors.white);
    });
  });
}

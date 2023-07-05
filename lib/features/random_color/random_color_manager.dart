import 'dart:math';

import 'package:flutter/material.dart';

/// Manages the random color generation of the application.
class RandomColorManager {
  Color _baseColor;
  Color _contrastColor;

  /// Returns current base color.
  Color get baseColor => _baseColor;

  /// Returns current contrast color.
  Color get contrastColor => _contrastColor;

  /// Creates a color manager.
  ///
  /// The optional parameter [initialColor] is used
  /// to initialize the base color.
  /// The optional parameter [initialContrastColor]
  /// is used to initialize the contrast color.
  ///
  /// By default [initialColor] is set to [Colors.black]
  /// and [contrastColor] is set to [Colors.white].
  RandomColorManager({
    Color initialColor = Colors.black,
    Color initialContrastColor = Colors.white,
  })  : _baseColor = initialColor,
        _contrastColor = initialContrastColor;

  /// Returns a random number between 0 and 255.
  int _getRandomNumber() {
    const kLimit = 256;

    return Random().nextInt(kLimit);
  }

  /// Returns a contrast color of [baseColor].
  void updateContrastColor(Color baseColor) {
    // Target colors
    const kBlackColor = Color(0xFF000000);
    const kWhiteColor = Color(0xFFFFFFFF);

    // Default threshold value
    const kThreshold = 0.5;

    // Update contrast color based on the luminance of the base color,
    // ensuring that the contrast color is readable
    baseColor.computeLuminance() > kThreshold
        ? _contrastColor = kBlackColor
        : _contrastColor = kWhiteColor;
  }

  /// Changes [baseColor] to a new randomly generated color and
  /// updates [contrastColor] to a contrast color of [baseColor].
  void changeColors() {
    _baseColor = Color.fromRGBO(
      _getRandomNumber(),
      _getRandomNumber(),
      _getRandomNumber(),
      1,
    );

    updateContrastColor(_baseColor);
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

import 'color_styles.dart';

class GradientStyles {
  GradientStyles._();

  static const bronzeGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      ColorStyles.veryLightBrown,
      ColorStyles.bronze1,
    ],
    tileMode: TileMode.clamp,
  );

  static final blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      ColorStyles.resolutionBlue.withOpacity(0.7),
      ColorStyles.transparent,
    ],
    tileMode: TileMode.clamp,
  );

  static final shadowGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      ColorStyles.alto,
      ColorStyles.mercury,
      ColorStyles.mercury.withOpacity(0.5),
      ColorStyles.mercury.withOpacity(0.2),
      ColorStyles.white,
      ColorStyles.white,
      ColorStyles.white,
      ColorStyles.white,
      ColorStyles.white,
      ColorStyles.white,
    ],
    tileMode: TileMode.clamp,
  );
}

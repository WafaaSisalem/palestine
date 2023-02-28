import 'package:flutter/material.dart';

import 'colorhelper.dart';

class AppTextStyles {
  static buildKohinoorGujaratiTextStyle(
      {Color color = ColorHelper.black23, double size = 15}) {
    return TextStyle(
      fontSize: size,
      color: color,
    );
  }
}

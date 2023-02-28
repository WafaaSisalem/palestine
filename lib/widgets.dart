import 'package:flutter/material.dart';

import 'colorhelper.dart';

BoxDecoration buildBorderStyle() {
  return BoxDecoration(
      border: Border.all(
        color: ColorHelper.black2B,
      ),
      borderRadius: BorderRadius.circular(4));
}

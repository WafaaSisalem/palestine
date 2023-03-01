import 'package:flutter/material.dart';

import 'colorhelper.dart';
import 'widgets.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
  });
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 296,
      height: 44,
      decoration: buildBorderStyle(),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: ColorHelper.black33,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

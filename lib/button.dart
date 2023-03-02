import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text_style.dart';
import 'colorhelper.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    Key? key,
    required this.btnName,
    required this.width,
    required this.onPressed,
    this.fontsize = 15,
    this.height = 44,
  }) : super(key: key);
  final String btnName;
  final VoidCallback onPressed;
  final double width;
  final double fontsize;
  double height;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorHelper.green64,
        fixedSize: Size(width, height),
        padding: EdgeInsets.symmetric(horizontal: 47),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          btnName,
          style: AppTextStyles.buildKohinoorGujaratiTextStyle(
              color: Colors.white, size: fontsize),
        ),
      ),
    );
  }
}

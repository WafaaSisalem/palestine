import 'package:flutter/material.dart';
import 'asset_helper.dart';
import 'colorhelper.dart';

class AppTextStyles {
  static buildKohinoorGujaratiBoldTextStyle(
      {Color color = ColorHelper.black23, double size = 15}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: AssetsHelper.kohGujFontFamily,
      fontWeight: FontWeight.w700,
    );
  }

  static buildKohinoorGujaratiLightTextStyle(
      {Color color = Colors.black, double size = 17}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: AssetsHelper.kohGujFontFamily,
      fontWeight: FontWeight.w300,
    );
  }

  static buildKohinoorGujaratiNormalTextStyle(
      {Color color = ColorHelper.black33, double size = 18}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: AssetsHelper.kohGujFontFamily,
      fontWeight: FontWeight.w400,
    );
  }

  static buildPoppinsMediumTextStyle(
      {Color color = Colors.black, double size = 20}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: AssetsHelper.kohGujFontFamily,

      ///make it Poppins
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle buildInterRegularTextStyle(
      {Color color = Colors.black, double size = 24}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: AssetsHelper.kohGujFontFamily,

      ///make it Inter
      fontWeight: FontWeight.w400,
    );
  }

  static buildKohinoorTeluguBoldTextStyle(
      {Color color = Colors.black, double size = 24}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: AssetsHelper.kohGujFontFamily,

      ///make it KohinoorTelugu
      fontWeight: FontWeight.bold,
    );
  }

  static buildKohinoorTeluguMediumTextStyle(
      {Color color = Colors.black, double size = 25}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: AssetsHelper.kohGujFontFamily,

      ///make it KohinoorTelugu
      fontWeight: FontWeight.w500,
    );
  }

  static buildKohinoorTeluguSemiBoldTextStyle(
      {Color color = Colors.white, double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: AssetsHelper.kohGujFontFamily,

      ///make it KohinoorTelugu
      fontWeight: FontWeight.w600,
    );
  }
}

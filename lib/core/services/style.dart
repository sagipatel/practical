import 'package:flutter/material.dart';

class CustomTextStyles {
  static normal(
      {required fontSize,
      required fontColor,
      bool? isUnderLine,
      bool? isLineThrough}) {
    return TextStyle(
      color: fontColor,
      fontFamily: "Roboto-Regular",
      fontSize: fontSize,
      decoration: isLineThrough == true
          ? TextDecoration.lineThrough
          : isUnderLine == true
              ? TextDecoration.underline
              : TextDecoration.none,
    );
  }

  static bold({
    required fontSize,
    required fontColor,
    fontWeight,
  }) {
    return TextStyle(
        color: fontColor,
        fontFamily: "Roboto-Bold",
        fontSize: fontSize,
        fontWeight: fontWeight);
  }

  static thin({
    required fontSize,
    required fontColor,
  }) {
    return TextStyle(
        color: fontColor, fontFamily: "Roboto-Thin", fontSize: fontSize);
  }

  static medium({required fontSize, required fontColor, bool? isUnderLine}) {
    return TextStyle(
      color: fontColor,
      fontFamily: "Roboto-Medium",
      fontSize: fontSize,
      decoration:
          isUnderLine == true ? TextDecoration.underline : TextDecoration.none,
    );
  }
}

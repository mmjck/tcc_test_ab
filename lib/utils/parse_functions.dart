import 'package:flutter/material.dart';
import 'package:tcc_test_ab/assets/fonts/fonts.dart';
import 'package:tcc_test_ab/components/buttons/button.dart';

FontWeight parseWeight(int weight) {
  switch (weight) {
    case 700:
      return FontWeight.w700;
    case 400:
      return FontWeight.w400;
    default:
      return FontWeight.bold;
  }
}

String parseFonts(String variant) {
  switch (variant) {
    case "primary":
      return Fonts.poppins;

    case "secondary":
      return Fonts.openSeans;

    default:
      return Fonts.openSeans;
  }
}

Color parseColors(String color) {
  switch (color) {
    case "red":
      return Colors.red;

    case "blue":
      return Colors.blue;

    case "white":
      return Colors.white;

    default:
      return Colors.black;
  }
}

ButtonType parseButtonType(String type) {
  switch (type) {
    case "icon_button":
      return ButtonType.icon;
    case "elevated":
      return ButtonType.elevated;
    case "outlined":
      return ButtonType.outlined;
    default:
      return ButtonType.elevated;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tcc_test_ab/assets/fonts/fonts.dart';

class TypographyVariant extends StatelessWidget {
  final String text;
  final String fontsFamily;
  final double fontSize;
  final FontWeight weight;

  const TypographyVariant({
    super.key,
    required this.text,
    required this.weight,
    required this.fontsFamily,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: weight,
        fontSize: fontSize,
        fontFamily: fontsFamily,
      ),
    );
  }
}

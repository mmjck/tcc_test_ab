import 'dart:convert';

import 'package:deep_pick/deep_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mix/mix.dart';
import 'package:tcc_test_ab/assets/fonts/fonts.dart';
import 'package:tcc_test_ab/components/typography/typography.dart';
import 'package:tcc_test_ab/utils/parse_functions.dart';

enum ButtonType { elevated, icon, outlined }

class ElevatedProps {
  final String text;

  final Color textColor;
  final Color bgColor;

  ElevatedProps({
    required this.text,
    this.textColor = Colors.white,
    this.bgColor = Colors.black,
  });

  factory ElevatedProps.fromJson(Map<String, dynamic> json) {
    return ElevatedProps(
      text: pick(json, "text").asStringOrThrow(),
      textColor: pick(json, "text_color").letOrThrow(
        (e) => parseColors(
          e.asStringOrThrow(),
        ),
      ),
      bgColor: pick(json, "bg_color").letOrThrow(
        (e) => parseColors(
          e.asStringOrThrow(),
        ),
      ),
    );
  }
}

class IconButtonProps {
  final Icon icon;
  final Color iconColor;
  final Color bgColor;
  IconButtonProps({
    required this.icon,
    this.iconColor = Colors.white,
    this.bgColor = Colors.black,
  });

  factory IconButtonProps.fromJson(Map<String, dynamic> json) {
    return IconButtonProps(
      icon: pick(json, "icon").letOrThrow(
        (p0) => Icon(
          parseIcon(
            p0.asStringOrThrow(),
          ),
        ),
      ),
      iconColor: Colors.white,
      bgColor: Colors.black,
    );
  }

  static IconData parseIcon(String icon) {
    switch (icon) {
      case "arrow_left":
        return Icons.arrow_left;
      case "arrow_right":
        return Icons.arrow_right;
      default:
        return Icons.question_answer;
    }
  }
}

class CustomButton extends StatelessWidget {
  final ButtonType variant;
  final IconButtonProps? iconButtonProps;

  final ElevatedProps? elevatedProps;

  final Function() onPress;
  const CustomButton({
    super.key,
    required this.variant,
    required this.onPress,
    this.iconButtonProps,
    this.elevatedProps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildButton());
  }

  Widget _buildButton() {
    switch (variant) {
      case ButtonType.elevated:
        return _buildPrimaryButton();
      case ButtonType.icon:
        return _buildIconButton();
      case ButtonType.outlined:
        return _buildPrimaryButton();
    }
  }

  Widget _buildPrimaryButton() {
    final mix = Mix(
      p(20),
      width(double.infinity),
      rounded(20),
      (press)(
        // when pressing, bg color is a darker grey
        bgColor(Colors.grey.shade600),
      ),
      (hover)(
        // when hovering, bg color is a lighter grey
        bgColor(Colors.grey.shade300),
      ),
      elevation(1),
      bgColor(elevatedProps!.bgColor),
    );
    return Pressable(
        onPressed: () {
          print("called");
        },
        child: Box(
          mix: mix,
          child: TypographyVariant(
            text: elevatedProps!.text,
            weight: FontWeight.w600,
            fontsFamily: Fonts.poppins,
            fontSize: 14,
            color: elevatedProps!.textColor,
          ),
        ));
  }

  Widget _buildIconButton() {
    return Container(
      decoration: BoxDecoration(
        color: iconButtonProps!.bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      child: IconButton(
        icon: iconButtonProps!.icon,
        iconSize: 40,
        color: iconButtonProps!.iconColor,
        onPressed: () {},
      ),
    );
  }
}

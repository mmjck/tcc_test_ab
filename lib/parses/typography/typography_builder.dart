import "package:child_builder/src/child_widget_builder.dart";

import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:tcc_test_ab/components/typography/typography.dart";
import "package:tcc_test_ab/utils/parse_functions.dart";

class TypographyBuilder extends JsonWidgetBuilder {
  final String text;
  final String fontsFamily;
  final double fontSize;
  final FontWeight weight;
  final Color color;

  static const type = "typography_variant";

  const TypographyBuilder({
    required this.color,
    required this.text,
    required this.weight,
    required this.fontsFamily,
    required this.fontSize,
    required super.numSupportedChildren,
  });

  factory TypographyBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    JsonWidgetRegistry? registry,
  }) {
    return TypographyBuilder(
      fontSize: pick(json, "font_size").asDoubleOrThrow(),
      fontsFamily: pick(json, "font_family").letOrThrow((e) => parseFonts(
            e.asStringOrThrow(),
          )),
      text: pick(json, "text").asStringOrThrow(),
      weight:
          pick(json, "weight").letOrThrow((e) => parseWeight(e.asIntOrThrow())),
      numSupportedChildren: 0,
      color: pick(json, "color")
          .letOrThrow((e) => parseColors(e.asStringOrThrow())),
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return TypographyVariant(
      fontSize: fontSize,
      fontsFamily: fontsFamily,
      text: text,
      weight: weight,
      color: color,
    );
  }
}

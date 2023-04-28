import "package:child_builder/src/child_widget_builder.dart";

import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:tcc_test_ab/components/typography/typography.dart";
import "package:tcc_test_ab/utils/parse_functions.dart";

import "../../components/buttons/button.dart";

class ButtonsBuilder extends JsonWidgetBuilder {
  final ButtonType variant;
  final IconButtonProps? iconButtonProps;

  final ElevatedProps? elevatedProps;

  final Function onPress;

  static const type = "custom_button";

  const ButtonsBuilder({
    required this.variant,
    required this.onPress,
    this.iconButtonProps,
    this.elevatedProps,
    required super.numSupportedChildren,
  });

  factory ButtonsBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    JsonWidgetRegistry? registry,
  }) {
    return ButtonsBuilder(
      numSupportedChildren: 1,
      onPress: () => debugPrint('my awesome button was pressed'),
      variant: pick(json, "variant").letOrThrow(
        (p0) => parseButtonType(
          p0.asStringOrThrow(),
        ),
      ),
      iconButtonProps: pick(json, "icon_props").letOrNull(
        (p0) => IconButtonProps.fromJson(
          p0.asMapOrThrow(),
        ),
      ),
      elevatedProps: pick(json, "elevated_props").letOrNull(
        (p0) => ElevatedProps.fromJson(
          p0.asMapOrThrow(),
        ),
      ),
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return CustomButton(
      iconButtonProps: iconButtonProps,
      elevatedProps: elevatedProps,
      onPress: () {},
      variant: variant,
    );
  }
}

import "dart:convert";

import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

typedef BuilderConstructorWidget<T extends JsonWidgetBuilder> = T Function(
  Map<dynamic, dynamic> json, {
  JsonWidgetRegistry? registry,
});

class ParserService {
  late final JsonWidgetRegistry registry;

  ParserService() {
    registry = JsonWidgetRegistry.instance;
  }

  Widget buildJson({
    required String json,
    required BuildContext context,
  }) {
    print({"json", json});
    final jsonData = jsonDecode(json) as Map<String, dynamic>;

    final data = JsonWidgetData.fromDynamic(jsonData, registry: registry)!;
    return data.build(context: context);
  }

  void bindComponents<T extends JsonWidgetBuilder>(
    String type,
    BuilderConstructorWidget builder,
  ) {
    registry.registerCustomBuilder(
      type,
      JsonWidgetBuilderContainer(
        builder: (map, {registry}) =>
            builder(map as Map<dynamic, dynamic>, registry: registry),
      ),
    );
  }
}

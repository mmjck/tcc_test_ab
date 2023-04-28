import "package:flutter/material.dart";
import "package:tcc_test_ab/parser_service.dart";

class DynamicView extends StatelessWidget {
  const DynamicView({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildElements(context);
  }

  Widget _buildElements(BuildContext context) {
    const jsonData = """{
  "type": "typography_variant",
  "args": {
    "font_size": 20,
    "font_family": "primary",
    "text": "DynamicView",
    "weight": 700,
    "color": "red"
  }
}""";

    const jsonDataV = """{
  "type": "typography_variant",
  "args": {
    "font_size": 40,
    "font_family": "secondary",
    "text": "DynamicView",
    "color": "blue",
    "weight": 123
  }
}""";
    return Column(
      children: [
        ParserService().buildJson(json: jsonData, context: context),
        ParserService().buildJson(json: jsonDataV, context: context),
      ],
    );
  }
}

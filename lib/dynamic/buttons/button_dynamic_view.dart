import "package:flutter/material.dart";
import "package:tcc_test_ab/parser_service.dart";

class ButtonsDynamicView extends StatelessWidget {
  const ButtonsDynamicView({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildElements(context);
  }

  Widget _buildElements(BuildContext context) {
    const jsonData = """{
  "type": "custom_button",
  "args": {
    "variant": "icon_button",
    "icon_props": {
      "icon": "arrow_left"
    }
  }
}""";

    const jsonDataV = """{
  "type": "custom_button",
  "args": {
    "variant": "elevated",
    "elevated_props": {
      "text": "arrow_left",
      "text_color": "red",
      "bg_color": "white"
    }
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

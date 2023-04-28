import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tcc_test_ab/dynamic/buttons/buttons_builder.dart';
import 'package:tcc_test_ab/dynamic/typography/typography_builder.dart';
import 'package:tcc_test_ab/firebase_options.dart';
import 'package:tcc_test_ab/parser_service.dart';
import 'package:tcc_test_ab/remote_config/remote_config.dart';
import 'package:tcc_test_ab/utils/app.dart';

Future<void> main() async {
  await initialize();
  runApp(const App());
}

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await RemoteConfig.initalize();
  register();
}

void register() {
  final parserService = ParserService();

  parserService.bindComponents(
    TypographyBuilder.type,
    TypographyBuilder.fromDynamic,
  );

  parserService.bindComponents(
    ButtonsBuilder.type,
    ButtonsBuilder.fromDynamic,
  );
}

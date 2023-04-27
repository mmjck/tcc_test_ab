import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tcc_test_ab/assets/fonts/fonts.dart';
import 'package:tcc_test_ab/components/typography/typography.dart';
import 'package:tcc_test_ab/dyamic_view.dart';
import 'package:tcc_test_ab/firebase_options.dart';
import 'package:tcc_test_ab/parser_service.dart';
import 'package:tcc_test_ab/remote_config/keys.dart';
import 'package:tcc_test_ab/remote_config/remote_config.dart';
import 'package:tcc_test_ab/parses/typography/typography_builder.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final parserService = ParserService();

  parserService.bindComponents(
    TypographyBuilder.type,
    TypographyBuilder.fromDynamic,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await RemoteConfig.initalize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildText(),
              const SizedBox(
                height: 20,
              ),
              _buildImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Column(
      children: [
        DynamicView(),
        TypographyVariant(
          fontSize: 20,
          fontsFamily: Fonts.poppins,
          text: RemoteConfig.getString(RemoteConfigKeys.simpleText),
          weight: FontWeight.bold,
          color: Colors.red,
        ),
        TypographyVariant(
          fontSize: 20,
          color: Colors.red,
          fontsFamily: Fonts.poppins,
          text: RemoteConfig.getString(RemoteConfigKeys.simpleText),
          weight: FontWeight.bold,
        )
      ],
    );
  }

  Widget _buildImage() {
    return Image.network(RemoteConfig.getString(RemoteConfigKeys.simpleImage));
  }
}

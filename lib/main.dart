import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tcc_test_ab/assets/fonts/fonts.dart';
import 'package:tcc_test_ab/firebase_options.dart';
import 'package:tcc_test_ab/remote_config/keys.dart';
import 'package:tcc_test_ab/remote_config/remote_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        Text(
          RemoteConfig.getString(RemoteConfigKeys.simpleText),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: Fonts.openSeans,
          ),
        ),
        Text(
          RemoteConfig.getString(RemoteConfigKeys.simpleText),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            fontFamily: Fonts.poppins,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Image.network(RemoteConfig.getString(RemoteConfigKeys.simpleImage));
  }
}

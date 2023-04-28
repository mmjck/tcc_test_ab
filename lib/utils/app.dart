import 'package:flutter/material.dart';
import 'package:tcc_test_ab/assets/fonts/fonts.dart';
import 'package:tcc_test_ab/components/buttons/button.dart';
import 'package:tcc_test_ab/components/typography/typography.dart';
import 'package:tcc_test_ab/dynamic/buttons/button_dynamic_view.dart';
import 'package:tcc_test_ab/remote_config/keys.dart';
import 'package:tcc_test_ab/remote_config/remote_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter'),
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
        // DynamicView(),

        ButtonsDynamicView(),

        CustomButton(
          iconButtonProps: IconButtonProps(
            bgColor: Colors.red,
            icon: const Icon(
              Icons.arrow_right,
            ),
          ),
          variant: ButtonType.icon,
          onPress: () {},
        ),
        CustomButton(
          variant: ButtonType.elevated,
          elevatedProps: ElevatedProps(
            text: "elevated props",
            bgColor: Colors.black,
            textColor: Colors.white,
          ),
          onPress: () {},
        ),
        TypographyVariant(
          fontSize: 20,
          fontsFamily: Fonts.poppins,
          text: RemoteConfig.getString(RemoteConfigKeys.simpleText),
          weight: FontWeight.bold,
          color: Colors.red,
        ),
        TypographyVariant(
          fontSize: 20,
          color: Color.fromARGB(255, 10, 10, 10),
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

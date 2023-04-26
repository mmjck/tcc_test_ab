import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:tcc_test_ab/remote_config/keys.dart';

class RemoteConfig {
  RemoteConfig._();

  static final _defaultValues = {
    RemoteConfigKeys.simpleImage: "",
    RemoteConfigKeys.simpleText: "",
  };

  static final _remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> initalize() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 1),
          minimumFetchInterval: const Duration(seconds: 1)),
    );

    await _remoteConfig.setDefaults(_defaultValues);

    await _remoteConfig.fetchAndActivate();
  }

  static String getString(String key) {
    return _remoteConfig.getString(key);
  }
}

// import 'package:firebase_remote_config/firebase_remote_config.dart';
//
// class FirebaseRemoteConfigService {
//   final RemoteConfig _remoteConfig;
//
//   FirebaseRemoteConfigService({RemoteConfig? remoteConfig})
//       : _remoteConfig = remoteConfig ?? RemoteConfig.instance;
//
//   Future<void> fetchAndActivate() async {
//     try {
//       await _remoteConfig.fetch(expiration: const Duration(minutes: 1));
//       await _remoteConfig.activateFetched();
//     } catch (exception) {
//       print('Failed to fetch remote config: $exception');
//     }
//   }
//
//   String getString(String key) {
//     return _remoteConfig.getString(key);
//   }
//
//   int getInt(String key) {
//     return _remoteConfig.getInt(key);
//   }
//
//   double getDouble(String key) {
//     return _remoteConfig.getDouble(key);
//   }
//
//   bool getBool(String key) {
//     return _remoteConfig.getBool(key);
//   }
// }

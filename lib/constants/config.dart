import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:online_shop/constants/urls.dart';


Future<void> remoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 5),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await remoteConfig.fetchAndActivate();
  // GET CONFIGS HERE
  AppUrls.backendBaseUrl = remoteConfig.getString('BACKEND_URL');
/*  print(AppUrls.backendBaseUrl);
  // BACKEND_URL is the parameter we have used in Firebase Remote Config*/

  return;
}

Future<bool> isUpdateRequired() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();

  final bool updateRequired = remoteConfig.getBool('force_update');
  var currentVersion = double.parse(remoteConfig.getString('current_version'));
  var appVersion = double.parse(remoteConfig.getString('app_version'));
  print(currentVersion);
  print(appVersion);

  return updateRequired && currentVersion > appVersion;
}

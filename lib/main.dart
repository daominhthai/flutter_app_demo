import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_demo/core/config/app_config.dart';
import 'package:flutter_app_demo/my_app.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  var configuredApp = AppConfig(
    flavor: Flavor.RELEASE,
    apiBaseUrl: 'https://apihrms.gsotgroup.vn',
    child: MyApp(),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(configuredApp);
}
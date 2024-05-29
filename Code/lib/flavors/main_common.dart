import 'dart:io';

import 'package:edublock/di/service_locator.dart';
import 'package:edublock/flavors/flavor_config.dart';
import 'package:edublock/presentation/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

var flavorConfigProvider;

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}

Future<void> mainCommon(FlavorConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientations();
  // await requestNetworkPermission();
   // Delete temporary directory
  // var appDir = (await getTemporaryDirectory()).path;
  // await new Directory(appDir).delete(recursive: true);
  await ServiceLocator.configureDependencies();

  flavorConfigProvider = StateProvider((ref) => config);

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Future<void> requestNetworkPermission() async {
//   var status = await Permission.;
//
//   if (status.isUndetermined) {
//     status = await Permission.network.request;
//   }
//
//   if (!status.isGranted) {
//     // Handle the situation where network permissions are denied.
//     // You might want to show a dialog or inform the user.
//     print("Network permissions denied");
//   }
// }

/*
import 'dart:async';

import 'package:edublock/di/service_locator.dart';
import 'package:edublock/presentation/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientations();
  await ServiceLocator.configureDependencies();
  runApp(MyApp());
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
*/

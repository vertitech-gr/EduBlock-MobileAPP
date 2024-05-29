// import 'dart:async'; //For StreamController/Stream
// import 'dart:io'; //InternetAddress utility
// import 'dart:js';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:edublock/utils/custom_flusbar/custom_flushbar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class ConnectionStatusSingleton {
//   //This creates the single instance by calling the `_internal` constructor specified below
//   static final ConnectionStatusSingleton _singleton =
//   ConnectionStatusSingleton._internal();
//
//   factory ConnectionStatusSingleton() {
//     return _singleton;
//   }
//
//   ConnectionStatusSingleton._internal();
//
//   //This is what's used to retrieve the instance through the app
//   static ConnectionStatusSingleton getInstance() => _singleton;
//
//   //This tracks the current connection status
//   bool hasConnection = false;
//
//   //This is how we'll allow subscribing to connection changes
//   StreamController connectionChangeController = StreamController.broadcast();
//
//   //flutter connectivity
//   final Connectivity connectivity = Connectivity();
//
//   //Hook into flutter connectivity's Stream to listen for changes
//   //And check the connection status out of the gate
//   Future<void> initialize() async {
//     // connectivity.onConnectivityChanged.listen(_connectionChange);
//     // await checkConnection();
//   }
//
//   Stream get connectionChange => connectionChangeController.stream;
//
//   //A clean up method to close our StreamController
//   //   Because this is meant to exist through the entire application life cycle this isn't
//   //   really an issue
//   void dispose() {
//     connectionChangeController.close();
//   }
//
//   //flutter connectivity's listener
//   void _connectionChange(ConnectivityResult result) {
//     // checkConnection();
//     if (result == ConnectivityResult.none) {
//       showNotification(context, 'success', 'success', value!.message);
//     } else {
//       // showToast("Got Internet Connection Back!!!", isError: false);
//     }
//   }
//
//
//   Future<bool> hasNetwork(String knownUrl) async {
//     if (kIsWeb) {
//       return _hasNetworkWeb(knownUrl);
//     } else {
//       return _hasNetworkMobile(knownUrl);
//     }
//   }
//
//
//   Future<bool> _hasNetworkMobile(String knownUrl) async {
//     try {
//       final result = await InternetAddress.lookup(knownUrl);
//       return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
//     } catch (_) {
//       rethrow;
//     }
//   }
//
// //The test to actually see if there is a connection
// // Future<bool> checkConnection() async {
// //   bool previousConnection = hasConnection;
// //   try {
// //     // hasConnection = await hasNetwork('https://ipapi.co');
// //     hasConnection = true;
// //     await Future.delayed(const Duration(milliseconds: 200));
// //   } catch (_) {
// //     hasConnection = false;
// //   }
// //
// //   //The connection status changed send out an update to all listeners
// //   if (previousConnection != hasConnection) {
// //     print("connection changed");
// //     connectionChangeController.add(hasConnection);
// //   }
// //   return hasConnection;
// // }
// }

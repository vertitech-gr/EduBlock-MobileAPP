import 'package:edublock/flavors/flavor_config.dart';
import 'package:edublock/flavors/main_common.dart';
import 'package:edublock/presentation/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


void main() {
  // Inject our own configurations
  // Development



  mainCommon(
    FlavorConfig()
      ..appTitle = "Edublock Development"
      ..apiEndPoints = "https://api2.edublock.bucle.dev/"
  );
}

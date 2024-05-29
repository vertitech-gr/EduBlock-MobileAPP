import 'package:edublock/flavors/flavor_config.dart';
import 'package:edublock/flavors/main_common.dart';
import 'package:flutter/material.dart';

void main() {
  // Inject our own configurations
  // Staging

  mainCommon(
    FlavorConfig()
      ..appTitle = "Edublock Staging"
  );
}

// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:permission_handler/permission_handler.dart';

Future<void> redirectToSettings(BuildContext context) async {
  bool isOpened = await openAppSettings();
  if (!isOpened) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Unable to open settings"),
      ),
    );
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

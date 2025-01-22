// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future refreshAPI(dynamic api) async {
  // refresh this api

  // Make a request to refresh the API
  try {
    var response = await api.refresh();
    if (response.statusCode == 200) {
      // API refreshed successfully
      print('API refreshed successfully');
    } else {
      // API refresh failed
      print('API refresh failed');
    }
  } catch (e) {
    // Error occurred while refreshing API
    print('Error occurred while refreshing API: $e');
  }
}

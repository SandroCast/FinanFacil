// Automatic FlutterFlow imports
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:uuid/uuid.dart';

Future<String> geraUnicoID() async {
  // Add your function code here!
  var uuid = Uuid();

  String uniqueId = uuid.v4(); // Gera um UUID v4 (aleatório)

  return uniqueId;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

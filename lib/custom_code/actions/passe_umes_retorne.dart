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

Future passeUmesRetorne(
  DateTime diaDoPedido,
  String qualPlano,
  bool alerta,
) async {
  // caso passe um mês mude qualPlano para sem plano e alerta para true

  DateTime proximoMes = diaDoPedido.add(Duration(days: 30));

  if (proximoMes.month != diaDoPedido.month) {
    qualPlano = "Sem plano";
    alerta = true;
  }

  return {"qualPlano": qualPlano, "alerta": alerta};
}

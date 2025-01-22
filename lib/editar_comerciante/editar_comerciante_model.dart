import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/anuncios_removidos_widget.dart';
import '/components/contadeletada_widget.dart';
import '/components/lojista_bloqueado_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'editar_comerciante_widget.dart' show EditarComercianteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarComercianteModel extends FlutterFlowModel<EditarComercianteWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in editarComerciante widget.
  AnuncioRecord? anuncios;
  // Stores action output result for [Firestore Query - Query a collection] action in editarComerciante widget.
  List<AnuncioRecord>? anunciosList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

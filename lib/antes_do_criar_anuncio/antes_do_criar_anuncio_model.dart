import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/planos_componente_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'antes_do_criar_anuncio_widget.dart' show AntesDoCriarAnuncioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AntesDoCriarAnuncioModel
    extends FlutterFlowModel<AntesDoCriarAnuncioWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in antesDoCriarAnuncio widget.
  LojistasRecord? queryLojas;
  // Stores action output result for [Firestore Query - Query a collection] action in antesDoCriarAnuncio widget.
  PrestadoresDeServicosRecord? queryPrestador;
  // Model for planosComponente component.
  late PlanosComponenteModel planosComponenteModel;

  @override
  void initState(BuildContext context) {
    planosComponenteModel = createModel(context, () => PlanosComponenteModel());
  }

  @override
  void dispose() {
    planosComponenteModel.dispose();
  }
}

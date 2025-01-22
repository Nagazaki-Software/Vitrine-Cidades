import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nao_existe_lojas_cadastradas_widget.dart';
import '/components/search_pagina_inicial_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_widget.dart' show SearchWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in search widget.
  PrestadoresDeServicosRecord? querryPrestadores;
  // Model for searchPaginaInicial component.
  late SearchPaginaInicialModel searchPaginaInicialModel;

  @override
  void initState(BuildContext context) {
    searchPaginaInicialModel =
        createModel(context, () => SearchPaginaInicialModel());
  }

  @override
  void dispose() {
    searchPaginaInicialModel.dispose();
  }
}

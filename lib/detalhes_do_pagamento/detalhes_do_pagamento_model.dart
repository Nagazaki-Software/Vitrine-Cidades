import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/pagamentoestornado_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'detalhes_do_pagamento_widget.dart' show DetalhesDoPagamentoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetalhesDoPagamentoModel
    extends FlutterFlowModel<DetalhesDoPagamentoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (estornos)] action in Button widget.
  ApiCallResponse? apiResultcn7;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/pagamentoconfirmado_pix_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'processar_pagamento_widget.dart' show ProcessarPagamentoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProcessarPagamentoModel
    extends FlutterFlowModel<ProcessarPagamentoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (recuperar status)] action in processarPagamento widget.
  ApiCallResponse? recuperarStatus;
  // Stores action output result for [Backend Call - API (recuperar status)] action in Button widget.
  ApiCallResponse? apiResultvem;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

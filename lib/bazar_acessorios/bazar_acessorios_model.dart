import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nao_existe_lojas_cadastradas_widget.dart';
import '/components/pesquisar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'bazar_acessorios_widget.dart' show BazarAcessoriosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BazarAcessoriosModel extends FlutterFlowModel<BazarAcessoriosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for pesquisar component.
  late PesquisarModel pesquisarModel;

  @override
  void initState(BuildContext context) {
    pesquisarModel = createModel(context, () => PesquisarModel());
  }

  @override
  void dispose() {
    pesquisarModel.dispose();
  }
}

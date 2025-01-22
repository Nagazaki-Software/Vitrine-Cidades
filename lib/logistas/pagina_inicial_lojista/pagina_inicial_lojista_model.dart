import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/anuncio_na_frente_widget.dart';
import '/components/componente_pagina_de_logista_widget.dart';
import '/components/componente_pagina_de_servicos_widget.dart';
import '/components/continue_com_widget.dart';
import '/components/drawers_widget.dart';
import '/components/mudar_localizacao_widget.dart';
import '/components/search_pagina_inicial_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'pagina_inicial_lojista_widget.dart' show PaginaInicialLojistaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaInicialLojistaModel
    extends FlutterFlowModel<PaginaInicialLojistaWidget> {
  ///  Local state fields for this page.

  bool navbar = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PaginaInicialLojista widget.
  List<AnuncioRecord>? queryAnuncio;
  // Model for searchPaginaInicial component.
  late SearchPaginaInicialModel searchPaginaInicialModel;
  // Model for ComponentePaginaDeLogista component.
  late ComponentePaginaDeLogistaModel componentePaginaDeLogistaModel;
  // Model for ComponentePaginaDeServicos component.
  late ComponentePaginaDeServicosModel componentePaginaDeServicosModel;
  // Model for continueCom component.
  late ContinueComModel continueComModel;
  // Model for drawers component.
  late DrawersModel drawersModel;

  @override
  void initState(BuildContext context) {
    searchPaginaInicialModel =
        createModel(context, () => SearchPaginaInicialModel());
    componentePaginaDeLogistaModel =
        createModel(context, () => ComponentePaginaDeLogistaModel());
    componentePaginaDeServicosModel =
        createModel(context, () => ComponentePaginaDeServicosModel());
    continueComModel = createModel(context, () => ContinueComModel());
    drawersModel = createModel(context, () => DrawersModel());
  }

  @override
  void dispose() {
    searchPaginaInicialModel.dispose();
    componentePaginaDeLogistaModel.dispose();
    componentePaginaDeServicosModel.dispose();
    continueComModel.dispose();
    drawersModel.dispose();
  }
}

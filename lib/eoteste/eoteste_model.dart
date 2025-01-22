import '/components/mais_visitados_widget.dart';
import '/components/sessoes_circular_logista_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/paginas_iniciais/banner_container/banner_container_widget.dart';
import '/paginas_iniciais/componentes_pagina_inicial/aba_mais_populares/aba_mais_populares_widget.dart';
import '/paginas_iniciais/componentes_pagina_inicial/aba_mais_vendidos/aba_mais_vendidos_widget.dart';
import 'dart:ui';
import 'eoteste_widget.dart' show EotesteWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EotesteModel extends FlutterFlowModel<EotesteWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BannerContainer component.
  late BannerContainerModel bannerContainerModel;
  // Model for sessoesCircularLogista component.
  late SessoesCircularLogistaModel sessoesCircularLogistaModel;
  // Model for maisVisitados component.
  late MaisVisitadosModel maisVisitadosModel;
  // Model for AbaMaisPopulares component.
  late AbaMaisPopularesModel abaMaisPopularesModel;
  // Model for AbaMaisVendidos component.
  late AbaMaisVendidosModel abaMaisVendidosModel;

  @override
  void initState(BuildContext context) {
    bannerContainerModel = createModel(context, () => BannerContainerModel());
    sessoesCircularLogistaModel =
        createModel(context, () => SessoesCircularLogistaModel());
    maisVisitadosModel = createModel(context, () => MaisVisitadosModel());
    abaMaisPopularesModel = createModel(context, () => AbaMaisPopularesModel());
    abaMaisVendidosModel = createModel(context, () => AbaMaisVendidosModel());
  }

  @override
  void dispose() {
    bannerContainerModel.dispose();
    sessoesCircularLogistaModel.dispose();
    maisVisitadosModel.dispose();
    abaMaisPopularesModel.dispose();
    abaMaisVendidosModel.dispose();
  }
}

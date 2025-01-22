import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nenhum_prestador_disponivel_widget.dart';
import '/components/sessoes_circular_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/paginas_iniciais/componentes_pagina_inicial/banner_container_para_servicos/banner_container_para_servicos_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'componente_pagina_de_servicos_copy_widget.dart'
    show ComponentePaginaDeServicosCopyWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponentePaginaDeServicosCopyModel
    extends FlutterFlowModel<ComponentePaginaDeServicosCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for BannerContainerParaServicos component.
  late BannerContainerParaServicosModel bannerContainerParaServicosModel;
  // Model for sessoesCircular component.
  late SessoesCircularModel sessoesCircularModel;

  @override
  void initState(BuildContext context) {
    bannerContainerParaServicosModel =
        createModel(context, () => BannerContainerParaServicosModel());
    sessoesCircularModel = createModel(context, () => SessoesCircularModel());
  }

  @override
  void dispose() {
    bannerContainerParaServicosModel.dispose();
    sessoesCircularModel.dispose();
  }
}

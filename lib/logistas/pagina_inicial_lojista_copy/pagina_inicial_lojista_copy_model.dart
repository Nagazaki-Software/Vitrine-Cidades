import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/componente_pagina_de_logista_copy_widget.dart';
import '/components/componente_pagina_de_servicos_copy_widget.dart';
import '/components/continue_com_widget.dart';
import '/components/search_pagina_inicial_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'pagina_inicial_lojista_copy_widget.dart'
    show PaginaInicialLojistaCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaInicialLojistaCopyModel
    extends FlutterFlowModel<PaginaInicialLojistaCopyWidget> {
  ///  Local state fields for this page.

  bool navbar = false;

  ///  State fields for stateful widgets in this page.

  // Model for searchPaginaInicial component.
  late SearchPaginaInicialModel searchPaginaInicialModel;
  // Model for ComponentePaginaDeLogistaCopy component.
  late ComponentePaginaDeLogistaCopyModel componentePaginaDeLogistaCopyModel;
  // Model for ComponentePaginaDeServicosCopy component.
  late ComponentePaginaDeServicosCopyModel componentePaginaDeServicosCopyModel;
  // Model for continueCom component.
  late ContinueComModel continueComModel;

  @override
  void initState(BuildContext context) {
    searchPaginaInicialModel =
        createModel(context, () => SearchPaginaInicialModel());
    componentePaginaDeLogistaCopyModel =
        createModel(context, () => ComponentePaginaDeLogistaCopyModel());
    componentePaginaDeServicosCopyModel =
        createModel(context, () => ComponentePaginaDeServicosCopyModel());
    continueComModel = createModel(context, () => ContinueComModel());
  }

  @override
  void dispose() {
    searchPaginaInicialModel.dispose();
    componentePaginaDeLogistaCopyModel.dispose();
    componentePaginaDeServicosCopyModel.dispose();
    continueComModel.dispose();
  }
}

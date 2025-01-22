import '/components/mais_visitados_copy2_widget.dart';
import '/components/sessoes_circular_logista_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/paginas_iniciais/banner_container_copy2/banner_container_copy2_widget.dart';
import '/paginas_iniciais/componentes_pagina_inicial/aba_mais_populares_copy/aba_mais_populares_copy_widget.dart';
import '/paginas_iniciais/componentes_pagina_inicial/aba_mais_vendidos/aba_mais_vendidos_widget.dart';
import 'dart:ui';
import 'componente_pagina_de_logista_copy_widget.dart'
    show ComponentePaginaDeLogistaCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponentePaginaDeLogistaCopyModel
    extends FlutterFlowModel<ComponentePaginaDeLogistaCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for BannerContainerCopy2 component.
  late BannerContainerCopy2Model bannerContainerCopy2Model;
  // Model for sessoesCircularLogistaCopy component.
  late SessoesCircularLogistaCopyModel sessoesCircularLogistaCopyModel;
  // Model for maisVisitadosCopy2 component.
  late MaisVisitadosCopy2Model maisVisitadosCopy2Model;
  // Model for AbaMaisPopularesCopy component.
  late AbaMaisPopularesCopyModel abaMaisPopularesCopyModel;
  // Model for AbaMaisVendidos component.
  late AbaMaisVendidosModel abaMaisVendidosModel;

  @override
  void initState(BuildContext context) {
    bannerContainerCopy2Model =
        createModel(context, () => BannerContainerCopy2Model());
    sessoesCircularLogistaCopyModel =
        createModel(context, () => SessoesCircularLogistaCopyModel());
    maisVisitadosCopy2Model =
        createModel(context, () => MaisVisitadosCopy2Model());
    abaMaisPopularesCopyModel =
        createModel(context, () => AbaMaisPopularesCopyModel());
    abaMaisVendidosModel = createModel(context, () => AbaMaisVendidosModel());
  }

  @override
  void dispose() {
    bannerContainerCopy2Model.dispose();
    sessoesCircularLogistaCopyModel.dispose();
    maisVisitadosCopy2Model.dispose();
    abaMaisPopularesCopyModel.dispose();
    abaMaisVendidosModel.dispose();
  }
}

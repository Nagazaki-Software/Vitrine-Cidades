import '/components/mais_visitados_copy2_widget.dart';
import '/components/sessoes_circular_logista_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/paginas_iniciais/banner_container_copy2/banner_container_copy2_widget.dart';
import '/paginas_iniciais/componentes_pagina_inicial/aba_mais_populares_copy/aba_mais_populares_copy_widget.dart';
import '/paginas_iniciais/componentes_pagina_inicial/aba_mais_vendidos/aba_mais_vendidos_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_pagina_de_logista_copy_model.dart';
export 'componente_pagina_de_logista_copy_model.dart';

class ComponentePaginaDeLogistaCopyWidget extends StatefulWidget {
  const ComponentePaginaDeLogistaCopyWidget({super.key});

  @override
  State<ComponentePaginaDeLogistaCopyWidget> createState() =>
      _ComponentePaginaDeLogistaCopyWidgetState();
}

class _ComponentePaginaDeLogistaCopyWidgetState
    extends State<ComponentePaginaDeLogistaCopyWidget> {
  late ComponentePaginaDeLogistaCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentePaginaDeLogistaCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        wrapWithModel(
          model: _model.bannerContainerCopy2Model,
          updateCallback: () => safeSetState(() {}),
          child: BannerContainerCopy2Widget(),
        ),
        wrapWithModel(
          model: _model.sessoesCircularLogistaCopyModel,
          updateCallback: () => safeSetState(() {}),
          child: SessoesCircularLogistaCopyWidget(),
        ),
        wrapWithModel(
          model: _model.maisVisitadosCopy2Model,
          updateCallback: () => safeSetState(() {}),
          child: MaisVisitadosCopy2Widget(),
        ),
        wrapWithModel(
          model: _model.abaMaisPopularesCopyModel,
          updateCallback: () => safeSetState(() {}),
          child: AbaMaisPopularesCopyWidget(),
        ),
        if (responsiveVisibility(
          context: context,
          phone: false,
        ))
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 30.0),
            child: wrapWithModel(
              model: _model.abaMaisVendidosModel,
              updateCallback: () => safeSetState(() {}),
              child: AbaMaisVendidosWidget(),
            ),
          ),
      ],
    );
  }
}

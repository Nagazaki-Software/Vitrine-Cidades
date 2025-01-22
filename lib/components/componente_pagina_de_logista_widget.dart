import '/components/mais_visitados_widget.dart';
import '/components/sessoes_circular_logista_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/paginas_iniciais/banner_container/banner_container_widget.dart';
import '/paginas_iniciais/componentes_pagina_inicial/aba_mais_populares/aba_mais_populares_widget.dart';
import '/paginas_iniciais/componentes_pagina_inicial/aba_mais_vendidos/aba_mais_vendidos_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_pagina_de_logista_model.dart';
export 'componente_pagina_de_logista_model.dart';

class ComponentePaginaDeLogistaWidget extends StatefulWidget {
  const ComponentePaginaDeLogistaWidget({super.key});

  @override
  State<ComponentePaginaDeLogistaWidget> createState() =>
      _ComponentePaginaDeLogistaWidgetState();
}

class _ComponentePaginaDeLogistaWidgetState
    extends State<ComponentePaginaDeLogistaWidget> {
  late ComponentePaginaDeLogistaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentePaginaDeLogistaModel());

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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
          child: wrapWithModel(
            model: _model.bannerContainerModel,
            updateCallback: () => safeSetState(() {}),
            child: BannerContainerWidget(),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
          child: wrapWithModel(
            model: _model.sessoesCircularLogistaModel,
            updateCallback: () => safeSetState(() {}),
            child: SessoesCircularLogistaWidget(),
          ),
        ),
        wrapWithModel(
          model: _model.maisVisitadosModel,
          updateCallback: () => safeSetState(() {}),
          child: MaisVisitadosWidget(),
        ),
        wrapWithModel(
          model: _model.abaMaisPopularesModel,
          updateCallback: () => safeSetState(() {}),
          child: AbaMaisPopularesWidget(),
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

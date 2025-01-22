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
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'eoteste_model.dart';
export 'eoteste_model.dart';

class EotesteWidget extends StatefulWidget {
  /// melhore
  const EotesteWidget({super.key});

  @override
  State<EotesteWidget> createState() => _EotesteWidgetState();
}

class _EotesteWidgetState extends State<EotesteWidget> {
  late EotesteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EotesteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.barlow(),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 30.0),
                    child: wrapWithModel(
                      model: _model.abaMaisVendidosModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AbaMaisVendidosWidget(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

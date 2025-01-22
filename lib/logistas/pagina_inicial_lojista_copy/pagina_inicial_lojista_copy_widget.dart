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
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_inicial_lojista_copy_model.dart';
export 'pagina_inicial_lojista_copy_model.dart';

class PaginaInicialLojistaCopyWidget extends StatefulWidget {
  const PaginaInicialLojistaCopyWidget({super.key});

  @override
  State<PaginaInicialLojistaCopyWidget> createState() =>
      _PaginaInicialLojistaCopyWidgetState();
}

class _PaginaInicialLojistaCopyWidgetState
    extends State<PaginaInicialLojistaCopyWidget> {
  late PaginaInicialLojistaCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaInicialLojistaCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 130.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                    spreadRadius: 0.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          buttonSize: 44.0,
                                          icon: Icon(
                                            Icons.menu_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        Expanded(
                                          child: wrapWithModel(
                                            model:
                                                _model.searchPaginaInicialModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: SearchPaginaInicialWidget(),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.location_on_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                size: 24.0,
                                              ),
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Sua localização',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .rubik(),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                    Flexible(
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Text(
                                                          valueOrDefault<
                                                              String>(
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.enderecoDoUsuario,
                                                                ''),
                                                            'Adicione seu endereço',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .rubik(),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 2.0)),
                                ),
                              ),
                            ),
                            if (FFAppState().mudarPaginaInicial == false)
                              wrapWithModel(
                                model:
                                    _model.componentePaginaDeLogistaCopyModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ComponentePaginaDeLogistaCopyWidget(),
                              ),
                            if (FFAppState().mudarPaginaInicial)
                              wrapWithModel(
                                model:
                                    _model.componentePaginaDeServicosCopyModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ComponentePaginaDeServicosCopyWidget(),
                              ),
                          ].addToEnd(SizedBox(height: 24.0)),
                        ),
                      ),
                    ),
                    if (!loggedIn)
                      Stack(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        children: [
                          wrapWithModel(
                            model: _model.continueComModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ContinueComWidget(),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

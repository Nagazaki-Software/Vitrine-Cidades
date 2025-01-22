import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nenhum_prestador_disponivel_widget.dart';
import '/components/profissionais_widget.dart';
import '/components/sessoes_circular_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/paginas_iniciais/componentes_pagina_inicial/banner_container_para_servicos/banner_container_para_servicos_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_pagina_de_servicos_model.dart';
export 'componente_pagina_de_servicos_model.dart';

class ComponentePaginaDeServicosWidget extends StatefulWidget {
  const ComponentePaginaDeServicosWidget({super.key});

  @override
  State<ComponentePaginaDeServicosWidget> createState() =>
      _ComponentePaginaDeServicosWidgetState();
}

class _ComponentePaginaDeServicosWidgetState
    extends State<ComponentePaginaDeServicosWidget> {
  late ComponentePaginaDeServicosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentePaginaDeServicosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.bannerContainerParaServicosModel,
              updateCallback: () => safeSetState(() {}),
              child: BannerContainerParaServicosWidget(),
            ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              wrapWithModel(
                model: _model.sessoesCircularModel,
                updateCallback: () => safeSetState(() {}),
                child: SessoesCircularWidget(),
              ),
            StreamBuilder<List<PrestadoresDeServicosRecord>>(
              stream: queryPrestadoresDeServicosRecord(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitRipple(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 50.0,
                      ),
                    ),
                  );
                }
                List<PrestadoresDeServicosRecord>
                    containerPrestadoresDeServicosRecordList = snapshot.data!;

                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 3.0, 0.0, 0.0),
                          child: Text(
                            'Melhores profissionais',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.rubik(),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 5.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Builder(
                            builder: (context) {
                              final containerVar = functions
                                  .buscarPorRegiaoPrestador(
                                      containerPrestadoresDeServicosRecordList
                                          .toList(),
                                      currentUserDocument!
                                          .localizacaoDoUsuario!,
                                      30.0)
                                  .toList();
                              if (containerVar.isEmpty) {
                                return Center(
                                  child: Container(
                                    width: double.infinity,
                                    child: NenhumPrestadorDisponivelWidget(),
                                  ),
                                );
                              }

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(containerVar.length,
                                      (containerVarIndex) {
                                    final containerVarItem =
                                        containerVar[containerVarIndex];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'PerfilDoPrestador',
                                              queryParameters: {
                                                'lojistaReferencia':
                                                    serializeParam(
                                                  containerVarItem.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 75.0,
                                                  height: 75.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      containerVarItem
                                                          .fotoDePerfil,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/vitrine-app-on7ygn/assets/7ym4vifkb2sk/Logotipo_delicado_monograma_feminino_bege_e_branco.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  containerVarItem
                                                      .nomeEmpresarialDoComerciante,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.rubik(),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.profissionaisModel,
                updateCallback: () => safeSetState(() {}),
                child: ProfissionaisWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

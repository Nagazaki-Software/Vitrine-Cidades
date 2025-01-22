import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/paginas_iniciais/banner_container_copy_copy/banner_container_copy_copy_widget.dart';
import '/paginas_iniciais/container_banner_inicial/container_banner_inicial_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'banner_container_para_servicos_copy_model.dart';
export 'banner_container_para_servicos_copy_model.dart';

class BannerContainerParaServicosCopyWidget extends StatefulWidget {
  /// Container que agrupa o banner
  const BannerContainerParaServicosCopyWidget({super.key});

  @override
  State<BannerContainerParaServicosCopyWidget> createState() =>
      _BannerContainerParaServicosCopyWidgetState();
}

class _BannerContainerParaServicosCopyWidgetState
    extends State<BannerContainerParaServicosCopyWidget> {
  late BannerContainerParaServicosCopyModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BannerContainerParaServicosCopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (_model.pageViewCurrentIndex != null) {
        await Future.delayed(const Duration(milliseconds: 1400));
        await _model.pageViewController?.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        if (_model.pageViewCurrentIndex == 1) {
          await Future.delayed(const Duration(milliseconds: 1400));
          await _model.pageViewController?.animateToPage(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        } else {
          await Future.delayed(const Duration(milliseconds: 1400));
          await _model.pageViewController?.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        }
      }
      _model.querryAnuncio = await queryAnuncioRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);

      await _model.querryAnuncio!.reference.update({
        ...mapToFirestore(
          {
            'visualizacao': FieldValue.increment(1),
          },
        ),
      });
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitRipple(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 250.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.check_circle_sharp,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 10.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().mudarPaginaInicial = false;
                                    FFAppState().update(() {});
                                  },
                                  child: Text(
                                    'Mudar para compras',
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Serviços',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Barlow',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (FFAppState().mudarPaginaInicial)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.check_circle_sharp,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().mudarPaginaInicial =
                                              false;
                                          FFAppState().update(() {});
                                        },
                                        child: Text(
                                          'Mudar para compras',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<List<AnuncioRecord>>(
                stream: queryAnuncioRecord(
                  queryBuilder: (anuncioRecord) => anuncioRecord.where(
                    'comprasOuServicos',
                    isEqualTo: true,
                  ),
                ),
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
                  List<AnuncioRecord> containerAnuncioRecordList =
                      snapshot.data!;

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(9.0),
                    child: Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Color(0x00F1F4F8),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Builder(
                                  builder: (context) {
                                    final anuncio = functions
                                        .buscarPorRegiaoAnuncios(
                                            containerAnuncioRecordList.toList(),
                                            currentUserDocument
                                                        ?.localizacaoDoUsuario !=
                                                    null
                                                ? currentUserDocument!
                                                    .localizacaoDoUsuario!
                                                : currentUserLocationValue!,
                                            30.0)
                                        .toList();
                                    if (anuncio.isEmpty) {
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 200.0,
                                        child: BannerContainerCopyCopyWidget(),
                                      );
                                    }

                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      child: Stack(
                                        children: [
                                          PageView.builder(
                                            controller:
                                                _model.pageViewController ??=
                                                    PageController(
                                                        initialPage: max(
                                                            0,
                                                            min(
                                                                0,
                                                                anuncio.length -
                                                                    1))),
                                            onPageChanged: (_) =>
                                                safeSetState(() {}),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: anuncio.length,
                                            itemBuilder:
                                                (context, anuncioIndex) {
                                              final anuncioItem =
                                                  anuncio[anuncioIndex];
                                              return Container(
                                                width: double.infinity,
                                                child: Stack(
                                                  children: [
                                                    ContainerBannerInicialWidget(
                                                      key: Key(
                                                          'Keyam5_${anuncioIndex}_of_${anuncio.length}'),
                                                      img: anuncioItem.img,
                                                    ),
                                                    Stack(
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30.0,
                                                                        40.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  anuncioItem
                                                                      .titulo,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                    fontFamily:
                                                                        'Barlow',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    shadows: [
                                                                      Shadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        offset: Offset(
                                                                            0.5,
                                                                            0.5),
                                                                        blurRadius:
                                                                            0.5,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            30.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  anuncioItem
                                                                      .descricao,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                    fontFamily:
                                                                        'Barlow',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    shadows: [
                                                                      Shadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        offset: Offset(
                                                                            0.5,
                                                                            0.5),
                                                                        blurRadius:
                                                                            0.5,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            30.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  formatNumber(
                                                                    anuncioItem
                                                                        .preco,
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .periodDecimal,
                                                                    currency:
                                                                        'R\$',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                    fontFamily:
                                                                        'Barlow',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    shadows: [
                                                                      Shadow(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        offset: Offset(
                                                                            0.5,
                                                                            0.5),
                                                                        blurRadius:
                                                                            0.5,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 10.0),
                                              child: smooth_page_indicator
                                                  .SmoothPageIndicator(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: max(
                                                            0,
                                                            min(
                                                                0,
                                                                anuncio.length -
                                                                    1))),
                                                count: anuncio.length,
                                                axisDirection: Axis.horizontal,
                                                onDotClicked: (i) async {
                                                  await _model
                                                      .pageViewController!
                                                      .animateToPage(
                                                    i,
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.ease,
                                                  );
                                                  safeSetState(() {});
                                                },
                                                effect: smooth_page_indicator
                                                    .ExpandingDotsEffect(
                                                  expansionFactor: 3.0,
                                                  spacing: 8.0,
                                                  radius: 16.0,
                                                  dotWidth: 8.0,
                                                  dotHeight: 4.0,
                                                  dotColor: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  activeDotColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  paintStyle:
                                                      PaintingStyle.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ].addToEnd(SizedBox(height: 0.0)),
          ),
        ],
      ),
    );
  }
}

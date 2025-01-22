import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'continue_com_model.dart';
export 'continue_com_model.dart';

class ContinueComWidget extends StatefulWidget {
  /// bottom sheet logar ou registrar
  const ContinueComWidget({super.key});

  @override
  State<ContinueComWidget> createState() => _ContinueComWidgetState();
}

class _ContinueComWidgetState extends State<ContinueComWidget> {
  late ContinueComModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContinueComModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 12.0,
              color: Color(0x1A000000),
              offset: Offset(
                0.0,
                -4.0,
              ),
              spreadRadius: 0.0,
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              Text(
                'Bem-vindo!',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.barlow(),
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'Entre ou crie sua conta para continuar',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.rubik(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(
                    'slogan',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 350),
                      ),
                    },
                  );
                },
                text: 'Continue com Email',
                icon: Icon(
                  Icons.mail_outline,
                  color: FlutterFlowTheme.of(context).info,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 44.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.barlow(),
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(
                    'emConstrucao',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 350),
                      ),
                    },
                  );
                },
                text: 'Continue com Google',
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 44.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.barlow(),
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(
                    'emConstrucao',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 350),
                      ),
                    },
                  );
                },
                text: 'Continue com Apple',
                icon: Icon(
                  Icons.apple,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 44.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.barlow(),
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Continuando você concorda com os ',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.rubik(),
                            letterSpacing: 0.0,
                          ),
                    ),
                    TextSpan(
                      text: 'Termos',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.rubik(),
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                      mouseCursor: SystemMouseCursors.click,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          context.pushNamed(
                            'termoDeUsoDoApp',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 350),
                              ),
                            },
                          );
                        },
                    ),
                    TextSpan(
                      text: ' e nossa ',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.rubik(),
                            letterSpacing: 0.0,
                          ),
                    ),
                    TextSpan(
                      text: 'Poliítica de privacidade',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.rubik(),
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                      mouseCursor: SystemMouseCursors.click,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          context.pushNamed(
                            'politicadepriv',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 350),
                              ),
                            },
                          );
                        },
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        font: GoogleFonts.rubik(),
                        letterSpacing: 0.0,
                      ),
                ),
                textAlign: TextAlign.center,
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}

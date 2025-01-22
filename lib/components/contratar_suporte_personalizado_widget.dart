import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'contratar_suporte_personalizado_model.dart';
export 'contratar_suporte_personalizado_model.dart';

class ContratarSuportePersonalizadoWidget extends StatefulWidget {
  /// CONTAINER DE ANUNCIO: 30 REAIS O SUPORTE PERSONALIZADO
  const ContratarSuportePersonalizadoWidget({super.key});

  @override
  State<ContratarSuportePersonalizadoWidget> createState() =>
      _ContratarSuportePersonalizadoWidgetState();
}

class _ContratarSuportePersonalizadoWidgetState
    extends State<ContratarSuportePersonalizadoWidget> {
  late ContratarSuportePersonalizadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContratarSuportePersonalizadoModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              1.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Suporte Personalizado',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.barlow(),
                                letterSpacing: 0.0,
                              ),
                    ),
                    Text(
                      'Apenas R\$30,00',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.barlow(),
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Color(0x3FFF7900),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Icon(
                    Icons.support_agent,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 30.0,
                  ),
                ),
              ],
            ),
            Text(
              'Receba ajuda personalizada para suas dúvidas e projetos. Atendimento individual e dedicado para maximizar seu aprendizado.',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.rubik(),
                    letterSpacing: 0.0,
                  ),
            ),
            FFButtonWidget(
              onPressed: () async {
                FFAppState().contratarSuporte = true;
                FFAppState().update(() {});
              },
              text: 'Contratar Agora',
              options: FFButtonOptions(
                width: double.infinity,
                height: 45.0,
                padding: EdgeInsets.all(8.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.barlow(),
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}

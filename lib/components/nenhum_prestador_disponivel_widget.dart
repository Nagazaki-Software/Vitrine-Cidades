import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nenhum_prestador_disponivel_model.dart';
export 'nenhum_prestador_disponivel_model.dart';

class NenhumPrestadorDisponivelWidget extends StatefulWidget {
  /// container ainda nao existe nenhum prestador em sua regiao
  const NenhumPrestadorDisponivelWidget({super.key});

  @override
  State<NenhumPrestadorDisponivelWidget> createState() =>
      _NenhumPrestadorDisponivelWidgetState();
}

class _NenhumPrestadorDisponivelWidgetState
    extends State<NenhumPrestadorDisponivelWidget> {
  late NenhumPrestadorDisponivelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NenhumPrestadorDisponivelModel());

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
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Nenhum Prestador Disponível',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Barlow',
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              'Ainda não existem prestadores de serviço cadastrados em sua região. Por favor, tente novamente mais tarde.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Rubik',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nao_existe_lojas_cadastradas_model.dart';
export 'nao_existe_lojas_cadastradas_model.dart';

class NaoExisteLojasCadastradasWidget extends StatefulWidget {
  /// container nao existe nenhuma loja em sua regiao no momento
  const NaoExisteLojasCadastradasWidget({super.key});

  @override
  State<NaoExisteLojasCadastradasWidget> createState() =>
      _NaoExisteLojasCadastradasWidgetState();
}

class _NaoExisteLojasCadastradasWidgetState
    extends State<NaoExisteLojasCadastradasWidget> {
  late NaoExisteLojasCadastradasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NaoExisteLojasCadastradasModel());

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
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.store_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 64.0,
            ),
            Text(
              'Nenhuma loja disponível',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Barlow',
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              'No momento não existem lojas cadastradas em sua região. Por favor, tente novamente mais tarde.',
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

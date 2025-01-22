import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nenhum_produtodisonivel_model.dart';
export 'nenhum_produtodisonivel_model.dart';

class NenhumProdutodisonivelWidget extends StatefulWidget {
  /// nenhum produto disponivel para adicionar
  const NenhumProdutodisonivelWidget({super.key});

  @override
  State<NenhumProdutodisonivelWidget> createState() =>
      _NenhumProdutodisonivelWidgetState();
}

class _NenhumProdutodisonivelWidgetState
    extends State<NenhumProdutodisonivelWidget> {
  late NenhumProdutodisonivelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NenhumProdutodisonivelModel());

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
      height: 250.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              color: FlutterFlowTheme.of(context).primary,
              size: 64.0,
            ),
            Text(
              'Nenhum produto disponível',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    font: GoogleFonts.barlow(),
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              'Você não tem nenhum produto disponível para adicionar em seu anúncio.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.rubik(),
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

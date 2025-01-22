import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ainda_nao_existe_produtos_nesta_reiao_model.dart';
export 'ainda_nao_existe_produtos_nesta_reiao_model.dart';

class AindaNaoExisteProdutosNestaReiaoWidget extends StatefulWidget {
  /// bottom sheet ainda nao existe produtos nesta regiao
  const AindaNaoExisteProdutosNestaReiaoWidget({super.key});

  @override
  State<AindaNaoExisteProdutosNestaReiaoWidget> createState() =>
      _AindaNaoExisteProdutosNestaReiaoWidgetState();
}

class _AindaNaoExisteProdutosNestaReiaoWidgetState
    extends State<AindaNaoExisteProdutosNestaReiaoWidget> {
  late AindaNaoExisteProdutosNestaReiaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => AindaNaoExisteProdutosNestaReiaoModel());

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
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Ainda não há produtos disponíveis',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Barlow',
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  'Infelizmente ainda não temos produtos cadastrados para esta região. Por favor, tente novamente mais tarde.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}

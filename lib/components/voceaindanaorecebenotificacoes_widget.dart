import '/components/notificacoesjahabilitadas_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'voceaindanaorecebenotificacoes_model.dart';
export 'voceaindanaorecebenotificacoes_model.dart';

class VoceaindanaorecebenotificacoesWidget extends StatefulWidget {
  /// ainda nao tem notificacao
  const VoceaindanaorecebenotificacoesWidget({super.key});

  @override
  State<VoceaindanaorecebenotificacoesWidget> createState() =>
      _VoceaindanaorecebenotificacoesWidgetState();
}

class _VoceaindanaorecebenotificacoesWidgetState
    extends State<VoceaindanaorecebenotificacoesWidget> {
  late VoceaindanaorecebenotificacoesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoceaindanaorecebenotificacoesModel());

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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 64.0,
            ),
            Text(
              'Ainda não existe notificações',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    font: GoogleFonts.barlow(),
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              'Você ainda não recebe notificações, verifique abaixo as permissões de sua conta.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.rubik(),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
            ),
            FFButtonWidget(
              onPressed: () async {
                if (await getPermissionStatus(notificationsPermission)) {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: NotificacoesjahabilitadasWidget(),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                } else {
                  await requestPermission(notificationsPermission);
                }
              },
              text: 'Verificar permissões',
              options: FFButtonOptions(
                width: 200.0,
                height: 40.0,
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
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}

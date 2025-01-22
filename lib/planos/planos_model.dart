import '/components/planos_componente_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'planos_widget.dart' show PlanosWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlanosModel extends FlutterFlowModel<PlanosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for planosComponente component.
  late PlanosComponenteModel planosComponenteModel;

  @override
  void initState(BuildContext context) {
    planosComponenteModel = createModel(context, () => PlanosComponenteModel());
  }

  @override
  void dispose() {
    planosComponenteModel.dispose();
  }
}

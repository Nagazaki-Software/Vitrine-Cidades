import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'container_banner_inicial_prestadores_model.dart';
export 'container_banner_inicial_prestadores_model.dart';

class ContainerBannerInicialPrestadoresWidget extends StatefulWidget {
  const ContainerBannerInicialPrestadoresWidget({super.key});

  @override
  State<ContainerBannerInicialPrestadoresWidget> createState() =>
      _ContainerBannerInicialPrestadoresWidgetState();
}

class _ContainerBannerInicialPrestadoresWidgetState
    extends State<ContainerBannerInicialPrestadoresWidget> {
  late ContainerBannerInicialPrestadoresModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => ContainerBannerInicialPrestadoresModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Container(
        width: double.infinity,
        height: 250.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiary,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/Logotipo_delicado_monograma_feminino_bege_e_branco_(1300_x_500_px)_(4).png',
            ).image,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

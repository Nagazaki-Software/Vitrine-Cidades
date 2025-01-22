import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'container_banner_inicial_model.dart';
export 'container_banner_inicial_model.dart';

class ContainerBannerInicialWidget extends StatefulWidget {
  const ContainerBannerInicialWidget({
    super.key,
    required this.img,
  });

  final String? img;

  @override
  State<ContainerBannerInicialWidget> createState() =>
      _ContainerBannerInicialWidgetState();
}

class _ContainerBannerInicialWidgetState
    extends State<ContainerBannerInicialWidget> {
  late ContainerBannerInicialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContainerBannerInicialModel());

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
            image: Image.network(
              widget!.img!,
            ).image,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

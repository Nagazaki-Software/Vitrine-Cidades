import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/avaliacoes_do_produto_widget.dart';
import '/components/produtosdomesmovendedor_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'pagina_do_produto_widget.dart' show PaginaDoProdutoWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaDoProdutoModel extends FlutterFlowModel<PaginaDoProdutoWidget> {
  ///  Local state fields for this page.

  VisitasStruct? visitas;
  void updateVisitasStruct(Function(VisitasStruct) updateFn) {
    updateFn(visitas ??= VisitasStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PaginaDoProduto widget.
  LojistasRecord? lojista;
  // Model for AvaliacoesDoProduto component.
  late AvaliacoesDoProdutoModel avaliacoesDoProdutoModel;
  // Model for PRODUTOSDOMESMOVENDEDOR component.
  late ProdutosdomesmovendedorModel produtosdomesmovendedorModel;

  @override
  void initState(BuildContext context) {
    avaliacoesDoProdutoModel =
        createModel(context, () => AvaliacoesDoProdutoModel());
    produtosdomesmovendedorModel =
        createModel(context, () => ProdutosdomesmovendedorModel());
  }

  @override
  void dispose() {
    avaliacoesDoProdutoModel.dispose();
    produtosdomesmovendedorModel.dispose();
  }
}

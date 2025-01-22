import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/barra_de_navegacao_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'carrinho_widget.dart' show CarrinhoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarrinhoModel extends FlutterFlowModel<CarrinhoWidget> {
  ///  Local state fields for this page.

  bool ativarLixeira = false;

  bool ativarLixeiraDeCima = false;

  bool nomeDoComerciante = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in Carrinho widget.
  CarrinhoDoUsuarioRecord? querryCarrinho;
  // State field(s) for CheckboxParaApagarAEmpresa widget.
  Map<CarrinhoDoUsuarioRecord, bool> checkboxParaApagarAEmpresaValueMap = {};
  List<CarrinhoDoUsuarioRecord> get checkboxParaApagarAEmpresaCheckedItems =>
      checkboxParaApagarAEmpresaValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.
  Map<ItensDoCarrinhoRecord, bool> checkboxValueMap = {};
  List<ItensDoCarrinhoRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Model for BarraDeNavegacao component.
  late BarraDeNavegacaoModel barraDeNavegacaoModel;

  @override
  void initState(BuildContext context) {
    barraDeNavegacaoModel = createModel(context, () => BarraDeNavegacaoModel());
  }

  @override
  void dispose() {
    barraDeNavegacaoModel.dispose();
  }
}

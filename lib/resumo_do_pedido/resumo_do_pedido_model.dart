import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/anual_plano_widget.dart';
import '/components/contratar_suporte_personalizado_widget.dart';
import '/components/pagamento_recusado_widget.dart';
import '/components/pagamentoconfirmado_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'resumo_do_pedido_widget.dart' show ResumoDoPedidoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResumoDoPedidoModel extends FlutterFlowModel<ResumoDoPedidoWidget> {
  ///  Local state fields for this page.

  String? status;

  bool apertouPix = false;

  String dropdown = 'Parcelar 1x: R\$ 119.90';

  double mes = 1.0;

  String cartoesPix = 'Cartões';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (cobrancaPix)] action in resumoDoPedido widget.
  ApiCallResponse? apiBasico;
  // Stores action output result for [Firestore Query - Query a collection] action in resumoDoPedido widget.
  List<UsersRecord>? adminUsers;
  // Stores action output result for [Backend Call - API (recuperar status)] action in resumoDoPedido widget.
  ApiCallResponse? pixs;
  // Stores action output result for [Backend Call - API (pixRecorrente)] action in resumoDoPedido widget.
  ApiCallResponse? pixes;
  // Stores action output result for [Backend Call - API (getIP)] action in resumoDoPedido widget.
  ApiCallResponse? ip;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (listarCobrancas)] action in resumoDoPedido widget.
  ApiCallResponse? listarPix;
  // Model for anualPlano component.
  late AnualPlanoModel anualPlanoModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for DropDownParcelamento widget.
  String? dropDownParcelamentoValue;
  FormFieldController<String>? dropDownParcelamentoValueController;
  // Stores action output result for [Backend Call - API (criarAssinaturaComCartaoDeCredito)] action in Button widget.
  ApiCallResponse? apiResultfitoi;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 90000;
  int timerMilliseconds = 90000;
  String timerValue = StopWatchTimer.getDisplayTime(
    90000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for contratarSuportePersonalizado component.
  late ContratarSuportePersonalizadoModel contratarSuportePersonalizadoModel;

  @override
  void initState(BuildContext context) {
    anualPlanoModel = createModel(context, () => AnualPlanoModel());
    contratarSuportePersonalizadoModel =
        createModel(context, () => ContratarSuportePersonalizadoModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    anualPlanoModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    timerController.dispose();
    contratarSuportePersonalizadoModel.dispose();
  }
}

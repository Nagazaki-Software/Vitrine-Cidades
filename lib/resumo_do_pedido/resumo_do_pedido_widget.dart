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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'resumo_do_pedido_model.dart';
export 'resumo_do_pedido_model.dart';

class ResumoDoPedidoWidget extends StatefulWidget {
  /// tela de compra cartao de credito e pix
  const ResumoDoPedidoWidget({
    super.key,
    required this.valor,
    required this.valorDouble,
    required this.tipodePlano,
    required this.cpfCnpj,
    required this.customer,
    required this.celular,
    required this.cep,
    required this.numberCasa,
  });

  final String? valor;
  final double? valorDouble;
  final String? tipodePlano;
  final String? cpfCnpj;
  final String? customer;
  final String? celular;
  final String? cep;
  final String? numberCasa;

  @override
  State<ResumoDoPedidoWidget> createState() => _ResumoDoPedidoWidgetState();
}

class _ResumoDoPedidoWidgetState extends State<ResumoDoPedidoWidget> {
  late ResumoDoPedidoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResumoDoPedidoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiBasico = await CobrancaPixCall.call(
        customer: widget!.customer,
        billingType: 'PIX',
        value: 5.0,
        dueDate: dateTimeFormat(
          "y-M-d",
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        ),
        description: 'Plano básico vitrine cidades',
      );

      _model.adminUsers = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'admin',
          isEqualTo: true,
        ),
      );
      _model.timerController.onStartTimer();
      _model.timerController.onStartTimer();
      _model.pixs = await RecuperarStatusCall.call(
        id: CobrancaPixCall.id(
          (_model.apiBasico?.jsonBody ?? ''),
        ),
      );

      _model.pixes = await PixRecorrenteCall.call(
        id: CobrancaPixCall.id(
          (_model.apiBasico?.jsonBody ?? ''),
        ),
      );

      _model.ip = await GetIPCall.call();

      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 20000),
        callback: (timer) async {
          if ((widget!.tipodePlano == 'basico') ||
              (widget!.tipodePlano == 'intermediario') ||
              ((widget!.tipodePlano == 'premium') &&
                  (_model.cartoesPix == 'PIX'))) {
            _model.listarPix = await ListarCobrancasCall.call(
              customer: widget!.customer,
            );

            if ((String var1) {
              return var1 == "RECEIVED";
            }(ListarCobrancasCall.status(
              (_model.listarPix?.jsonBody ?? ''),
            )!)) {
              if (widget!.tipodePlano == 'profissional') {
                FFAppState().tipoDeAssinatura = 'profissional';
                safeSetState(() {});

                await PagamentoRecord.createDoc(currentUserReference!)
                    .set(createPagamentoRecordData(
                  plano: 'profissional',
                  metodo: 'PIX',
                  nomeDaPessoa: currentUserDisplayName,
                  cpfcnpj: widget!.cpfCnpj,
                  statusDoPagamento: ListarCobrancasCall.status(
                    (_model.listarPix?.jsonBody ?? ''),
                  ),
                  valor: widget!.valorDouble,
                  dia: getCurrentTimestamp,
                ));

                await PagamentoRecord.createDoc(currentUserReference!)
                    .set(createPagamentoRecordData(
                  plano: 'Profissional',
                  metodo: 'PIX',
                  nomeDaPessoa: currentUserDisplayName,
                  cpfcnpj: widget!.cpfCnpj,
                  valor: widget!.valorDouble,
                  statusDoPagamento: 'Aprovado',
                  invoiceNumber: CobrancaPixCall.invoiceNumber(
                    (_model.apiBasico?.jsonBody ?? ''),
                  ),
                  invoiceUrl: CobrancaPixCall.invoiceUrl(
                    (_model.apiBasico?.jsonBody ?? ''),
                  ),
                  dia: getCurrentTimestamp,
                ));

                await NotificacoesRecord.collection
                    .doc()
                    .set(createNotificacoesRecordData(
                      name: 'Seu pagamento foi realizado com sucesso!',
                      dia: getCurrentTimestamp,
                      description:
                          'Seu pagamento da assinatura profissional foi realizada com sucesso no método PIX.',
                      uidUsuario: currentUserReference?.id,
                    ));
                triggerPushNotification(
                  notificationTitle:
                      '${currentUserDisplayName} efetuou a compra da assinatura profissional.',
                  notificationText:
                      '${currentUserDisplayName}efetuou a compra da assinatura profissional, há ${dateTimeFormat(
                    "relative",
                    getCurrentTimestamp,
                    locale: FFLocalizations.of(context).languageCode,
                  )}com a forma de pagamento PIX, entre no app para ver mais detalhes.',
                  notificationSound: 'default',
                  userRefs: _model.adminUsers!
                      .map((e) => e.reference)
                      .toList()
                      .toList(),
                  initialPageName: 'pagamentosModoAdmin',
                  parameterData: {},
                );
              } else if (widget!.tipodePlano == 'premium') {
                FFAppState().tipoDeAssinatura = 'premium';
                safeSetState(() {});

                await PagamentoRecord.createDoc(currentUserReference!)
                    .set(createPagamentoRecordData(
                  plano: 'premium',
                  metodo: 'PIX',
                  nomeDaPessoa: currentUserDisplayName,
                  cpfcnpj: widget!.cpfCnpj,
                  statusDoPagamento: ListarCobrancasCall.status(
                    (_model.listarPix?.jsonBody ?? ''),
                  ),
                  valor: widget!.valorDouble,
                  dia: getCurrentTimestamp,
                ));

                await PagamentoRecord.createDoc(currentUserReference!)
                    .set(createPagamentoRecordData(
                  plano: 'Premium',
                  metodo: 'PIX',
                  nomeDaPessoa: currentUserDisplayName,
                  cpfcnpj: widget!.cpfCnpj,
                  valor: widget!.valorDouble,
                  statusDoPagamento: 'Aprovado',
                  invoiceNumber: CobrancaPixCall.invoiceNumber(
                    (_model.apiBasico?.jsonBody ?? ''),
                  ),
                  invoiceUrl: CobrancaPixCall.invoiceUrl(
                    (_model.apiBasico?.jsonBody ?? ''),
                  ),
                  dia: getCurrentTimestamp,
                ));

                await NotificacoesRecord.collection
                    .doc()
                    .set(createNotificacoesRecordData(
                      name: 'Seu pagamento foi realizado com sucesso!',
                      dia: getCurrentTimestamp,
                      description:
                          'Seu pagamento da assinatura premium foi realizada com sucesso no método PIX.',
                      uidUsuario: currentUserReference?.id,
                    ));
                triggerPushNotification(
                  notificationTitle:
                      '${currentUserDisplayName} efetuou a compra da assinatura premium.',
                  notificationText:
                      '${currentUserDisplayName}efetuou a compra da assinatura premium, há ${dateTimeFormat(
                    "relative",
                    getCurrentTimestamp,
                    locale: FFLocalizations.of(context).languageCode,
                  )}com a forma de pagamento PIX, entre no app para ver mais detalhes.',
                  notificationSound: 'default',
                  userRefs: _model.adminUsers!
                      .map((e) => e.reference)
                      .toList()
                      .toList(),
                  initialPageName: 'PainelAdministrativoDoApp',
                  parameterData: {},
                );
              } else if (widget!.tipodePlano == 'basico') {
                FFAppState().tipoDeAssinatura = 'basico';
                safeSetState(() {});

                await PagamentoRecord.createDoc(currentUserReference!)
                    .set(createPagamentoRecordData(
                  plano: 'basico',
                  metodo: 'PIX',
                  nomeDaPessoa: currentUserDisplayName,
                  cpfcnpj: widget!.cpfCnpj,
                  statusDoPagamento: ListarCobrancasCall.status(
                    (_model.listarPix?.jsonBody ?? ''),
                  ),
                  valor: widget!.valorDouble,
                  dia: getCurrentTimestamp,
                ));

                await PagamentoRecord.createDoc(currentUserReference!)
                    .set(createPagamentoRecordData(
                  plano: 'Básico',
                  metodo: 'PIX',
                  nomeDaPessoa: currentUserDisplayName,
                  cpfcnpj: widget!.cpfCnpj,
                  valor: widget!.valorDouble,
                  statusDoPagamento: 'Aprovado',
                  invoiceNumber: CobrancaPixCall.invoiceNumber(
                    (_model.apiBasico?.jsonBody ?? ''),
                  ),
                  invoiceUrl: CobrancaPixCall.invoiceUrl(
                    (_model.apiBasico?.jsonBody ?? ''),
                  ),
                  dia: getCurrentTimestamp,
                ));

                await NotificacoesRecord.collection
                    .doc()
                    .set(createNotificacoesRecordData(
                      name: 'Seu pagamento foi realizado com sucesso!',
                      dia: getCurrentTimestamp,
                      description:
                          'Seu pagamento da assinatura básico foi realizada com sucesso no método PIX.',
                      uidUsuario: currentUserReference?.id,
                    ));
                triggerPushNotification(
                  notificationTitle:
                      '${currentUserDisplayName} efetuou a compra da assinatura básica.',
                  notificationText:
                      '${currentUserDisplayName}efetuou a compra da assinatura básica, há ${dateTimeFormat(
                    "relative",
                    getCurrentTimestamp,
                    locale: FFLocalizations.of(context).languageCode,
                  )}com a forma de pagamento PIX, entre no app para ver mais detalhes.',
                  notificationSound: 'default',
                  userRefs: _model.adminUsers!
                      .map((e) => e.reference)
                      .toList()
                      .toList(),
                  initialPageName: 'PainelAdministrativoDoApp',
                  parameterData: {},
                );
              }

              FFAppState().diaDoPedido = getCurrentTimestamp;
              safeSetState(() {});
            } else {
              context.pushNamed(
                'processarPagamento',
                queryParameters: {
                  'valor': serializeParam(
                    widget!.valor,
                    ParamType.String,
                  ),
                  'id': serializeParam(
                    getJsonField(
                      (_model.apiBasico?.jsonBody ?? ''),
                      r'''$.id''',
                    ).toString().toString(),
                    ParamType.String,
                  ),
                  'cpf': serializeParam(
                    widget!.cpfCnpj,
                    ParamType.String,
                  ),
                  'invoiceURL': serializeParam(
                    CobrancaPixCall.invoiceUrl(
                      (_model.apiBasico?.jsonBody ?? ''),
                    ),
                    ParamType.String,
                  ),
                  'valorDouble': serializeParam(
                    widget!.valorDouble,
                    ParamType.double,
                  ),
                  'invoiceNumber': serializeParam(
                    CobrancaPixCall.invoiceNumber(
                      (_model.apiBasico?.jsonBody ?? ''),
                    ),
                    ParamType.String,
                  ),
                  'tipoDePlano': serializeParam(
                    widget!.tipodePlano,
                    ParamType.String,
                  ),
                  'admin': serializeParam(
                    _model.adminUsers?.map((e) => e.reference).toList(),
                    ParamType.DocumentReference,
                    isList: true,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 300),
                  ),
                },
              );
            }

            _model.instantTimer?.cancel();
          } else {
            return;
          }
        },
        startImmediately: false,
      );
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode1!.addListener(
      () async {
        _model.formatCartoes = functions.espacoCartoes(
            (_model.textFieldFocusNode1?.hasFocus ?? false).toString());
        safeSetState(() {});
      },
    );
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 160.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xDDFF7900), Color(0xFFFF4D00)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pagamento',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.barlow(),
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        'Escolha sua forma de pagamento',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.rubik(),
                              color: Color(0xFFE0E0E0),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(32.0, 24.0, 32.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Resumo do Pedido',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.barlow(),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Plano ${widget!.tipodePlano}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rubik(),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        FFAppState().planoAnual
                                            ? 'R\$ 1.438,80'
                                            : valueOrDefault<String>(
                                                widget!.valor,
                                                '0',
                                              ),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rubik(),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                if (FFAppState().contratarSuporte)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Suporte personalizado',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.rubik(),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        'R\$ 30,00',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.rubik(),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                Container(
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.barlow(),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        () {
                                          if (FFAppState().planoAnual) {
                                            return 'R\$ 1.438,80';
                                          } else if (FFAppState()
                                              .contratarSuporte) {
                                            return formatNumber(
                                              functions.calculeValorTotal(
                                                  30.0, widget!.valorDouble!),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.commaDecimal,
                                              currency: 'R\$',
                                            );
                                          } else if (FFAppState().planoAnual &&
                                              FFAppState().contratarSuporte) {
                                            return formatNumber(
                                              functions.calculeValorTotal(
                                                  30.0, 1438.80),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.commaDecimal,
                                              currency: 'R\$',
                                            );
                                          } else {
                                            return valueOrDefault<String>(
                                              widget!.valor,
                                              '0',
                                            );
                                          }
                                        }(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.barlow(),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.anualPlanoModel,
                        updateCallback: () => safeSetState(() {}),
                        child: AnualPlanoWidget(),
                      ),
                      FlutterFlowChoiceChips(
                        options: [ChipData('Cartões'), ChipData('PIX')],
                        onChanged: (val) async {
                          safeSetState(
                              () => _model.choiceChipsValue = val?.firstOrNull);
                          if (_model.choiceChipsValue == 'Cartões') {
                            _model.cartoesPix = 'Cartões';
                            safeSetState(() {});
                          } else if (_model.choiceChipsValue == 'PIX') {
                            _model.cartoesPix = 'PIX';
                            safeSetState(() {});
                          }
                        },
                        selectedChipStyle: ChipStyle(
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.rubik(),
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                          iconColor: FlutterFlowTheme.of(context).info,
                          iconSize: 0.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.rubik(),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: Color(0x00000000),
                          iconSize: 16.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        chipSpacing: 8.0,
                        rowSpacing: 8.0,
                        multiselect: false,
                        initialized: _model.choiceChipsValue != null,
                        alignment: WrapAlignment.start,
                        controller: _model.choiceChipsValueController ??=
                            FormFieldController<List<String>>(
                          ['Cartões'],
                        ),
                        wrapped: true,
                      ),
                      if (_model.cartoesPix == 'Cartões')
                        Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Cartões de Crédito ou Débito',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.barlow(),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  TextFormField(
                                    controller: _model.textController1,
                                    focusNode: _model.textFieldFocusNode1,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Número do Cartão',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rubik(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rubik(),
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E0E0),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 0.0),
                                      suffixIcon: Icon(
                                        Icons.credit_card,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.rubik(),
                                          letterSpacing: 0.0,
                                        ),
                                    minLines: 1,
                                    keyboardType: TextInputType.number,
                                    validator: _model.textController1Validator
                                        .asValidator(context),
                                    inputFormatters: [_model.textFieldMask1],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              TextFormField(
                                                controller:
                                                    _model.textController2,
                                                focusNode:
                                                    _model.textFieldFocusNode2,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Mês',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.rubik(),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.rubik(),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFE0E0E0),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  suffixIcon: Icon(
                                                    Icons.calendar_today,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      font: GoogleFonts.rubik(),
                                                      letterSpacing: 0.0,
                                                    ),
                                                minLines: 1,
                                                maxLength: 2,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement.none,
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .textController2Validator
                                                    .asValidator(context),
                                              ),
                                              Text(
                                                'Mês do cartão com 2 dígitos.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.rubik(),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextFormField(
                                                controller:
                                                    _model.textController3,
                                                focusNode:
                                                    _model.textFieldFocusNode3,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Ano',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.rubik(),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.rubik(),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFE0E0E0),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  suffixIcon: Icon(
                                                    Icons.calendar_month_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      font: GoogleFonts.rubik(),
                                                      letterSpacing: 0.0,
                                                    ),
                                                minLines: 1,
                                                maxLength: 2,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement.none,
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .textController3Validator
                                                    .asValidator(context),
                                              ),
                                              Text(
                                                'Ano do cartão com 4 dígitos.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.rubik(),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                  TextFormField(
                                    controller: _model.textController4,
                                    focusNode: _model.textFieldFocusNode4,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'CVV',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rubik(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rubik(),
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E0E0),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: Icon(
                                        Icons.lock_outline,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.rubik(),
                                          letterSpacing: 0.0,
                                        ),
                                    minLines: 1,
                                    maxLength: 4,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.none,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    keyboardType: TextInputType.number,
                                    validator: _model.textController4Validator
                                        .asValidator(context),
                                  ),
                                  TextFormField(
                                    controller: _model.textController5,
                                    focusNode: _model.textFieldFocusNode5,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Nome no Cartão',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rubik(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rubik(),
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E0E0),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: Icon(
                                        Icons.person_outline,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.rubik(),
                                          letterSpacing: 0.0,
                                        ),
                                    minLines: 1,
                                    validator: _model.textController5Validator
                                        .asValidator(context),
                                  ),
                                  if (FFAppState().planoAnual)
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .dropDownParcelamentoValueController ??=
                                          FormFieldController<String>(
                                        _model.dropDownParcelamentoValue ??=
                                            'Parcelar 1x: R\$ 1438.80',
                                      ),
                                      options: functions
                                          .calcularParcelamento(1438.80),
                                      onChanged: (val) async {
                                        safeSetState(() => _model
                                            .dropDownParcelamentoValue = val);
                                        _model.dropdown =
                                            _model.dropDownParcelamentoValue!;
                                        safeSetState(() {});
                                      },
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rubik(),
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Opções de parcelamento',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  Text(
                                    valueOrDefault<String>(
                                      (_model.apiResultfitoi?.jsonBody ?? '')
                                          .toString(),
                                      'Console do erro.',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.rubik(),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      _model.apiResultfitoi =
                                          await CriarAssinaturaComCartaoDeCreditoCall
                                              .call(
                                        value: 5.00,
                                        nextDueDate: dateTimeFormat(
                                          "y-M-d",
                                          getCurrentTimestamp,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        customer: widget!.customer,
                                        holderName: _model.textController5.text,
                                        number: _model.textController1.text,
                                        expiryMonth:
                                            _model.textController2.text,
                                        expiryYear: _model.textController3.text,
                                        ccv: _model.textController4.text,
                                        remoteIp: getJsonField(
                                          (_model.ip?.jsonBody ?? ''),
                                          r'''$.ip''',
                                        ).toString(),
                                        installmentCount: FFAppState()
                                                .planoAnual
                                            ? () {
                                                if (_model.dropdown ==
                                                    'Parcelar 1x: R\$ 119.90') {
                                                  return 1;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 2x: R\$ 59.95') {
                                                  return 2;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 3x: R\$ 39.97') {
                                                  return 3;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 4x: R\$ 29.98') {
                                                  return 4;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 5x: R\$ 23.90') {
                                                  return 5;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 6x: R\$ 19.98') {
                                                  return 6;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 7x: R\$ 17.13') {
                                                  return 7;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 8x: R\$ 14.99') {
                                                  return 8;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 9x: R\$ 13.32') {
                                                  return 9;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 10x: R\$ 11.99') {
                                                  return 10;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 11x: R\$ 10.90') {
                                                  return 11;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 12x: R\$ 9.99') {
                                                  return 12;
                                                } else {
                                                  return 1;
                                                }
                                              }()
                                            : 1,
                                        installmentValue: FFAppState()
                                                .planoAnual
                                            ? () {
                                                if (_model.dropdown ==
                                                    'Parcelar 1x: R\$ 119.90') {
                                                  return 5.0;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 2x: R\$ 59.95') {
                                                  return 719.40;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 3x: R\$ 39.97') {
                                                  return 479.60;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 4x: R\$ 29.98') {
                                                  return 359.70;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 5x: R\$ 23.90') {
                                                  return 23.90;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 6x: R\$ 19.98') {
                                                  return 19.98;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 7x: R\$ 17.13') {
                                                  return 17.13;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 8x: R\$ 14.99') {
                                                  return 14.99;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 9x: R\$ 13.32') {
                                                  return 13.32;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 10x: R\$ 11.99') {
                                                  return 11.99;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 11x: R\$ 10.90') {
                                                  return 10.90;
                                                } else if (_model.dropdown ==
                                                    'Parcelar 12x: R\$ 9.99') {
                                                  return 9.99;
                                                } else {
                                                  return 119.90;
                                                }
                                              }()
                                            : 119.90,
                                        name: currentUserDisplayName,
                                        email: currentUserEmail,
                                        cpfCnpj: widget!.cpfCnpj,
                                        phone: widget!.celular,
                                        description:
                                            'Assinatura Premium Vitrine Cidades',
                                        postalCode: widget!.cep,
                                        addressNumber: widget!.numberCasa,
                                      );

                                      if ((_model.apiResultfitoi?.succeeded ??
                                              true) &&
                                          ((String var1) {
                                            return var1 == "RECEVEID";
                                          }(getJsonField(
                                            (_model.apiResultfitoi?.jsonBody ??
                                                ''),
                                            r'''$.status''',
                                          ).toString()))) {
                                        await PagamentoRecord.createDoc(
                                                currentUserReference!)
                                            .set(createPagamentoRecordData(
                                          plano: 'Premium',
                                          metodo: 'Cartão de Crédito',
                                          nomeDaPessoa: currentUserDisplayName,
                                          numeroDoCartao:
                                              _model.textController1.text,
                                          cpfcnpj: widget!.cpfCnpj,
                                          statusDoPagamento: () {
                                            if ((String var1) {
                                              return var1 == "RECEVEID";
                                            }(RecuperarStatusCall.status(
                                              (_model.pixs?.jsonBody ?? ''),
                                            )!)) {
                                              return 'Aprovado';
                                            } else if ((String var1) {
                                              return var1 == "REFUNDED";
                                            }(RecuperarStatusCall.status(
                                              (_model.pixs?.jsonBody ?? ''),
                                            )!)) {
                                              return 'Recusado';
                                            } else {
                                              return 'Pendente';
                                            }
                                          }(),
                                          valor: widget!.valorDouble,
                                          dia: getCurrentTimestamp,
                                          invoiceNumber:
                                              CobrancaPixCall.invoiceNumber(
                                            (_model.apiBasico?.jsonBody ?? ''),
                                          ),
                                          invoiceUrl:
                                              CobrancaPixCall.invoiceUrl(
                                            (_model.apiBasico?.jsonBody ?? ''),
                                          ),
                                        ));
                                        FFAppState().tipoDeAssinatura =
                                            'premium';
                                        safeSetState(() {});

                                        await PagamentoRecord.createDoc(
                                                currentUserReference!)
                                            .set(createPagamentoRecordData(
                                          plano: 'Premium',
                                          metodo: 'Cartão',
                                          nomeDaPessoa: currentUserDisplayName,
                                          cpfcnpj: widget!.cpfCnpj,
                                          valor: widget!.valorDouble,
                                          statusDoPagamento: 'Aprovado',
                                          invoiceNumber: getJsonField(
                                            (_model.apiResultfitoi?.jsonBody ??
                                                ''),
                                            r'''$.invoiceNumber''',
                                          ).toString(),
                                          invoiceUrl: getJsonField(
                                            (_model.apiResultfitoi?.jsonBody ??
                                                ''),
                                            r'''$.invoiceuUrl''',
                                          ).toString(),
                                          dia: getCurrentTimestamp,
                                          numeroDoCartao:
                                              _model.textController1.text,
                                          id: getJsonField(
                                            (_model.apiResultfitoi?.jsonBody ??
                                                ''),
                                            r'''$.id''',
                                          ).toString(),
                                        ));

                                        await NotificacoesRecord.collection
                                            .doc()
                                            .set(createNotificacoesRecordData(
                                              name:
                                                  'Seu pagamento foi realizado com sucesso!',
                                              dia: getCurrentTimestamp,
                                              description:
                                                  'Seu pagamento da assinatura premium foi realizada com sucesso no método Cartão.',
                                              uidUsuario:
                                                  currentUserReference?.id,
                                            ));
                                        triggerPushNotification(
                                          notificationTitle:
                                              '${currentUserDisplayName} efetuou a compra da assinatura premium.',
                                          notificationText:
                                              '${currentUserDisplayName}efetuou a compra da assinatura premium, há ${dateTimeFormat(
                                            "relative",
                                            getCurrentTimestamp,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )}com a forma de pagamento Cartão, entre no app para ver mais detalhes.',
                                          notificationSound: 'default',
                                          userRefs: _model.adminUsers!
                                              .map((e) => e.reference)
                                              .toList(),
                                          initialPageName:
                                              'pagamentosModoAdmin',
                                          parameterData: {},
                                        );
                                        FFAppState().diaDoPedido =
                                            getCurrentTimestamp;
                                        safeSetState(() {});
                                        FFAppState().tipoDeAssinatura =
                                            'premium';
                                        safeSetState(() {});
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    PagamentoconfirmadoWidget(
                                                  cartao: _model
                                                      .textController1.text,
                                                  valorDouble:
                                                      widget!.valorDouble!,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      } else if ((String var1) {
                                        return var1 == "REFUNDED";
                                      }(getJsonField(
                                        (_model.apiResultfitoi?.jsonBody ?? ''),
                                        r'''$.status''',
                                      ).toString())) {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    PagamentoRecusadoWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      } else {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    PagamentoRecusadoWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'Pagar com Cartão ( R\$ 5 TESTE)',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFF66E03),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.barlow(),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(25.0),
                                      hoverColor: Color(0xFFFF5F00),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await PagamentoRecord.createDoc(
                                              currentUserReference!)
                                          .set(createPagamentoRecordData(
                                        plano: 'Premium',
                                        metodo: 'Cartão',
                                        nomeDaPessoa: currentUserDisplayName,
                                        cpfcnpj: widget!.cpfCnpj,
                                        valor: widget!.valorDouble,
                                        statusDoPagamento: 'Aprovado',
                                        invoiceNumber: getJsonField(
                                          (_model.apiResultfitoi?.jsonBody ??
                                              ''),
                                          r'''$.invoiceNumber''',
                                        ).toString(),
                                        invoiceUrl: getJsonField(
                                          (_model.apiResultfitoi?.jsonBody ??
                                              ''),
                                          r'''$.invoiceuUrl''',
                                        ).toString(),
                                        dia: getCurrentTimestamp,
                                      ));

                                      await NotificacoesRecord.collection
                                          .doc()
                                          .set(createNotificacoesRecordData(
                                            name:
                                                'Seu pagamento foi realizado com sucesso!',
                                            dia: getCurrentTimestamp,
                                            description:
                                                'Seu pagamento da assinatura premium foi realizada com sucesso no método Cartão.',
                                            uidUsuario:
                                                currentUserReference?.id,
                                          ));
                                      FFAppState().tipoDeAssinatura = 'premium';
                                      FFAppState().diaDoPedido =
                                          getCurrentTimestamp;
                                      safeSetState(() {});
                                      triggerPushNotification(
                                        notificationTitle:
                                            '${currentUserDisplayName} efetuou a compra da assinatura premium.',
                                        notificationText:
                                            '${currentUserDisplayName}efetuou a compra da assinatura premium, há ${dateTimeFormat(
                                          "relative",
                                          getCurrentTimestamp,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}com a forma de pagamento Cartão, entre no app para ver mais detalhes.',
                                        notificationSound: 'default',
                                        userRefs: _model.adminUsers!
                                            .map((e) => e.reference)
                                            .toList(),
                                        initialPageName: 'pagamentosModoAdmin',
                                        parameterData: {},
                                      );
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: PagamentoconfirmadoWidget(
                                                cartao: valueOrDefault<String>(
                                                  _model.textController1.text,
                                                  '0',
                                                ),
                                                valorDouble:
                                                    valueOrDefault<double>(
                                                  widget!.valorDouble,
                                                  0.0,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    text: 'Passar sem pagar (Testes)',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.barlow(),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ),
                      if ((widget!.tipodePlano == 'basico') ||
                          (widget!.tipodePlano == 'Profissional') ||
                          (_model.cartoesPix == 'PIX'))
                        Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'PIX',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.barlow(),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      FlutterFlowTimer(
                                        initialTime: _model.timerInitialTimeMs,
                                        getDisplayTime: (value) =>
                                            StopWatchTimer.getDisplayTime(
                                          value,
                                          hours: false,
                                          milliSecond: false,
                                        ),
                                        controller: _model.timerController,
                                        updateStateInterval:
                                            Duration(milliseconds: 1000),
                                        onChanged:
                                            (value, displayTime, shouldUpdate) {
                                          _model.timerMilliseconds = value;
                                          _model.timerValue = displayTime;
                                          if (shouldUpdate) safeSetState(() {});
                                        },
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.barlow(),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Código PIX',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.rubik(),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Clipboard.setData(
                                                  ClipboardData(
                                                      text: valueOrDefault<
                                                          String>(
                                                PixRecorrenteCall.pixAleatorio(
                                                  (_model.pixes?.jsonBody ??
                                                      ''),
                                                ),
                                                'pix',
                                              )));
                                              _model.apertouPix = true;
                                              safeSetState(() {});
                                              if (_model.apertouPix) {
                                                context.pushNamed(
                                                  'processarPagamento',
                                                  queryParameters: {
                                                    'valor': serializeParam(
                                                      widget!.valor,
                                                      ParamType.String,
                                                    ),
                                                    'id': serializeParam(
                                                      CobrancaPixCall.id(
                                                        (_model.apiBasico
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                    'cpf': serializeParam(
                                                      widget!.cpfCnpj,
                                                      ParamType.String,
                                                    ),
                                                    'invoiceURL':
                                                        serializeParam(
                                                      CobrancaPixCall
                                                          .invoiceUrl(
                                                        (_model.apiBasico
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                    'valorDouble':
                                                        serializeParam(
                                                      widget!.valorDouble,
                                                      ParamType.double,
                                                    ),
                                                    'invoiceNumber':
                                                        serializeParam(
                                                      CobrancaPixCall
                                                          .invoiceNumber(
                                                        (_model.apiBasico
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                    'tipoDePlano':
                                                        serializeParam(
                                                      widget!.tipodePlano,
                                                      ParamType.String,
                                                    ),
                                                    'admin': serializeParam(
                                                      _model.adminUsers
                                                          ?.map((e) =>
                                                              e.reference)
                                                          .toList(),
                                                      ParamType
                                                          .DocumentReference,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            child: Icon(
                                              Icons.content_copy,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        PixRecorrenteCall.pixAleatorio(
                                          (_model.pixes?.jsonBody ?? ''),
                                        ),
                                        'pix',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.rubik(),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'O pagamento pode demorar até 1 minuto para ser confirmado. Você tem 90 segundos para fazer o pagamento.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.rubik(),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Vitrine Cidades Inova Simples',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.rubik(),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        'Banco Asaas',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.rubik(),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await Clipboard.setData(ClipboardData(
                                          text: valueOrDefault<String>(
                                        PixRecorrenteCall.pixAleatorio(
                                          (_model.pixes?.jsonBody ?? ''),
                                        ),
                                        'pix',
                                      )));
                                    },
                                    text: 'Copiar Código PIX',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.barlow(),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                      hoverColor: Color(0xFFFF5F00),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ),
                      wrapWithModel(
                        model: _model.contratarSuportePersonalizadoModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ContratarSuportePersonalizadoWidget(),
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

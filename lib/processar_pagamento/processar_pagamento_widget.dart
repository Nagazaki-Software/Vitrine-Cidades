import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/pagamentoconfirmado_pix_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'processar_pagamento_model.dart';
export 'processar_pagamento_model.dart';

class ProcessarPagamentoWidget extends StatefulWidget {
  /// PAGINA DE PROCESSAMENTO DO PIX COM UM BOTAO PARA RELOAD
  const ProcessarPagamentoWidget({
    super.key,
    required this.valor,
    required this.id,
    required this.cpf,
    required this.invoiceURL,
    required this.valorDouble,
    required this.invoiceNumber,
    required this.tipoDePlano,
    required this.admin,
  });

  final String? valor;
  final String? id;
  final String? cpf;
  final String? invoiceURL;
  final double? valorDouble;
  final String? invoiceNumber;
  final String? tipoDePlano;
  final List<DocumentReference>? admin;

  @override
  State<ProcessarPagamentoWidget> createState() =>
      _ProcessarPagamentoWidgetState();
}

class _ProcessarPagamentoWidgetState extends State<ProcessarPagamentoWidget> {
  late ProcessarPagamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProcessarPagamentoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.recuperarStatus = await RecuperarStatusCall.call(
        id: widget!.id,
      );

      if ((String var1) {
        return var1 == "RECEIVED";
      }(RecuperarStatusCall.status(
        (_model.recuperarStatus?.jsonBody ?? ''),
      )!)) {
        if (widget!.tipoDePlano == 'profissional') {
          FFAppState().tipoDeAssinatura = 'profissional';
          safeSetState(() {});

          await PagamentoRecord.createDoc(currentUserReference!)
              .set(createPagamentoRecordData(
            plano: 'profissional',
            metodo: 'PIX',
            nomeDaPessoa: currentUserDisplayName,
            cpfcnpj: widget!.cpf,
            statusDoPagamento: getJsonField(
              (_model.recuperarStatus?.jsonBody ?? ''),
              r'''$.status''',
            ).toString().toString(),
            valor: widget!.valorDouble,
            dia: getCurrentTimestamp,
          ));

          await PagamentoRecord.createDoc(currentUserReference!)
              .set(createPagamentoRecordData(
            plano: 'Profissional',
            metodo: 'PIX',
            nomeDaPessoa: currentUserDisplayName,
            cpfcnpj: widget!.cpf,
            valor: widget!.valorDouble,
            statusDoPagamento: 'Aprovado',
            invoiceNumber: getJsonField(
              (_model.recuperarStatus?.jsonBody ?? ''),
              r'''$.invoiceNumber''',
            ).toString().toString(),
            invoiceUrl: getJsonField(
              (_model.recuperarStatus?.jsonBody ?? ''),
              r'''$.invoiceUrl''',
            ).toString().toString(),
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
            userRefs: widget!.admin!.toList(),
            initialPageName: 'pagamentosModoAdmin',
            parameterData: {},
          );
        } else if (widget!.tipoDePlano == 'premium') {
          FFAppState().tipoDeAssinatura = 'premium';
          safeSetState(() {});

          await PagamentoRecord.createDoc(currentUserReference!)
              .set(createPagamentoRecordData(
            plano: 'premium',
            metodo: 'PIX',
            nomeDaPessoa: currentUserDisplayName,
            cpfcnpj: widget!.cpf,
            statusDoPagamento: getJsonField(
              (_model.recuperarStatus?.jsonBody ?? ''),
              r'''$.status''',
            ).toString().toString(),
            valor: widget!.valorDouble,
            dia: getCurrentTimestamp,
          ));

          await PagamentoRecord.createDoc(currentUserReference!)
              .set(createPagamentoRecordData(
            plano: 'Premium',
            metodo: 'PIX',
            nomeDaPessoa: currentUserDisplayName,
            cpfcnpj: widget!.cpf,
            valor: widget!.valorDouble,
            statusDoPagamento: 'Aprovado',
            invoiceNumber: getJsonField(
              (_model.recuperarStatus?.jsonBody ?? ''),
              r'''$.invoiceNumber''',
            ).toString().toString(),
            invoiceUrl: getJsonField(
              (_model.recuperarStatus?.jsonBody ?? ''),
              r'''$.invoiceUrl''',
            ).toString().toString(),
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
            userRefs: widget!.admin!.toList(),
            initialPageName: 'PainelAdministrativoDoApp',
            parameterData: {},
          );
        } else if (widget!.tipoDePlano == 'basico') {
          FFAppState().tipoDeAssinatura = 'basico';
          safeSetState(() {});

          await PagamentoRecord.createDoc(currentUserReference!)
              .set(createPagamentoRecordData(
            plano: 'basico',
            metodo: 'PIX',
            nomeDaPessoa: currentUserDisplayName,
            cpfcnpj: widget!.cpf,
            statusDoPagamento: getJsonField(
              (_model.recuperarStatus?.jsonBody ?? ''),
              r'''$.status''',
            ).toString().toString(),
            valor: widget!.valorDouble,
            dia: getCurrentTimestamp,
          ));

          await PagamentoRecord.createDoc(currentUserReference!)
              .set(createPagamentoRecordData(
            plano: 'Básico',
            metodo: 'PIX',
            nomeDaPessoa: currentUserDisplayName,
            cpfcnpj: widget!.cpf,
            valor: widget!.valorDouble,
            statusDoPagamento: 'Aprovado',
            invoiceNumber: getJsonField(
              (_model.recuperarStatus?.jsonBody ?? ''),
              r'''$.invoiceNumber''',
            ).toString().toString(),
            invoiceUrl: getJsonField(
              (_model.recuperarStatus?.jsonBody ?? ''),
              r'''$.invoiceUrl''',
            ).toString().toString(),
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
            userRefs: widget!.admin!.toList(),
            initialPageName: 'PainelAdministrativoDoApp',
            parameterData: {},
          );
        }

        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: PagamentoconfirmadoPixWidget(
                  valorDouble: widget!.valorDouble!,
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
    });

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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/icons8-barato-2.gif',
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Processando Pagamento',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Barlow',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        'Aguarde enquanto verificamos o status do seu PIX',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Rubik',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Barlow',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  'Pendente',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Rubik',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Valor',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Barlow',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget!.valor,
                                    'R\$ 39,90',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Rubik',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ID da Transação',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Barlow',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  '#92831',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Rubik',
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
                  FFButtonWidget(
                    onPressed: () async {
                      _model.apiResultvem = await RecuperarStatusCall.call(
                        id: widget!.id,
                      );

                      if ((String var1) {
                        return var1 == "RECEIVED";
                      }(RecuperarStatusCall.status(
                        (_model.apiResultvem?.jsonBody ?? ''),
                      )!)) {
                        if (widget!.tipoDePlano == 'profissional') {
                          FFAppState().tipoDeAssinatura = 'profissional';
                          safeSetState(() {});

                          await PagamentoRecord.createDoc(currentUserReference!)
                              .set(createPagamentoRecordData(
                            plano: 'profissional',
                            metodo: 'PIX',
                            nomeDaPessoa: currentUserDisplayName,
                            cpfcnpj: widget!.cpf,
                            statusDoPagamento: getJsonField(
                              (_model.recuperarStatus?.jsonBody ?? ''),
                              r'''$.status''',
                            ).toString(),
                            valor: widget!.valorDouble,
                            dia: getCurrentTimestamp,
                          ));

                          await PagamentoRecord.createDoc(currentUserReference!)
                              .set(createPagamentoRecordData(
                            plano: 'Profissional',
                            metodo: 'PIX',
                            nomeDaPessoa: currentUserDisplayName,
                            cpfcnpj: widget!.cpf,
                            valor: widget!.valorDouble,
                            statusDoPagamento: 'Aprovado',
                            invoiceNumber: getJsonField(
                              (_model.recuperarStatus?.jsonBody ?? ''),
                              r'''$.invoiceNumber''',
                            ).toString(),
                            invoiceUrl: getJsonField(
                              (_model.recuperarStatus?.jsonBody ?? ''),
                              r'''$.invoiceUrl''',
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
                            userRefs: widget!.admin!.toList(),
                            initialPageName: 'pagamentosModoAdmin',
                            parameterData: {},
                          );
                        } else if (widget!.tipoDePlano == 'premium') {
                          FFAppState().tipoDeAssinatura = 'premium';
                          safeSetState(() {});

                          await PagamentoRecord.createDoc(currentUserReference!)
                              .set(createPagamentoRecordData(
                            plano: 'premium',
                            metodo: 'PIX',
                            nomeDaPessoa: currentUserDisplayName,
                            cpfcnpj: widget!.cpf,
                            statusDoPagamento: getJsonField(
                              (_model.recuperarStatus?.jsonBody ?? ''),
                              r'''$.status''',
                            ).toString(),
                            valor: widget!.valorDouble,
                            dia: getCurrentTimestamp,
                          ));

                          await PagamentoRecord.createDoc(currentUserReference!)
                              .set(createPagamentoRecordData(
                            plano: 'Premium',
                            metodo: 'PIX',
                            nomeDaPessoa: currentUserDisplayName,
                            cpfcnpj: widget!.cpf,
                            valor: widget!.valorDouble,
                            statusDoPagamento: 'Aprovado',
                            invoiceNumber: getJsonField(
                              (_model.recuperarStatus?.jsonBody ?? ''),
                              r'''$.invoiceNumber''',
                            ).toString(),
                            invoiceUrl: getJsonField(
                              (_model.recuperarStatus?.jsonBody ?? ''),
                              r'''$.invoiceUrl''',
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
                            userRefs: widget!.admin!.toList(),
                            initialPageName: 'PainelAdministrativoDoApp',
                            parameterData: {},
                          );
                        } else if (widget!.tipoDePlano == 'basico') {
                          FFAppState().tipoDeAssinatura = 'basico';
                          safeSetState(() {});

                          await PagamentoRecord.createDoc(currentUserReference!)
                              .set(createPagamentoRecordData(
                            plano: 'basico',
                            metodo: 'PIX',
                            nomeDaPessoa: currentUserDisplayName,
                            cpfcnpj: widget!.cpf,
                            statusDoPagamento: getJsonField(
                              (_model.recuperarStatus?.jsonBody ?? ''),
                              r'''$.status''',
                            ).toString(),
                            valor: widget!.valorDouble,
                            dia: getCurrentTimestamp,
                          ));

                          await PagamentoRecord.createDoc(currentUserReference!)
                              .set(createPagamentoRecordData(
                            plano: 'Básico',
                            metodo: 'PIX',
                            nomeDaPessoa: currentUserDisplayName,
                            cpfcnpj: widget!.cpf,
                            valor: widget!.valorDouble,
                            statusDoPagamento: 'Aprovado',
                            invoiceNumber: getJsonField(
                              (_model.recuperarStatus?.jsonBody ?? ''),
                              r'''$.invoiceNumber''',
                            ).toString(),
                            invoiceUrl: getJsonField(
                              (_model.recuperarStatus?.jsonBody ?? ''),
                              r'''$.invoiceUrl''',
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
                            userRefs: widget!.admin!.toList(),
                            initialPageName: 'PainelAdministrativoDoApp',
                            parameterData: {},
                          );
                        }

                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: PagamentoconfirmadoPixWidget(
                                  valorDouble: widget!.valorDouble!,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      }

                      safeSetState(() {});
                    },
                    text: 'Verificar Novamente',
                    icon: Icon(
                      Icons.refresh,
                      color: FlutterFlowTheme.of(context).info,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 56.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Barlow',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                  Text(
                    'Se você já realizou o pagamento e esta tela continua aparecendo, entre em contato com o suporte',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Rubik',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(SizedBox(height: 32.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

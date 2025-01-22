import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'politica_de_cacelamento_model.dart';
export 'politica_de_cacelamento_model.dart';

class PoliticaDeCacelamentoWidget extends StatefulWidget {
  const PoliticaDeCacelamentoWidget({super.key});

  @override
  State<PoliticaDeCacelamentoWidget> createState() =>
      _PoliticaDeCacelamentoWidgetState();
}

class _PoliticaDeCacelamentoWidgetState
    extends State<PoliticaDeCacelamentoWidget> {
  late PoliticaDeCacelamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PoliticaDeCacelamentoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 900.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.safePop();
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Políticas de cancelamento',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            font: GoogleFonts.barlow(),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 16.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 24.0, 16.0, 24.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    'Política de Cancelamento do Vitrine Cidades\n\nAgradecemos por utilizar o Vitrine Cidades, onde você pode encontrar profissionais e lojas para suas necessidades. Nossa plataforma conecta você diretamente aos prestadores de serviços e comerciantes, mas não processamos pagamentos diretamente pelo aplicativo. Por isso, nossa política de cancelamento é simples e transparente.\n\n1. Cancelamento de Contato: \n   - Caso você tenha iniciado um contato com um profissional ou loja através do nosso aplicativo e deseje cancelar essa solicitação, você pode fazer isso a qualquer momento antes da confirmação do atendimento. Basta não prosseguir com a comunicação ou o agendamento.\n\n2. Cancelamento de Serviços:\n   - Uma vez que o contato com o profissional ou loja for estabelecido e um serviço ou compra for agendado, as condições de cancelamento devem ser discutidas diretamente entre você e o prestador de serviços ou loja. O Vitrine Cidades não se envolve nas transações ou acordos feitos fora da plataforma.\n\n3. Assinatura para Prestadores de Serviços:\n   - Os prestadores de serviços que desejam aumentar sua visibilidade no Vitrine Cidades podem optar por uma assinatura paga. Essa assinatura oferece benefícios adicionais, como maior destaque na plataforma e acesso a ferramentas exclusivas para promoção de seus serviços.\n   - O cancelamento da assinatura deve ser solicitado diretamente ao nosso suporte, respeitando os prazos estabelecidos em nossos termos.\n\n4. Reembolso:\n   - Como não realizamos transações financeiras diretas entre usuários e prestadores, não há política de reembolso aplicável para transações feitas fora do aplicativo.\n\n5. Suporte ao Usuário:\n   - Se você tiver alguma dúvida ou precisar de assistência relacionada ao processo de cancelamento, entre em contato com nossa equipe de suporte através do nosso canal disponível no aplicativo.\n\n6. Alterações na Política:\n   - Reservamo-nos o direito de alterar esta política a qualquer momento. Qualquer alteração será comunicada aos usuários por meio do aplicativo.\n\nAgradecemos por escolher o Vitrine Cidades! Estamos aqui para ajudar você a encontrar os melhores profissionais e lojas para atender suas necessidades.',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .rubik(),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 5.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

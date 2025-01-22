import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'termos_de_uso_model.dart';
export 'termos_de_uso_model.dart';

class TermosDeUsoWidget extends StatefulWidget {
  const TermosDeUsoWidget({super.key});

  @override
  State<TermosDeUsoWidget> createState() => _TermosDeUsoWidgetState();
}

class _TermosDeUsoWidgetState extends State<TermosDeUsoWidget> {
  late TermosDeUsoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermosDeUsoModel());

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
                                      'Termos de uso',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Barlow',
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
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      'Termos de Uso do Vitrine Cidades\n\nÚltima atualização: 15/01/2025\n\nBem-vindo ao Vitrine Cidades! Ao acessar e utilizar nosso aplicativo, você concorda com os seguintes termos de uso. Se você não concorda com estes termos, não deve utilizar nosso aplicativo.\n\n1. Descrição do Serviço:\n   - O Vitrine Cidades é uma plataforma que conecta usuários a profissionais e lojas locais. Nosso objetivo é facilitar o contato entre clientes e prestadores de serviços, permitindo que você encontre o que precisa na sua região.\n\n2. Isenção de Responsabilidade:\n   - O Vitrine Cidades não se envolve nas negociações de preço ou nos acordos entre usuários e prestadores de serviços. Todos os preços, condições e termos de pagamento devem ser discutidos diretamente entre as partes envolvidas. Não somos responsáveis por qualquer desacordo ou insatisfação decorrente dessas negociações.\n\n3. Cadastro e Uso do Aplicativo:\n   - Para utilizar algumas funcionalidades do Vitrine Cidades, pode ser necessário criar uma conta. Você se compromete a fornecer informações precisas e atualizadas durante o processo de cadastro e a manter a confidencialidade da sua senha.\n\n4. Conteúdo Gerado pelo Usuário:\n   - Você é responsável por todo o conteúdo que publicar ou compartilhar através do aplicativo, incluindo comentários, avaliações e mensagens. O Vitrine Cidades não é responsável por esse conteúdo, mas reserva-se o direito de removê-lo caso viole nossos padrões ou políticas.\n\n5. Assinatura para Prestadores de Serviços:\n   - Prestadores de serviços podem optar por uma assinatura paga para aumentar sua visibilidade na plataforma. Os detalhes sobre preços, benefícios e condições da assinatura estão disponíveis no aplicativo.\n\n6. Privacidade:\n   - A sua privacidade é importante para nós. Consulte nossa Política de Privacidade para entender como coletamos, usamos e protegemos suas informações pessoais.\n\n7. Alterações nos Termos:\n   - Reservamo-nos o direito de alterar estes Termos de Uso a qualquer momento. As alterações serão efetivas assim que publicadas no aplicativo. Recomendamos que você revise periodicamente os termos para se manter informado sobre quaisquer mudanças.\n\n8. Legislação Aplicável:\n   - Estes Termos de Uso são regidos pelas leis do Brasil. Qualquer disputa decorrente destes termos será resolvida nos tribunais competentes da sua jurisdição.\n\n9. Contato:\n   - Se você tiver dúvidas sobre estes Termos de Uso ou sobre o funcionamento do Vitrine Cidades, entre em contato conosco através do nosso canal de suporte disponível no aplicativo.\n\nAgradecemos por escolher o Vitrine Cidades! Estamos aqui para ajudar você a encontrar os melhores profissionais e lojas perto de você.\n',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
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

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'declaracao_de_privacidade_model.dart';
export 'declaracao_de_privacidade_model.dart';

class DeclaracaoDePrivacidadeWidget extends StatefulWidget {
  const DeclaracaoDePrivacidadeWidget({super.key});

  @override
  State<DeclaracaoDePrivacidadeWidget> createState() =>
      _DeclaracaoDePrivacidadeWidgetState();
}

class _DeclaracaoDePrivacidadeWidgetState
    extends State<DeclaracaoDePrivacidadeWidget> {
  late DeclaracaoDePrivacidadeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeclaracaoDePrivacidadeModel());

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
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Declaração de privacidade',
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
                                                    'Política de Privacidade do Vitrine Cidades\n\nÚltima atualização: 09/12/2024\n\nNós, do Vitrine Cidades, levamos a sua privacidade a sério. Esta Política de Privacidade descreve como coletamos, usamos, armazenamos e protegemos suas informações pessoais ao utilizar nosso aplicativo. Ao acessar e usar o Vitrine Cidades, você concorda com os termos desta política.\n\n1. Informações que Coletamos:\n   - Informações Pessoais: Podemos coletar informações pessoais que você nos fornece ao criar uma conta, como nome, endereço de e-mail e número de telefone.\n   - Informações de Uso: Coletamos dados sobre como você utiliza o aplicativo, incluindo interações com conteúdos e serviços, informações sobre dispositivos e dados de localização.\n\n2. Como Usamos suas Informações:\n   - Utilizamos suas informações para:\n     - Facilitar o uso do aplicativo e personalizar sua experiência.\n     - Melhorar nossos serviços e desenvolver novas funcionalidades.\n     - Comunicar-nos com você sobre atualizações, promoções e informações relevantes.\n     - Analisar o uso do aplicativo para entender tendências e preferências dos usuários.\n\n3. Compartilhamento de Informações:\n   - Não compartilhamos suas informações pessoais com terceiros sem o seu consentimento, exceto quando necessário para cumprir a lei ou proteger nossos direitos.\n   - Podemos compartilhar informações agregadas e anônimas com parceiros para fins analíticos ou promocionais.\n\n4. Segurança das Informações:\n   - Adotamos medidas de segurança apropriadas para proteger suas informações pessoais contra acesso não autorizado, uso indevido ou divulgação. No entanto, nenhum método de transmissão pela internet ou armazenamento eletrônico é 100% seguro; portanto, não podemos garantir a segurança absoluta.\n\n5. Seus Direitos:\n   - Você tem o direito de acessar, corrigir ou excluir suas informações pessoais a qualquer momento. Para isso, entre em contato conosco através do nosso canal de suporte no aplicativo.\n\n6. Alterações na Política de Privacidade:\n   - Reservamo-nos o direito de alterar esta Política de Privacidade a qualquer momento. As alterações serão publicadas no aplicativo e entrarão em vigor imediatamente após a publicação.\n\n7. Contato:\n   - Se você tiver dúvidas sobre esta Política de Privacidade ou sobre nossas práticas em relação à privacidade, entre em contato conosco através do nosso canal de suporte disponível no aplicativo.\n\nAgradecemos por confiar no Vitrine Cidades! Estamos comprometidos em proteger suas informações pessoais enquanto você utiliza nossa plataforma.',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Rubik',
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

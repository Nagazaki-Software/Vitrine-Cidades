import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dicas_de_seguranca_model.dart';
export 'dicas_de_seguranca_model.dart';

class DicasDeSegurancaWidget extends StatefulWidget {
  const DicasDeSegurancaWidget({super.key});

  @override
  State<DicasDeSegurancaWidget> createState() => _DicasDeSegurancaWidgetState();
}

class _DicasDeSegurancaWidgetState extends State<DicasDeSegurancaWidget> {
  late DicasDeSegurancaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DicasDeSegurancaModel());

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
            Flexible(
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
                                      'Dicas de segurança',
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
                                                    'Dicas de Segurança para o Vitrine Cidades\n\n1. Use Senhas Fortes: Crie senhas que sejam longas e complexas, combinando letras, números e caracteres especiais. Evite usar informações pessoais que possam ser facilmente adivinhadas.\n\n2. Ative a Autenticação em Duas Etapas: Sempre que possível, habilite a autenticação em duas etapas (2FA). Isso adiciona uma camada extra de segurança ao exigir um código adicional além da senha.\n\n3. Atualize Seu Aplicativo Regularmente: Mantenha o aplicativo sempre atualizado para garantir que você tenha as últimas correções de segurança e melhorias.\n\n4. Cuidado com Redes Wi-Fi Públicas: Evite acessar sua conta em redes Wi-Fi públicas, pois elas podem ser menos seguras. Se necessário, use uma VPN para proteger sua conexão.\n\n5. Desconecte-se de Contas em Dispositivos Compartilhados: Sempre faça logout da sua conta após usar o aplicativo em dispositivos que não são seus.\n\n6. Verifique as Permissões do Aplicativo: Revise as permissões que o aplicativo solicita e desative aquelas que não são necessárias para o funcionamento.\n\n7. Cuidado com Links e Anexos: Não clique em links suspeitos ou abra anexos de e-mails ou mensagens que pareçam duvidosos, mesmo que pareçam vir de fontes confiáveis.\n\n8. Monitore Suas Atividades: Fique atento a qualquer atividade suspeita na sua conta, como acessos não reconhecidos ou alterações inesperadas nas suas informações.\n\n9. Use o Login com Google: Se disponível, utilize o login com sua conta do Google, que oferece recursos avançados de segurança.\n\n10. Relate Problemas Imediatamente: Se você perceber algo estranho na sua conta ou no aplicativo, entre em contato com a nossa equipe de suporte imediatamente.\n',
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

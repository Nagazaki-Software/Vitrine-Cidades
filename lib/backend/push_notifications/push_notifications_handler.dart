import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitRipple(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'EsqueciMinhaSenha': ParameterData.none(),
  'CriarConta': ParameterData.none(),
  'PaginaInicialLojista': ParameterData.none(),
  'PaginaDoProduto': (data) async => ParameterData(
        allParams: {
          'produto': getParameter<DocumentReference>(data, 'produto'),
        },
      ),
  'CriarPerfilDePrestador': ParameterData.none(),
  'PerfilDoLojista': (data) async => ParameterData(
        allParams: {
          'lojistaReferencia':
              getParameter<DocumentReference>(data, 'lojistaReferencia'),
        },
      ),
  'PerfilDoLojistaParaEditar': ParameterData.none(),
  'Variacoes': ParameterData.none(),
  'Categoria': ParameterData.none(),
  'MeusFavoritos': ParameterData.none(),
  'Carrinho': ParameterData.none(),
  'PerfilDoPrestador': (data) async => ParameterData(
        allParams: {
          'lojistaReferencia':
              getParameter<DocumentReference>(data, 'lojistaReferencia'),
        },
      ),
  'CriarColecao': (data) async => ParameterData(
        allParams: {
          'lojista': getParameter<DocumentReference>(data, 'lojista'),
        },
      ),
  'editarColecao': (data) async => ParameterData(
        allParams: {
          'lojistas': getParameter<DocumentReference>(data, 'lojistas'),
        },
      ),
  'MandarTicket': ParameterData.none(),
  'CriarAnuncio': ParameterData.none(),
  'SuporteDaConta': ParameterData.none(),
  'SobreVitrineCidades': ParameterData.none(),
  'ProdutoseServicos': ParameterData.none(),
  'PoliticaseTermos': ParameterData.none(),
  'PrivacidadeeDados': ParameterData.none(),
  'colecoes': (data) async => ParameterData(
        allParams: {
          'lojista': getParameter<DocumentReference>(data, 'lojista'),
        },
      ),
  'MeusFavoritosCopy': (data) async => ParameterData(
        allParams: {
          'lojistas': getParameter<DocumentReference>(data, 'lojistas'),
        },
      ),
  'SejaPremium2': ParameterData.none(),
  'SejaPremium': ParameterData.none(),
  'PaginaAdministrativaDoVendedor': ParameterData.none(),
  'PaginaDeCriarAnuncios': ParameterData.none(),
  'painelAdministrativo': ParameterData.none(),
  'fazerUmAnuncio': ParameterData.none(),
  'enviarNotificacao': ParameterData.none(),
  'resumoDoPedido': (data) async => ParameterData(
        allParams: {
          'valor': getParameter<String>(data, 'valor'),
          'valorDouble': getParameter<double>(data, 'valorDouble'),
          'tipodePlano': getParameter<String>(data, 'tipodePlano'),
          'cpfCnpj': getParameter<String>(data, 'cpfCnpj'),
          'customer': getParameter<String>(data, 'customer'),
          'celular': getParameter<String>(data, 'celular'),
          'cep': getParameter<String>(data, 'cep'),
          'numberCasa': getParameter<String>(data, 'numberCasa'),
        },
      ),
  'planos': ParameterData.none(),
  'gerenciarProdutos': (data) async => ParameterData(
        allParams: {
          'lojista': getParameter<DocumentReference>(data, 'lojista'),
        },
      ),
  'gerenciarAnuncios': ParameterData.none(),
  'notificacao': ParameterData.none(),
  'onboard': ParameterData.none(),
  'enderecoAntesDaCompra': (data) async => ParameterData(
        allParams: {
          'valor': getParameter<String>(data, 'valor'),
          'valorDouble': getParameter<double>(data, 'valorDouble'),
          'tipoDePlano': getParameter<String>(data, 'tipoDePlano'),
        },
      ),
  'editarProduto': (data) async => ParameterData(
        allParams: {
          'produtoRef': await getDocumentParameter<SeusprodutosRecord>(
              data, 'produtoRef', SeusprodutosRecord.fromSnapshot),
        },
      ),
  'CriarPerfilDePrestadorCopy2': ParameterData.none(),
  'criarServico': ParameterData.none(),
  'servicoDoPrestadorDeServico1': (data) async => ParameterData(
        allParams: {
          'meuServico': getParameter<DocumentReference>(data, 'meuServico'),
        },
      ),
  'paginaDeVendaDeServico': ParameterData.none(),
  'MinhaContaFoiInvadida': ParameterData.none(),
  'NaoEncontroMeuEndereco': ParameterData.none(),
  'myFavorite': ParameterData.none(),
  'antesDoCriarAnuncio': ParameterData.none(),
  'alterarMinhaSenha': ParameterData.none(),
  'QueroAlterarDadosDaConta': ParameterData.none(),
  'configuracoesDaConta': ParameterData.none(),
  'QueroAlterarMinhaSenha': ParameterData.none(),
  'PoliticaDeCacelamento': ParameterData.none(),
  'TermosDeUso': ParameterData.none(),
  'DeclaracaoDePrivacidade': ParameterData.none(),
  'QueroUmaCopiaDosDados': ParameterData.none(),
  'DicasDeSeguranca': ParameterData.none(),
  'ExcluirMinhaConta': ParameterData.none(),
  'ExcluirDadosDoCartaoDeCredito': ParameterData.none(),
  'painelAdministrativoPrestador': ParameterData.none(),
  'PainelAdministrativoDoApp': ParameterData.none(),
  'slogan': ParameterData.none(),
  'talvez': ParameterData.none(),
  'vestuario': ParameterData.none(),
  'CriarConta2': ParameterData.none(),
  'esqueceminhasenha111': ParameterData.none(),
  'recuperarSenha': ParameterData.none(),
  'BelezaeAcessorios': ParameterData.none(),
  'AutomoveisAcessorios': ParameterData.none(),
  'maisVendido': ParameterData.none(),
  'pesquisa': (data) async => ParameterData(
        allParams: {},
      ),
  'calcados': ParameterData.none(),
  'moda': ParameterData.none(),
  'BazarAcessorios': ParameterData.none(),
  'CasaDecoracao': ParameterData.none(),
  'search': (data) async => ParameterData(
        allParams: {},
      ),
  'pagamentosModoAdmin': ParameterData.none(),
  'lojasCadastradas': ParameterData.none(),
  'enviarNotificacaoModoAdmin': ParameterData.none(),
  'fazerAnuncioPrestador': ParameterData.none(),
  'editarPerfilDeLojista': (data) async => ParameterData(
        allParams: {
          'lojistas': getParameter<DocumentReference>(data, 'lojistas'),
        },
      ),
  'editarPerfilDePrestador': (data) async => ParameterData(
        allParams: {
          'prestador': getParameter<DocumentReference>(data, 'prestador'),
        },
      ),
  'eoteste': ParameterData.none(),
  'editarComerciante': (data) async => ParameterData(
        allParams: {
          'lojista': getParameter<DocumentReference>(data, 'lojista'),
        },
      ),
  'editarComerciantePrestador': (data) async => ParameterData(
        allParams: {
          'prestador': getParameter<DocumentReference>(data, 'prestador'),
        },
      ),
  'AlterarDados': ParameterData.none(),
  'TicketEnviado': ParameterData.none(),
  'processarPagamento': (data) async => ParameterData(
        allParams: {
          'valor': getParameter<String>(data, 'valor'),
          'id': getParameter<String>(data, 'id'),
          'cpf': getParameter<String>(data, 'cpf'),
          'invoiceURL': getParameter<String>(data, 'invoiceURL'),
          'valorDouble': getParameter<double>(data, 'valorDouble'),
          'invoiceNumber': getParameter<String>(data, 'invoiceNumber'),
          'tipoDePlano': getParameter<String>(data, 'tipoDePlano'),
        },
      ),
  'PaginaInicialLojistaCopy': ParameterData.none(),
  'termoDeUsoDoApp': ParameterData.none(),
  'politicadepriv': ParameterData.none(),
  'emConstrucao': ParameterData.none(),
  'ajudasuporte': ParameterData.none(),
  'pagRelatorios': (data) async => ParameterData(
        allParams: {
          'lojista': getParameter<DocumentReference>(data, 'lojista'),
        },
      ),
  'detalhesDoPagamento': (data) async => ParameterData(
        allParams: {
          'pagamentos': getParameter<DocumentReference>(data, 'pagamentos'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

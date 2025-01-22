import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? PaginaInicialLojistaWidget()
          : PaginaInicialLojistaCopyWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? PaginaInicialLojistaWidget()
              : PaginaInicialLojistaCopyWidget(),
          routes: [
            FFRoute(
              name: 'EsqueciMinhaSenha',
              path: 'esqueciMinhaSenha',
              builder: (context, params) => EsqueciMinhaSenhaWidget(),
            ),
            FFRoute(
              name: 'CriarConta',
              path: 'criarConta',
              builder: (context, params) => CriarContaWidget(),
            ),
            FFRoute(
              name: 'PaginaInicialLojista',
              path: 'paginaInicialLojista',
              builder: (context, params) => PaginaInicialLojistaWidget(),
            ),
            FFRoute(
              name: 'PaginaDoProduto',
              path: 'paginaDoProduto',
              builder: (context, params) => PaginaDoProdutoWidget(
                produto: params.getParam(
                  'produto',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Lojistas', 'Seusprodutos'],
                ),
              ),
            ),
            FFRoute(
              name: 'CriarPerfilDePrestador',
              path: 'criarPerfilDePrestador',
              builder: (context, params) => CriarPerfilDePrestadorWidget(),
            ),
            FFRoute(
              name: 'PerfilDoLojista',
              path: 'perfilDoLojista',
              builder: (context, params) => PerfilDoLojistaWidget(
                lojistaReferencia: params.getParam(
                  'lojistaReferencia',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Lojistas'],
                ),
              ),
            ),
            FFRoute(
              name: 'PerfilDoLojistaParaEditar',
              path: 'perfilDoLojistaParaEditar',
              builder: (context, params) => PerfilDoLojistaParaEditarWidget(),
            ),
            FFRoute(
              name: 'Variacoes',
              path: 'variacoes',
              builder: (context, params) => VariacoesWidget(),
            ),
            FFRoute(
              name: 'Categoria',
              path: 'categoria',
              builder: (context, params) => CategoriaWidget(),
            ),
            FFRoute(
              name: 'MeusFavoritos',
              path: 'meusFavoritos',
              builder: (context, params) => MeusFavoritosWidget(),
            ),
            FFRoute(
              name: 'Carrinho',
              path: 'carrinho',
              builder: (context, params) => CarrinhoWidget(),
            ),
            FFRoute(
              name: 'PerfilDoPrestador',
              path: 'perfilDoPrestador',
              builder: (context, params) => PerfilDoPrestadorWidget(
                lojistaReferencia: params.getParam(
                  'lojistaReferencia',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['PrestadoresDeServicos'],
                ),
              ),
            ),
            FFRoute(
              name: 'CriarColecao',
              path: 'criarColecao',
              builder: (context, params) => CriarColecaoWidget(
                lojista: params.getParam(
                  'lojista',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Lojistas'],
                ),
              ),
            ),
            FFRoute(
              name: 'editarColecao',
              path: 'editarColecao',
              builder: (context, params) => EditarColecaoWidget(
                lojistas: params.getParam(
                  'lojistas',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Lojistas'],
                ),
              ),
            ),
            FFRoute(
              name: 'MandarTicket',
              path: 'mandarTicket',
              builder: (context, params) => MandarTicketWidget(),
            ),
            FFRoute(
              name: 'CriarAnuncio',
              path: 'criarAnuncio',
              builder: (context, params) => CriarAnuncioWidget(),
            ),
            FFRoute(
              name: 'SuporteDaConta',
              path: 'suporteDaConta',
              builder: (context, params) => SuporteDaContaWidget(),
            ),
            FFRoute(
              name: 'SobreVitrineCidades',
              path: 'sobreVitrineCidades',
              builder: (context, params) => SobreVitrineCidadesWidget(),
            ),
            FFRoute(
              name: 'ProdutoseServicos',
              path: 'produtoseServicos',
              builder: (context, params) => ProdutoseServicosWidget(),
            ),
            FFRoute(
              name: 'PoliticaseTermos',
              path: 'politicaseTermos',
              builder: (context, params) => PoliticaseTermosWidget(),
            ),
            FFRoute(
              name: 'PrivacidadeeDados',
              path: 'privacidadeeDados',
              builder: (context, params) => PrivacidadeeDadosWidget(),
            ),
            FFRoute(
              name: 'colecoes',
              path: 'colecoes',
              builder: (context, params) => ColecoesWidget(
                lojista: params.getParam(
                  'lojista',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Lojistas'],
                ),
              ),
            ),
            FFRoute(
              name: 'MeusFavoritosCopy',
              path: 'meusFavoritosCopy',
              builder: (context, params) => MeusFavoritosCopyWidget(
                lojistas: params.getParam(
                  'lojistas',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Lojistas'],
                ),
              ),
            ),
            FFRoute(
              name: 'SejaPremium2',
              path: 'sejaPremium2',
              builder: (context, params) => SejaPremium2Widget(),
            ),
            FFRoute(
              name: 'SejaPremium',
              path: 'sejaPremium',
              builder: (context, params) => SejaPremiumWidget(),
            ),
            FFRoute(
              name: 'PaginaAdministrativaDoVendedor',
              path: 'paginaAdministrativaDoVendedor',
              builder: (context, params) =>
                  PaginaAdministrativaDoVendedorWidget(),
            ),
            FFRoute(
              name: 'PaginaDeCriarAnuncios',
              path: 'paginaDeCriarAnuncios',
              builder: (context, params) => PaginaDeCriarAnunciosWidget(),
            ),
            FFRoute(
              name: 'painelAdministrativo',
              path: 'painelAdministrativo',
              builder: (context, params) => PainelAdministrativoWidget(),
            ),
            FFRoute(
              name: 'fazerUmAnuncio',
              path: 'fazerUmAnuncio',
              builder: (context, params) => FazerUmAnuncioWidget(),
            ),
            FFRoute(
              name: 'enviarNotificacao',
              path: 'enviarNotificacao',
              builder: (context, params) => EnviarNotificacaoWidget(),
            ),
            FFRoute(
              name: 'resumoDoPedido',
              path: 'resumoDoPedido',
              builder: (context, params) => ResumoDoPedidoWidget(
                valor: params.getParam(
                  'valor',
                  ParamType.String,
                ),
                valorDouble: params.getParam(
                  'valorDouble',
                  ParamType.double,
                ),
                tipodePlano: params.getParam(
                  'tipodePlano',
                  ParamType.String,
                ),
                cpfCnpj: params.getParam(
                  'cpfCnpj',
                  ParamType.String,
                ),
                customer: params.getParam(
                  'customer',
                  ParamType.String,
                ),
                celular: params.getParam(
                  'celular',
                  ParamType.String,
                ),
                cep: params.getParam(
                  'cep',
                  ParamType.String,
                ),
                numberCasa: params.getParam(
                  'numberCasa',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'planos',
              path: 'planos',
              builder: (context, params) => PlanosWidget(),
            ),
            FFRoute(
              name: 'gerenciarProdutos',
              path: 'gerenciarProdutos',
              builder: (context, params) => GerenciarProdutosWidget(
                lojista: params.getParam(
                  'lojista',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Lojistas'],
                ),
              ),
            ),
            FFRoute(
              name: 'gerenciarAnuncios',
              path: 'gerenciarAnuncios',
              builder: (context, params) => GerenciarAnunciosWidget(),
            ),
            FFRoute(
              name: 'notificacao',
              path: 'notificacao',
              builder: (context, params) => NotificacaoWidget(),
            ),
            FFRoute(
              name: 'onboard',
              path: 'onboard',
              builder: (context, params) => OnboardWidget(),
            ),
            FFRoute(
              name: 'enderecoAntesDaCompra',
              path: 'enderecoAntesDaCompra',
              builder: (context, params) => EnderecoAntesDaCompraWidget(
                valor: params.getParam(
                  'valor',
                  ParamType.String,
                ),
                valorDouble: params.getParam(
                  'valorDouble',
                  ParamType.double,
                ),
                tipoDePlano: params.getParam(
                  'tipoDePlano',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'editarProduto',
              path: 'editarProduto',
              asyncParams: {
                'produtoRef': getDoc(['Lojistas', 'Seusprodutos'],
                    SeusprodutosRecord.fromSnapshot),
              },
              builder: (context, params) => EditarProdutoWidget(
                produtoRef: params.getParam(
                  'produtoRef',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'CriarPerfilDePrestadorCopy2',
              path: 'criarPerfilDePrestadorCopy2',
              builder: (context, params) => CriarPerfilDePrestadorCopy2Widget(),
            ),
            FFRoute(
              name: 'criarServico',
              path: 'criarServico',
              builder: (context, params) => CriarServicoWidget(),
            ),
            FFRoute(
              name: 'servicoDoPrestadorDeServico1',
              path: 'servicoDoPrestadorDeServico1',
              builder: (context, params) => ServicoDoPrestadorDeServico1Widget(
                meuServico: params.getParam(
                  'meuServico',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['PrestadoresDeServicos', 'meuServicos'],
                ),
              ),
            ),
            FFRoute(
              name: 'paginaDeVendaDeServico',
              path: 'paginaDeVendaDeServico',
              builder: (context, params) => PaginaDeVendaDeServicoWidget(),
            ),
            FFRoute(
              name: 'MinhaContaFoiInvadida',
              path: 'minhaContaFoiInvadida',
              builder: (context, params) => MinhaContaFoiInvadidaWidget(),
            ),
            FFRoute(
              name: 'NaoEncontroMeuEndereco',
              path: 'naoEncontroMeuEndereco',
              builder: (context, params) => NaoEncontroMeuEnderecoWidget(),
            ),
            FFRoute(
              name: 'myFavorite',
              path: 'myFavorite',
              builder: (context, params) => MyFavoriteWidget(),
            ),
            FFRoute(
              name: 'antesDoCriarAnuncio',
              path: 'antesDoCriarAnuncio',
              builder: (context, params) => AntesDoCriarAnuncioWidget(),
            ),
            FFRoute(
              name: 'alterarMinhaSenha',
              path: 'alterarMinhaSenha',
              builder: (context, params) => AlterarMinhaSenhaWidget(),
            ),
            FFRoute(
              name: 'QueroAlterarDadosDaConta',
              path: 'queroAlterarDadosDaConta',
              builder: (context, params) => QueroAlterarDadosDaContaWidget(),
            ),
            FFRoute(
              name: 'configuracoesDaConta',
              path: 'configuracoesDaConta',
              builder: (context, params) => ConfiguracoesDaContaWidget(),
            ),
            FFRoute(
              name: 'QueroAlterarMinhaSenha',
              path: 'queroAlterarMinhaSenha',
              builder: (context, params) => QueroAlterarMinhaSenhaWidget(),
            ),
            FFRoute(
              name: 'PoliticaDeCacelamento',
              path: 'politicaDeCacelamento',
              builder: (context, params) => PoliticaDeCacelamentoWidget(),
            ),
            FFRoute(
              name: 'TermosDeUso',
              path: 'termosDeUso',
              builder: (context, params) => TermosDeUsoWidget(),
            ),
            FFRoute(
              name: 'DeclaracaoDePrivacidade',
              path: 'declaracaoDePrivacidade',
              builder: (context, params) => DeclaracaoDePrivacidadeWidget(),
            ),
            FFRoute(
              name: 'QueroUmaCopiaDosDados',
              path: 'queroUmaCopiaDosDados',
              builder: (context, params) => QueroUmaCopiaDosDadosWidget(),
            ),
            FFRoute(
              name: 'DicasDeSeguranca',
              path: 'dicasDeSeguranca',
              builder: (context, params) => DicasDeSegurancaWidget(),
            ),
            FFRoute(
              name: 'ExcluirMinhaConta',
              path: 'excluirMinhaConta',
              builder: (context, params) => ExcluirMinhaContaWidget(),
            ),
            FFRoute(
              name: 'ExcluirDadosDoCartaoDeCredito',
              path: 'excluirDadosDoCartaoDeCredito',
              builder: (context, params) =>
                  ExcluirDadosDoCartaoDeCreditoWidget(),
            ),
            FFRoute(
              name: 'painelAdministrativoPrestador',
              path: 'painelAdministrativoPrestador',
              builder: (context, params) =>
                  PainelAdministrativoPrestadorWidget(),
            ),
            FFRoute(
              name: 'PainelAdministrativoDoApp',
              path: 'painelAdministrativoDoApp',
              builder: (context, params) => PainelAdministrativoDoAppWidget(),
            ),
            FFRoute(
              name: 'slogan',
              path: 'slogan',
              builder: (context, params) => SloganWidget(),
            ),
            FFRoute(
              name: 'talvez',
              path: 'talvez',
              builder: (context, params) => TalvezWidget(),
            ),
            FFRoute(
              name: 'vestuario',
              path: 'vestuario',
              builder: (context, params) => VestuarioWidget(),
            ),
            FFRoute(
              name: 'CriarConta2',
              path: 'criarConta2',
              builder: (context, params) => CriarConta2Widget(),
            ),
            FFRoute(
              name: 'esqueceminhasenha111',
              path: 'esqueceminhasenha111',
              builder: (context, params) => Esqueceminhasenha111Widget(),
            ),
            FFRoute(
              name: 'recuperarSenha',
              path: 'recuperarSenha',
              builder: (context, params) => RecuperarSenhaWidget(),
            ),
            FFRoute(
              name: 'BelezaeAcessorios',
              path: 'belezaeAcessorios',
              builder: (context, params) => BelezaeAcessoriosWidget(),
            ),
            FFRoute(
              name: 'AutomoveisAcessorios',
              path: 'automoveisAcessorios',
              builder: (context, params) => AutomoveisAcessoriosWidget(),
            ),
            FFRoute(
              name: 'maisVendido',
              path: 'maisVendido',
              builder: (context, params) => MaisVendidoWidget(),
            ),
            FFRoute(
              name: 'pesquisa',
              path: 'pesquisa',
              asyncParams: {
                'pesquisa': getDocList(['Lojistas', 'Seusprodutos'],
                    SeusprodutosRecord.fromSnapshot),
              },
              builder: (context, params) => PesquisaWidget(
                pesquisa: params.getParam<SeusprodutosRecord>(
                  'pesquisa',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'calcados',
              path: 'calcados',
              builder: (context, params) => CalcadosWidget(),
            ),
            FFRoute(
              name: 'moda',
              path: 'moda',
              builder: (context, params) => ModaWidget(),
            ),
            FFRoute(
              name: 'BazarAcessorios',
              path: 'bazarAcessorios',
              builder: (context, params) => BazarAcessoriosWidget(),
            ),
            FFRoute(
              name: 'CasaDecoracao',
              path: 'casaDecoracao',
              builder: (context, params) => CasaDecoracaoWidget(),
            ),
            FFRoute(
              name: 'search',
              path: 'search',
              asyncParams: {
                'pesquisa': getDocList(['searchs'], SearchsRecord.fromSnapshot),
              },
              builder: (context, params) => SearchWidget(
                pesquisa: params.getParam<SearchsRecord>(
                  'pesquisa',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'pagamentosModoAdmin',
              path: 'pagamentosModoAdmin',
              builder: (context, params) => PagamentosModoAdminWidget(),
            ),
            FFRoute(
              name: 'lojasCadastradas',
              path: 'lojasCadastradas',
              builder: (context, params) => LojasCadastradasWidget(),
            ),
            FFRoute(
              name: 'enviarNotificacaoModoAdmin',
              path: 'enviarNotificacaoModoAdmin',
              builder: (context, params) => EnviarNotificacaoModoAdminWidget(),
            ),
            FFRoute(
              name: 'fazerAnuncioPrestador',
              path: 'fazerAnuncioPrestador',
              builder: (context, params) => FazerAnuncioPrestadorWidget(),
            ),
            FFRoute(
              name: 'editarPerfilDeLojista',
              path: 'editarPerfilDeLojista',
              builder: (context, params) => EditarPerfilDeLojistaWidget(
                lojistas: params.getParam(
                  'lojistas',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Lojistas'],
                ),
              ),
            ),
            FFRoute(
              name: 'editarPerfilDePrestador',
              path: 'editarPerfilDePrestador',
              builder: (context, params) => EditarPerfilDePrestadorWidget(
                prestador: params.getParam(
                  'prestador',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['PrestadoresDeServicos'],
                ),
              ),
            ),
            FFRoute(
              name: 'eoteste',
              path: 'eoteste',
              builder: (context, params) => EotesteWidget(),
            ),
            FFRoute(
              name: 'editarComerciante',
              path: 'editarComerciante',
              builder: (context, params) => EditarComercianteWidget(
                lojista: params.getParam(
                  'lojista',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Lojistas'],
                ),
              ),
            ),
            FFRoute(
              name: 'editarComerciantePrestador',
              path: 'editarComerciantePrestador',
              builder: (context, params) => EditarComerciantePrestadorWidget(
                prestador: params.getParam(
                  'prestador',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['PrestadoresDeServicos'],
                ),
              ),
            ),
            FFRoute(
              name: 'AlterarDados',
              path: 'alterarDados',
              builder: (context, params) => AlterarDadosWidget(),
            ),
            FFRoute(
              name: 'TicketEnviado',
              path: 'ticketEnviado',
              builder: (context, params) => TicketEnviadoWidget(),
            ),
            FFRoute(
              name: 'processarPagamento',
              path: 'processarPagamento',
              builder: (context, params) => ProcessarPagamentoWidget(
                valor: params.getParam(
                  'valor',
                  ParamType.String,
                ),
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                cpf: params.getParam(
                  'cpf',
                  ParamType.String,
                ),
                invoiceURL: params.getParam(
                  'invoiceURL',
                  ParamType.String,
                ),
                valorDouble: params.getParam(
                  'valorDouble',
                  ParamType.double,
                ),
                invoiceNumber: params.getParam(
                  'invoiceNumber',
                  ParamType.String,
                ),
                tipoDePlano: params.getParam(
                  'tipoDePlano',
                  ParamType.String,
                ),
                admin: params.getParam<DocumentReference>(
                  'admin',
                  ParamType.DocumentReference,
                  isList: true,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'PaginaInicialLojistaCopy',
              path: 'paginaInicialLojistaCopy',
              builder: (context, params) => PaginaInicialLojistaCopyWidget(),
            ),
            FFRoute(
              name: 'termoDeUsoDoApp',
              path: 'termoDeUsoDoApp',
              builder: (context, params) => TermoDeUsoDoAppWidget(),
            ),
            FFRoute(
              name: 'politicadepriv',
              path: 'politicadepriv',
              builder: (context, params) => PoliticadeprivWidget(),
            ),
            FFRoute(
              name: 'emConstrucao',
              path: 'emConstrucao',
              builder: (context, params) => EmConstrucaoWidget(),
            ),
            FFRoute(
              name: 'ajudasuporte',
              path: 'ajudasuporte',
              builder: (context, params) => AjudasuporteWidget(),
            ),
            FFRoute(
              name: 'pagRelatorios',
              path: 'pagRelatorios',
              builder: (context, params) => PagRelatoriosWidget(
                lojista: params.getParam(
                  'lojista',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Lojistas'],
                ),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/paginaInicialLojistaCopy';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

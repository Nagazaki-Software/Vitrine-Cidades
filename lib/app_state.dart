import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _corDaBarraDeNavegacao =
          prefs.getBool('ff_corDaBarraDeNavegacao') ?? _corDaBarraDeNavegacao;
    });
    _safeInit(() {
      _mudarPaginaInicial =
          prefs.getBool('ff_mudarPaginaInicial') ?? _mudarPaginaInicial;
    });
    _safeInit(() {
      _favoritos = prefs.getBool('ff_favoritos') ?? _favoritos;
    });
    _safeInit(() {
      _diaDoPedido = prefs.containsKey('ff_diaDoPedido')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_diaDoPedido')!)
          : _diaDoPedido;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _corDaBarraDeNavegacao = false;
  bool get corDaBarraDeNavegacao => _corDaBarraDeNavegacao;
  set corDaBarraDeNavegacao(bool value) {
    _corDaBarraDeNavegacao = value;
    prefs.setBool('ff_corDaBarraDeNavegacao', value);
  }

  bool _mudarPaginaInicial = false;
  bool get mudarPaginaInicial => _mudarPaginaInicial;
  set mudarPaginaInicial(bool value) {
    _mudarPaginaInicial = value;
    prefs.setBool('ff_mudarPaginaInicial', value);
  }

  String _categoria = '';
  String get categoria => _categoria;
  set categoria(String value) {
    _categoria = value;
  }

  List<String> _variacoes = [];
  List<String> get variacoes => _variacoes;
  set variacoes(List<String> value) {
    _variacoes = value;
  }

  void addToVariacoes(String value) {
    variacoes.add(value);
  }

  void removeFromVariacoes(String value) {
    variacoes.remove(value);
  }

  void removeAtIndexFromVariacoes(int index) {
    variacoes.removeAt(index);
  }

  void updateVariacoesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    variacoes[index] = updateFn(_variacoes[index]);
  }

  void insertAtIndexInVariacoes(int index, String value) {
    variacoes.insert(index, value);
  }

  List<String> _fotosDasVariacoes = [];
  List<String> get fotosDasVariacoes => _fotosDasVariacoes;
  set fotosDasVariacoes(List<String> value) {
    _fotosDasVariacoes = value;
  }

  void addToFotosDasVariacoes(String value) {
    fotosDasVariacoes.add(value);
  }

  void removeFromFotosDasVariacoes(String value) {
    fotosDasVariacoes.remove(value);
  }

  void removeAtIndexFromFotosDasVariacoes(int index) {
    fotosDasVariacoes.removeAt(index);
  }

  void updateFotosDasVariacoesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    fotosDasVariacoes[index] = updateFn(_fotosDasVariacoes[index]);
  }

  void insertAtIndexInFotosDasVariacoes(int index, String value) {
    fotosDasVariacoes.insert(index, value);
  }

  bool _navBarBool = false;
  bool get navBarBool => _navBarBool;
  set navBarBool(bool value) {
    _navBarBool = value;
  }

  String _tipoDeAssinatura = '';
  String get tipoDeAssinatura => _tipoDeAssinatura;
  set tipoDeAssinatura(String value) {
    _tipoDeAssinatura = value;
  }

  bool _favoritos = false;
  bool get favoritos => _favoritos;
  set favoritos(bool value) {
    _favoritos = value;
    prefs.setBool('ff_favoritos', value);
  }

  DateTime? _diaDoPedido;
  DateTime? get diaDoPedido => _diaDoPedido;
  set diaDoPedido(DateTime? value) {
    _diaDoPedido = value;
    value != null
        ? prefs.setInt('ff_diaDoPedido', value.millisecondsSinceEpoch)
        : prefs.remove('ff_diaDoPedido');
  }

  bool _alertaDeVencimentoDaAssinatura = false;
  bool get alertaDeVencimentoDaAssinatura => _alertaDeVencimentoDaAssinatura;
  set alertaDeVencimentoDaAssinatura(bool value) {
    _alertaDeVencimentoDaAssinatura = value;
  }

  bool _planoAnual = false;
  bool get planoAnual => _planoAnual;
  set planoAnual(bool value) {
    _planoAnual = value;
  }

  int _currency = 0;
  int get currency => _currency;
  set currency(int value) {
    _currency = value;
  }

  bool _contratarSuporte = false;
  bool get contratarSuporte => _contratarSuporte;
  set contratarSuporte(bool value) {
    _contratarSuporte = value;
  }

  VisitasStruct _visitas = VisitasStruct();
  VisitasStruct get visitas => _visitas;
  set visitas(VisitasStruct value) {
    _visitas = value;
  }

  void updateVisitasStruct(Function(VisitasStruct) updateFn) {
    updateFn(_visitas);
  }

  final _querryProdutosParaAdicionarManager =
      StreamRequestManager<SeusprodutosRecord>();
  Stream<SeusprodutosRecord> querryProdutosParaAdicionar({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<SeusprodutosRecord> Function() requestFn,
  }) =>
      _querryProdutosParaAdicionarManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQuerryProdutosParaAdicionarCache() =>
      _querryProdutosParaAdicionarManager.clear();
  void clearQuerryProdutosParaAdicionarCacheKey(String? uniqueKey) =>
      _querryProdutosParaAdicionarManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

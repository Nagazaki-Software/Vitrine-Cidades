import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LojistasRecord extends FirestoreRecord {
  LojistasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeEmpresarialDoComerciante" field.
  String? _nomeEmpresarialDoComerciante;
  String get nomeEmpresarialDoComerciante =>
      _nomeEmpresarialDoComerciante ?? '';
  bool hasNomeEmpresarialDoComerciante() =>
      _nomeEmpresarialDoComerciante != null;

  // "localizacao" field.
  LatLng? _localizacao;
  LatLng? get localizacao => _localizacao;
  bool hasLocalizacao() => _localizacao != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  bool hasEndereco() => _endereco != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "fotoDePerfil" field.
  String? _fotoDePerfil;
  String get fotoDePerfil => _fotoDePerfil ?? '';
  bool hasFotoDePerfil() => _fotoDePerfil != null;

  // "fotoDeCapa" field.
  String? _fotoDeCapa;
  String get fotoDeCapa => _fotoDeCapa ?? '';
  bool hasFotoDeCapa() => _fotoDeCapa != null;

  // "avaliacaoes" field.
  DocumentReference? _avaliacaoes;
  DocumentReference? get avaliacaoes => _avaliacaoes;
  bool hasAvaliacaoes() => _avaliacaoes != null;

  // "SeusProdutos" field.
  DocumentReference? _seusProdutos;
  DocumentReference? get seusProdutos => _seusProdutos;
  bool hasSeusProdutos() => _seusProdutos != null;

  // "idDoComerciante" field.
  String? _idDoComerciante;
  String get idDoComerciante => _idDoComerciante ?? '';
  bool hasIdDoComerciante() => _idDoComerciante != null;

  // "seguidores" field.
  int? _seguidores;
  int get seguidores => _seguidores ?? 0;
  bool hasSeguidores() => _seguidores != null;

  // "PrestadorOuLojista" field.
  bool? _prestadorOuLojista;
  bool get prestadorOuLojista => _prestadorOuLojista ?? false;
  bool hasPrestadorOuLojista() => _prestadorOuLojista != null;

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  bool hasTelefone() => _telefone != null;

  // "ImagensVariacoes" field.
  List<String>? _imagensVariacoes;
  List<String> get imagensVariacoes => _imagensVariacoes ?? const [];
  bool hasImagensVariacoes() => _imagensVariacoes != null;

  // "nomeDasVariacoes" field.
  List<String>? _nomeDasVariacoes;
  List<String> get nomeDasVariacoes => _nomeDasVariacoes ?? const [];
  bool hasNomeDasVariacoes() => _nomeDasVariacoes != null;

  // "uidDoUsuario" field.
  String? _uidDoUsuario;
  String get uidDoUsuario => _uidDoUsuario ?? '';
  bool hasUidDoUsuario() => _uidDoUsuario != null;

  // "suasVendas" field.
  int? _suasVendas;
  int get suasVendas => _suasVendas ?? 0;
  bool hasSuasVendas() => _suasVendas != null;

  // "seguidoresList" field.
  List<String>? _seguidoresList;
  List<String> get seguidoresList => _seguidoresList ?? const [];
  bool hasSeguidoresList() => _seguidoresList != null;

  // "CNPJ" field.
  double? _cnpj;
  double get cnpj => _cnpj ?? 0.0;
  bool hasCnpj() => _cnpj != null;

  // "todosOsClicks" field.
  int? _todosOsClicks;
  int get todosOsClicks => _todosOsClicks ?? 0;
  bool hasTodosOsClicks() => _todosOsClicks != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "descricaoDaloja" field.
  String? _descricaoDaloja;
  String get descricaoDaloja => _descricaoDaloja ?? '';
  bool hasDescricaoDaloja() => _descricaoDaloja != null;

  // "horarioDeAbertura" field.
  String? _horarioDeAbertura;
  String get horarioDeAbertura => _horarioDeAbertura ?? '';
  bool hasHorarioDeAbertura() => _horarioDeAbertura != null;

  // "horarioDeFechamento" field.
  String? _horarioDeFechamento;
  String get horarioDeFechamento => _horarioDeFechamento ?? '';
  bool hasHorarioDeFechamento() => _horarioDeFechamento != null;

  // "aceitaCartoes" field.
  bool? _aceitaCartoes;
  bool get aceitaCartoes => _aceitaCartoes ?? false;
  bool hasAceitaCartoes() => _aceitaCartoes != null;

  // "qualPlano" field.
  String? _qualPlano;
  String get qualPlano => _qualPlano ?? '';
  bool hasQualPlano() => _qualPlano != null;

  // "produtosDisponiveisParaAdicionar" field.
  int? _produtosDisponiveisParaAdicionar;
  int get produtosDisponiveisParaAdicionar =>
      _produtosDisponiveisParaAdicionar ?? 0;
  bool hasProdutosDisponiveisParaAdicionar() =>
      _produtosDisponiveisParaAdicionar != null;

  // "assinaturaVencida" field.
  bool? _assinaturaVencida;
  bool get assinaturaVencida => _assinaturaVencida ?? false;
  bool hasAssinaturaVencida() => _assinaturaVencida != null;

  // "cartoes" field.
  bool? _cartoes;
  bool get cartoes => _cartoes ?? false;
  bool hasCartoes() => _cartoes != null;

  // "pix" field.
  bool? _pix;
  bool get pix => _pix ?? false;
  bool hasPix() => _pix != null;

  // "dinheiro" field.
  bool? _dinheiro;
  bool get dinheiro => _dinheiro ?? false;
  bool hasDinheiro() => _dinheiro != null;

  // "idDoLojista" field.
  String? _idDoLojista;
  String get idDoLojista => _idDoLojista ?? '';
  bool hasIdDoLojista() => _idDoLojista != null;

  // "curtiramList" field.
  List<String>? _curtiramList;
  List<String> get curtiramList => _curtiramList ?? const [];
  bool hasCurtiramList() => _curtiramList != null;

  // "visitas" field.
  List<VisitasStruct>? _visitas;
  List<VisitasStruct> get visitas => _visitas ?? const [];
  bool hasVisitas() => _visitas != null;

  // "seguidoresdata" field.
  List<SeguidoresStruct>? _seguidoresdata;
  List<SeguidoresStruct> get seguidoresdata => _seguidoresdata ?? const [];
  bool hasSeguidoresdata() => _seguidoresdata != null;

  // "suspenso" field.
  bool? _suspenso;
  bool get suspenso => _suspenso ?? false;
  bool hasSuspenso() => _suspenso != null;

  void _initializeFields() {
    _nomeEmpresarialDoComerciante =
        snapshotData['nomeEmpresarialDoComerciante'] as String?;
    _localizacao = snapshotData['localizacao'] as LatLng?;
    _endereco = snapshotData['endereco'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _fotoDePerfil = snapshotData['fotoDePerfil'] as String?;
    _fotoDeCapa = snapshotData['fotoDeCapa'] as String?;
    _avaliacaoes = snapshotData['avaliacaoes'] as DocumentReference?;
    _seusProdutos = snapshotData['SeusProdutos'] as DocumentReference?;
    _idDoComerciante = snapshotData['idDoComerciante'] as String?;
    _seguidores = castToType<int>(snapshotData['seguidores']);
    _prestadorOuLojista = snapshotData['PrestadorOuLojista'] as bool?;
    _telefone = snapshotData['telefone'] as String?;
    _imagensVariacoes = getDataList(snapshotData['ImagensVariacoes']);
    _nomeDasVariacoes = getDataList(snapshotData['nomeDasVariacoes']);
    _uidDoUsuario = snapshotData['uidDoUsuario'] as String?;
    _suasVendas = castToType<int>(snapshotData['suasVendas']);
    _seguidoresList = getDataList(snapshotData['seguidoresList']);
    _cnpj = castToType<double>(snapshotData['CNPJ']);
    _todosOsClicks = castToType<int>(snapshotData['todosOsClicks']);
    _categoria = snapshotData['categoria'] as String?;
    _descricaoDaloja = snapshotData['descricaoDaloja'] as String?;
    _horarioDeAbertura = snapshotData['horarioDeAbertura'] as String?;
    _horarioDeFechamento = snapshotData['horarioDeFechamento'] as String?;
    _aceitaCartoes = snapshotData['aceitaCartoes'] as bool?;
    _qualPlano = snapshotData['qualPlano'] as String?;
    _produtosDisponiveisParaAdicionar =
        castToType<int>(snapshotData['produtosDisponiveisParaAdicionar']);
    _assinaturaVencida = snapshotData['assinaturaVencida'] as bool?;
    _cartoes = snapshotData['cartoes'] as bool?;
    _pix = snapshotData['pix'] as bool?;
    _dinheiro = snapshotData['dinheiro'] as bool?;
    _idDoLojista = snapshotData['idDoLojista'] as String?;
    _curtiramList = getDataList(snapshotData['curtiramList']);
    _visitas = getStructList(
      snapshotData['visitas'],
      VisitasStruct.fromMap,
    );
    _seguidoresdata = getStructList(
      snapshotData['seguidoresdata'],
      SeguidoresStruct.fromMap,
    );
    _suspenso = snapshotData['suspenso'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Lojistas');

  static Stream<LojistasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LojistasRecord.fromSnapshot(s));

  static Future<LojistasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LojistasRecord.fromSnapshot(s));

  static LojistasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LojistasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LojistasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LojistasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LojistasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LojistasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLojistasRecordData({
  String? nomeEmpresarialDoComerciante,
  LatLng? localizacao,
  String? endereco,
  String? descricao,
  String? fotoDePerfil,
  String? fotoDeCapa,
  DocumentReference? avaliacaoes,
  DocumentReference? seusProdutos,
  String? idDoComerciante,
  int? seguidores,
  bool? prestadorOuLojista,
  String? telefone,
  String? uidDoUsuario,
  int? suasVendas,
  double? cnpj,
  int? todosOsClicks,
  String? categoria,
  String? descricaoDaloja,
  String? horarioDeAbertura,
  String? horarioDeFechamento,
  bool? aceitaCartoes,
  String? qualPlano,
  int? produtosDisponiveisParaAdicionar,
  bool? assinaturaVencida,
  bool? cartoes,
  bool? pix,
  bool? dinheiro,
  String? idDoLojista,
  bool? suspenso,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeEmpresarialDoComerciante': nomeEmpresarialDoComerciante,
      'localizacao': localizacao,
      'endereco': endereco,
      'descricao': descricao,
      'fotoDePerfil': fotoDePerfil,
      'fotoDeCapa': fotoDeCapa,
      'avaliacaoes': avaliacaoes,
      'SeusProdutos': seusProdutos,
      'idDoComerciante': idDoComerciante,
      'seguidores': seguidores,
      'PrestadorOuLojista': prestadorOuLojista,
      'telefone': telefone,
      'uidDoUsuario': uidDoUsuario,
      'suasVendas': suasVendas,
      'CNPJ': cnpj,
      'todosOsClicks': todosOsClicks,
      'categoria': categoria,
      'descricaoDaloja': descricaoDaloja,
      'horarioDeAbertura': horarioDeAbertura,
      'horarioDeFechamento': horarioDeFechamento,
      'aceitaCartoes': aceitaCartoes,
      'qualPlano': qualPlano,
      'produtosDisponiveisParaAdicionar': produtosDisponiveisParaAdicionar,
      'assinaturaVencida': assinaturaVencida,
      'cartoes': cartoes,
      'pix': pix,
      'dinheiro': dinheiro,
      'idDoLojista': idDoLojista,
      'suspenso': suspenso,
    }.withoutNulls,
  );

  return firestoreData;
}

class LojistasRecordDocumentEquality implements Equality<LojistasRecord> {
  const LojistasRecordDocumentEquality();

  @override
  bool equals(LojistasRecord? e1, LojistasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nomeEmpresarialDoComerciante ==
            e2?.nomeEmpresarialDoComerciante &&
        e1?.localizacao == e2?.localizacao &&
        e1?.endereco == e2?.endereco &&
        e1?.descricao == e2?.descricao &&
        e1?.fotoDePerfil == e2?.fotoDePerfil &&
        e1?.fotoDeCapa == e2?.fotoDeCapa &&
        e1?.avaliacaoes == e2?.avaliacaoes &&
        e1?.seusProdutos == e2?.seusProdutos &&
        e1?.idDoComerciante == e2?.idDoComerciante &&
        e1?.seguidores == e2?.seguidores &&
        e1?.prestadorOuLojista == e2?.prestadorOuLojista &&
        e1?.telefone == e2?.telefone &&
        listEquality.equals(e1?.imagensVariacoes, e2?.imagensVariacoes) &&
        listEquality.equals(e1?.nomeDasVariacoes, e2?.nomeDasVariacoes) &&
        e1?.uidDoUsuario == e2?.uidDoUsuario &&
        e1?.suasVendas == e2?.suasVendas &&
        listEquality.equals(e1?.seguidoresList, e2?.seguidoresList) &&
        e1?.cnpj == e2?.cnpj &&
        e1?.todosOsClicks == e2?.todosOsClicks &&
        e1?.categoria == e2?.categoria &&
        e1?.descricaoDaloja == e2?.descricaoDaloja &&
        e1?.horarioDeAbertura == e2?.horarioDeAbertura &&
        e1?.horarioDeFechamento == e2?.horarioDeFechamento &&
        e1?.aceitaCartoes == e2?.aceitaCartoes &&
        e1?.qualPlano == e2?.qualPlano &&
        e1?.produtosDisponiveisParaAdicionar ==
            e2?.produtosDisponiveisParaAdicionar &&
        e1?.assinaturaVencida == e2?.assinaturaVencida &&
        e1?.cartoes == e2?.cartoes &&
        e1?.pix == e2?.pix &&
        e1?.dinheiro == e2?.dinheiro &&
        e1?.idDoLojista == e2?.idDoLojista &&
        listEquality.equals(e1?.curtiramList, e2?.curtiramList) &&
        listEquality.equals(e1?.visitas, e2?.visitas) &&
        listEquality.equals(e1?.seguidoresdata, e2?.seguidoresdata) &&
        e1?.suspenso == e2?.suspenso;
  }

  @override
  int hash(LojistasRecord? e) => const ListEquality().hash([
        e?.nomeEmpresarialDoComerciante,
        e?.localizacao,
        e?.endereco,
        e?.descricao,
        e?.fotoDePerfil,
        e?.fotoDeCapa,
        e?.avaliacaoes,
        e?.seusProdutos,
        e?.idDoComerciante,
        e?.seguidores,
        e?.prestadorOuLojista,
        e?.telefone,
        e?.imagensVariacoes,
        e?.nomeDasVariacoes,
        e?.uidDoUsuario,
        e?.suasVendas,
        e?.seguidoresList,
        e?.cnpj,
        e?.todosOsClicks,
        e?.categoria,
        e?.descricaoDaloja,
        e?.horarioDeAbertura,
        e?.horarioDeFechamento,
        e?.aceitaCartoes,
        e?.qualPlano,
        e?.produtosDisponiveisParaAdicionar,
        e?.assinaturaVencida,
        e?.cartoes,
        e?.pix,
        e?.dinheiro,
        e?.idDoLojista,
        e?.curtiramList,
        e?.visitas,
        e?.seguidoresdata,
        e?.suspenso
      ]);

  @override
  bool isValidKey(Object? o) => o is LojistasRecord;
}

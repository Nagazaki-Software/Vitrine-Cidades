import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrestadoresDeServicosRecord extends FirestoreRecord {
  PrestadoresDeServicosRecord._(
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

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  bool hasTelefone() => _telefone != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "seguidores" field.
  int? _seguidores;
  int get seguidores => _seguidores ?? 0;
  bool hasSeguidores() => _seguidores != null;

  // "localizacaoDoComerciante" field.
  LatLng? _localizacaoDoComerciante;
  LatLng? get localizacaoDoComerciante => _localizacaoDoComerciante;
  bool hasLocalizacaoDoComerciante() => _localizacaoDoComerciante != null;

  // "descricaoDaLoja" field.
  String? _descricaoDaLoja;
  String get descricaoDaLoja => _descricaoDaLoja ?? '';
  bool hasDescricaoDaLoja() => _descricaoDaLoja != null;

  // "diasAbertos" field.
  List<String>? _diasAbertos;
  List<String> get diasAbertos => _diasAbertos ?? const [];
  bool hasDiasAbertos() => _diasAbertos != null;

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

  // "clicks" field.
  int? _clicks;
  int get clicks => _clicks ?? 0;
  bool hasClicks() => _clicks != null;

  // "uidDoUsuario" field.
  String? _uidDoUsuario;
  String get uidDoUsuario => _uidDoUsuario ?? '';
  bool hasUidDoUsuario() => _uidDoUsuario != null;

  // "CNPJ" field.
  double? _cnpj;
  double get cnpj => _cnpj ?? 0.0;
  bool hasCnpj() => _cnpj != null;

  // "idDoPrestador" field.
  String? _idDoPrestador;
  String get idDoPrestador => _idDoPrestador ?? '';
  bool hasIdDoPrestador() => _idDoPrestador != null;

  void _initializeFields() {
    _nomeEmpresarialDoComerciante =
        snapshotData['nomeEmpresarialDoComerciante'] as String?;
    _localizacao = snapshotData['localizacao'] as LatLng?;
    _endereco = snapshotData['endereco'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _fotoDePerfil = snapshotData['fotoDePerfil'] as String?;
    _fotoDeCapa = snapshotData['fotoDeCapa'] as String?;
    _telefone = snapshotData['telefone'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _seguidores = castToType<int>(snapshotData['seguidores']);
    _localizacaoDoComerciante =
        snapshotData['localizacaoDoComerciante'] as LatLng?;
    _descricaoDaLoja = snapshotData['descricaoDaLoja'] as String?;
    _diasAbertos = getDataList(snapshotData['diasAbertos']);
    _horarioDeAbertura = snapshotData['horarioDeAbertura'] as String?;
    _horarioDeFechamento = snapshotData['horarioDeFechamento'] as String?;
    _aceitaCartoes = snapshotData['aceitaCartoes'] as bool?;
    _qualPlano = snapshotData['qualPlano'] as String?;
    _clicks = castToType<int>(snapshotData['clicks']);
    _uidDoUsuario = snapshotData['uidDoUsuario'] as String?;
    _cnpj = castToType<double>(snapshotData['CNPJ']);
    _idDoPrestador = snapshotData['idDoPrestador'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PrestadoresDeServicos');

  static Stream<PrestadoresDeServicosRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PrestadoresDeServicosRecord.fromSnapshot(s));

  static Future<PrestadoresDeServicosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PrestadoresDeServicosRecord.fromSnapshot(s));

  static PrestadoresDeServicosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrestadoresDeServicosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrestadoresDeServicosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrestadoresDeServicosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrestadoresDeServicosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrestadoresDeServicosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrestadoresDeServicosRecordData({
  String? nomeEmpresarialDoComerciante,
  LatLng? localizacao,
  String? endereco,
  String? descricao,
  String? fotoDePerfil,
  String? fotoDeCapa,
  String? telefone,
  String? categoria,
  int? seguidores,
  LatLng? localizacaoDoComerciante,
  String? descricaoDaLoja,
  String? horarioDeAbertura,
  String? horarioDeFechamento,
  bool? aceitaCartoes,
  String? qualPlano,
  int? clicks,
  String? uidDoUsuario,
  double? cnpj,
  String? idDoPrestador,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeEmpresarialDoComerciante': nomeEmpresarialDoComerciante,
      'localizacao': localizacao,
      'endereco': endereco,
      'descricao': descricao,
      'fotoDePerfil': fotoDePerfil,
      'fotoDeCapa': fotoDeCapa,
      'telefone': telefone,
      'categoria': categoria,
      'seguidores': seguidores,
      'localizacaoDoComerciante': localizacaoDoComerciante,
      'descricaoDaLoja': descricaoDaLoja,
      'horarioDeAbertura': horarioDeAbertura,
      'horarioDeFechamento': horarioDeFechamento,
      'aceitaCartoes': aceitaCartoes,
      'qualPlano': qualPlano,
      'clicks': clicks,
      'uidDoUsuario': uidDoUsuario,
      'CNPJ': cnpj,
      'idDoPrestador': idDoPrestador,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrestadoresDeServicosRecordDocumentEquality
    implements Equality<PrestadoresDeServicosRecord> {
  const PrestadoresDeServicosRecordDocumentEquality();

  @override
  bool equals(
      PrestadoresDeServicosRecord? e1, PrestadoresDeServicosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nomeEmpresarialDoComerciante ==
            e2?.nomeEmpresarialDoComerciante &&
        e1?.localizacao == e2?.localizacao &&
        e1?.endereco == e2?.endereco &&
        e1?.descricao == e2?.descricao &&
        e1?.fotoDePerfil == e2?.fotoDePerfil &&
        e1?.fotoDeCapa == e2?.fotoDeCapa &&
        e1?.telefone == e2?.telefone &&
        e1?.categoria == e2?.categoria &&
        e1?.seguidores == e2?.seguidores &&
        e1?.localizacaoDoComerciante == e2?.localizacaoDoComerciante &&
        e1?.descricaoDaLoja == e2?.descricaoDaLoja &&
        listEquality.equals(e1?.diasAbertos, e2?.diasAbertos) &&
        e1?.horarioDeAbertura == e2?.horarioDeAbertura &&
        e1?.horarioDeFechamento == e2?.horarioDeFechamento &&
        e1?.aceitaCartoes == e2?.aceitaCartoes &&
        e1?.qualPlano == e2?.qualPlano &&
        e1?.clicks == e2?.clicks &&
        e1?.uidDoUsuario == e2?.uidDoUsuario &&
        e1?.cnpj == e2?.cnpj &&
        e1?.idDoPrestador == e2?.idDoPrestador;
  }

  @override
  int hash(PrestadoresDeServicosRecord? e) => const ListEquality().hash([
        e?.nomeEmpresarialDoComerciante,
        e?.localizacao,
        e?.endereco,
        e?.descricao,
        e?.fotoDePerfil,
        e?.fotoDeCapa,
        e?.telefone,
        e?.categoria,
        e?.seguidores,
        e?.localizacaoDoComerciante,
        e?.descricaoDaLoja,
        e?.diasAbertos,
        e?.horarioDeAbertura,
        e?.horarioDeFechamento,
        e?.aceitaCartoes,
        e?.qualPlano,
        e?.clicks,
        e?.uidDoUsuario,
        e?.cnpj,
        e?.idDoPrestador
      ]);

  @override
  bool isValidKey(Object? o) => o is PrestadoresDeServicosRecord;
}

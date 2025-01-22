import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnuncioRecord extends FirestoreRecord {
  AnuncioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "localizacaoDoComerciante" field.
  LatLng? _localizacaoDoComerciante;
  LatLng? get localizacaoDoComerciante => _localizacaoDoComerciante;
  bool hasLocalizacaoDoComerciante() => _localizacaoDoComerciante != null;

  // "comprasOuServicos" field.
  bool? _comprasOuServicos;
  bool get comprasOuServicos => _comprasOuServicos ?? false;
  bool hasComprasOuServicos() => _comprasOuServicos != null;

  // "preco" field.
  double? _preco;
  double get preco => _preco ?? 0.0;
  bool hasPreco() => _preco != null;

  // "uidDoUsuario" field.
  String? _uidDoUsuario;
  String get uidDoUsuario => _uidDoUsuario ?? '';
  bool hasUidDoUsuario() => _uidDoUsuario != null;

  // "dataDeInicio" field.
  DateTime? _dataDeInicio;
  DateTime? get dataDeInicio => _dataDeInicio;
  bool hasDataDeInicio() => _dataDeInicio != null;

  // "dataDeFinalizacao" field.
  DateTime? _dataDeFinalizacao;
  DateTime? get dataDeFinalizacao => _dataDeFinalizacao;
  bool hasDataDeFinalizacao() => _dataDeFinalizacao != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "visualizacao" field.
  int? _visualizacao;
  int get visualizacao => _visualizacao ?? 0;
  bool hasVisualizacao() => _visualizacao != null;

  // "clicks" field.
  int? _clicks;
  int get clicks => _clicks ?? 0;
  bool hasClicks() => _clicks != null;

  // "referenciaDoProduto" field.
  DocumentReference? _referenciaDoProduto;
  DocumentReference? get referenciaDoProduto => _referenciaDoProduto;
  bool hasReferenciaDoProduto() => _referenciaDoProduto != null;

  // "referenciaDoPrestador" field.
  DocumentReference? _referenciaDoPrestador;
  DocumentReference? get referenciaDoPrestador => _referenciaDoPrestador;
  bool hasReferenciaDoPrestador() => _referenciaDoPrestador != null;

  // "referenciaDoServico" field.
  DocumentReference? _referenciaDoServico;
  DocumentReference? get referenciaDoServico => _referenciaDoServico;
  bool hasReferenciaDoServico() => _referenciaDoServico != null;

  // "referenciaDoLojista" field.
  DocumentReference? _referenciaDoLojista;
  DocumentReference? get referenciaDoLojista => _referenciaDoLojista;
  bool hasReferenciaDoLojista() => _referenciaDoLojista != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _img = snapshotData['img'] as String?;
    _localizacaoDoComerciante =
        snapshotData['localizacaoDoComerciante'] as LatLng?;
    _comprasOuServicos = snapshotData['comprasOuServicos'] as bool?;
    _preco = castToType<double>(snapshotData['preco']);
    _uidDoUsuario = snapshotData['uidDoUsuario'] as String?;
    _dataDeInicio = snapshotData['dataDeInicio'] as DateTime?;
    _dataDeFinalizacao = snapshotData['dataDeFinalizacao'] as DateTime?;
    _descricao = snapshotData['descricao'] as String?;
    _visualizacao = castToType<int>(snapshotData['visualizacao']);
    _clicks = castToType<int>(snapshotData['clicks']);
    _referenciaDoProduto =
        snapshotData['referenciaDoProduto'] as DocumentReference?;
    _referenciaDoPrestador =
        snapshotData['referenciaDoPrestador'] as DocumentReference?;
    _referenciaDoServico =
        snapshotData['referenciaDoServico'] as DocumentReference?;
    _referenciaDoLojista =
        snapshotData['referenciaDoLojista'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('anuncio');

  static Stream<AnuncioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnuncioRecord.fromSnapshot(s));

  static Future<AnuncioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnuncioRecord.fromSnapshot(s));

  static AnuncioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnuncioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnuncioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnuncioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnuncioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnuncioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnuncioRecordData({
  String? titulo,
  String? img,
  LatLng? localizacaoDoComerciante,
  bool? comprasOuServicos,
  double? preco,
  String? uidDoUsuario,
  DateTime? dataDeInicio,
  DateTime? dataDeFinalizacao,
  String? descricao,
  int? visualizacao,
  int? clicks,
  DocumentReference? referenciaDoProduto,
  DocumentReference? referenciaDoPrestador,
  DocumentReference? referenciaDoServico,
  DocumentReference? referenciaDoLojista,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'img': img,
      'localizacaoDoComerciante': localizacaoDoComerciante,
      'comprasOuServicos': comprasOuServicos,
      'preco': preco,
      'uidDoUsuario': uidDoUsuario,
      'dataDeInicio': dataDeInicio,
      'dataDeFinalizacao': dataDeFinalizacao,
      'descricao': descricao,
      'visualizacao': visualizacao,
      'clicks': clicks,
      'referenciaDoProduto': referenciaDoProduto,
      'referenciaDoPrestador': referenciaDoPrestador,
      'referenciaDoServico': referenciaDoServico,
      'referenciaDoLojista': referenciaDoLojista,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnuncioRecordDocumentEquality implements Equality<AnuncioRecord> {
  const AnuncioRecordDocumentEquality();

  @override
  bool equals(AnuncioRecord? e1, AnuncioRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.img == e2?.img &&
        e1?.localizacaoDoComerciante == e2?.localizacaoDoComerciante &&
        e1?.comprasOuServicos == e2?.comprasOuServicos &&
        e1?.preco == e2?.preco &&
        e1?.uidDoUsuario == e2?.uidDoUsuario &&
        e1?.dataDeInicio == e2?.dataDeInicio &&
        e1?.dataDeFinalizacao == e2?.dataDeFinalizacao &&
        e1?.descricao == e2?.descricao &&
        e1?.visualizacao == e2?.visualizacao &&
        e1?.clicks == e2?.clicks &&
        e1?.referenciaDoProduto == e2?.referenciaDoProduto &&
        e1?.referenciaDoPrestador == e2?.referenciaDoPrestador &&
        e1?.referenciaDoServico == e2?.referenciaDoServico &&
        e1?.referenciaDoLojista == e2?.referenciaDoLojista;
  }

  @override
  int hash(AnuncioRecord? e) => const ListEquality().hash([
        e?.titulo,
        e?.img,
        e?.localizacaoDoComerciante,
        e?.comprasOuServicos,
        e?.preco,
        e?.uidDoUsuario,
        e?.dataDeInicio,
        e?.dataDeFinalizacao,
        e?.descricao,
        e?.visualizacao,
        e?.clicks,
        e?.referenciaDoProduto,
        e?.referenciaDoPrestador,
        e?.referenciaDoServico,
        e?.referenciaDoLojista
      ]);

  @override
  bool isValidKey(Object? o) => o is AnuncioRecord;
}

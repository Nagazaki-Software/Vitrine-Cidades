import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchsRecord extends FirestoreRecord {
  SearchsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeDoProduto" field.
  String? _nomeDoProduto;
  String get nomeDoProduto => _nomeDoProduto ?? '';
  bool hasNomeDoProduto() => _nomeDoProduto != null;

  // "nomeDoLojista" field.
  String? _nomeDoLojista;
  String get nomeDoLojista => _nomeDoLojista ?? '';
  bool hasNomeDoLojista() => _nomeDoLojista != null;

  // "nomeDoPrestador" field.
  String? _nomeDoPrestador;
  String get nomeDoPrestador => _nomeDoPrestador ?? '';
  bool hasNomeDoPrestador() => _nomeDoPrestador != null;

  // "fotoDoProduto" field.
  String? _fotoDoProduto;
  String get fotoDoProduto => _fotoDoProduto ?? '';
  bool hasFotoDoProduto() => _fotoDoProduto != null;

  // "fotoDoPrestadorOuLojista" field.
  String? _fotoDoPrestadorOuLojista;
  String get fotoDoPrestadorOuLojista => _fotoDoPrestadorOuLojista ?? '';
  bool hasFotoDoPrestadorOuLojista() => _fotoDoPrestadorOuLojista != null;

  // "telefoneDoLojista" field.
  String? _telefoneDoLojista;
  String get telefoneDoLojista => _telefoneDoLojista ?? '';
  bool hasTelefoneDoLojista() => _telefoneDoLojista != null;

  // "uidLojista" field.
  String? _uidLojista;
  String get uidLojista => _uidLojista ?? '';
  bool hasUidLojista() => _uidLojista != null;

  // "uidPrestador" field.
  String? _uidPrestador;
  String get uidPrestador => _uidPrestador ?? '';
  bool hasUidPrestador() => _uidPrestador != null;

  // "qualAssinatura" field.
  String? _qualAssinatura;
  String get qualAssinatura => _qualAssinatura ?? '';
  bool hasQualAssinatura() => _qualAssinatura != null;

  // "localizacaoDoComerciante" field.
  LatLng? _localizacaoDoComerciante;
  LatLng? get localizacaoDoComerciante => _localizacaoDoComerciante;
  bool hasLocalizacaoDoComerciante() => _localizacaoDoComerciante != null;

  void _initializeFields() {
    _nomeDoProduto = snapshotData['nomeDoProduto'] as String?;
    _nomeDoLojista = snapshotData['nomeDoLojista'] as String?;
    _nomeDoPrestador = snapshotData['nomeDoPrestador'] as String?;
    _fotoDoProduto = snapshotData['fotoDoProduto'] as String?;
    _fotoDoPrestadorOuLojista =
        snapshotData['fotoDoPrestadorOuLojista'] as String?;
    _telefoneDoLojista = snapshotData['telefoneDoLojista'] as String?;
    _uidLojista = snapshotData['uidLojista'] as String?;
    _uidPrestador = snapshotData['uidPrestador'] as String?;
    _qualAssinatura = snapshotData['qualAssinatura'] as String?;
    _localizacaoDoComerciante =
        snapshotData['localizacaoDoComerciante'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('searchs');

  static Stream<SearchsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SearchsRecord.fromSnapshot(s));

  static Future<SearchsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SearchsRecord.fromSnapshot(s));

  static SearchsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SearchsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SearchsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SearchsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SearchsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SearchsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSearchsRecordData({
  String? nomeDoProduto,
  String? nomeDoLojista,
  String? nomeDoPrestador,
  String? fotoDoProduto,
  String? fotoDoPrestadorOuLojista,
  String? telefoneDoLojista,
  String? uidLojista,
  String? uidPrestador,
  String? qualAssinatura,
  LatLng? localizacaoDoComerciante,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeDoProduto': nomeDoProduto,
      'nomeDoLojista': nomeDoLojista,
      'nomeDoPrestador': nomeDoPrestador,
      'fotoDoProduto': fotoDoProduto,
      'fotoDoPrestadorOuLojista': fotoDoPrestadorOuLojista,
      'telefoneDoLojista': telefoneDoLojista,
      'uidLojista': uidLojista,
      'uidPrestador': uidPrestador,
      'qualAssinatura': qualAssinatura,
      'localizacaoDoComerciante': localizacaoDoComerciante,
    }.withoutNulls,
  );

  return firestoreData;
}

class SearchsRecordDocumentEquality implements Equality<SearchsRecord> {
  const SearchsRecordDocumentEquality();

  @override
  bool equals(SearchsRecord? e1, SearchsRecord? e2) {
    return e1?.nomeDoProduto == e2?.nomeDoProduto &&
        e1?.nomeDoLojista == e2?.nomeDoLojista &&
        e1?.nomeDoPrestador == e2?.nomeDoPrestador &&
        e1?.fotoDoProduto == e2?.fotoDoProduto &&
        e1?.fotoDoPrestadorOuLojista == e2?.fotoDoPrestadorOuLojista &&
        e1?.telefoneDoLojista == e2?.telefoneDoLojista &&
        e1?.uidLojista == e2?.uidLojista &&
        e1?.uidPrestador == e2?.uidPrestador &&
        e1?.qualAssinatura == e2?.qualAssinatura &&
        e1?.localizacaoDoComerciante == e2?.localizacaoDoComerciante;
  }

  @override
  int hash(SearchsRecord? e) => const ListEquality().hash([
        e?.nomeDoProduto,
        e?.nomeDoLojista,
        e?.nomeDoPrestador,
        e?.fotoDoProduto,
        e?.fotoDoPrestadorOuLojista,
        e?.telefoneDoLojista,
        e?.uidLojista,
        e?.uidPrestador,
        e?.qualAssinatura,
        e?.localizacaoDoComerciante
      ]);

  @override
  bool isValidKey(Object? o) => o is SearchsRecord;
}

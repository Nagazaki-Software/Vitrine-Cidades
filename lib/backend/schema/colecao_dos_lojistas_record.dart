import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColecaoDosLojistasRecord extends FirestoreRecord {
  ColecaoDosLojistasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeDaColecao" field.
  String? _nomeDaColecao;
  String get nomeDaColecao => _nomeDaColecao ?? '';
  bool hasNomeDaColecao() => _nomeDaColecao != null;

  // "fotoDaColecao" field.
  String? _fotoDaColecao;
  String get fotoDaColecao => _fotoDaColecao ?? '';
  bool hasFotoDaColecao() => _fotoDaColecao != null;

  // "produtos" field.
  List<String>? _produtos;
  List<String> get produtos => _produtos ?? const [];
  bool hasProdutos() => _produtos != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nomeDaColecao = snapshotData['nomeDaColecao'] as String?;
    _fotoDaColecao = snapshotData['fotoDaColecao'] as String?;
    _produtos = getDataList(snapshotData['produtos']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('colecaoDosLojistas')
          : FirebaseFirestore.instance.collectionGroup('colecaoDosLojistas');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('colecaoDosLojistas').doc(id);

  static Stream<ColecaoDosLojistasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ColecaoDosLojistasRecord.fromSnapshot(s));

  static Future<ColecaoDosLojistasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ColecaoDosLojistasRecord.fromSnapshot(s));

  static ColecaoDosLojistasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ColecaoDosLojistasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ColecaoDosLojistasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ColecaoDosLojistasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ColecaoDosLojistasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ColecaoDosLojistasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createColecaoDosLojistasRecordData({
  String? nomeDaColecao,
  String? fotoDaColecao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeDaColecao': nomeDaColecao,
      'fotoDaColecao': fotoDaColecao,
    }.withoutNulls,
  );

  return firestoreData;
}

class ColecaoDosLojistasRecordDocumentEquality
    implements Equality<ColecaoDosLojistasRecord> {
  const ColecaoDosLojistasRecordDocumentEquality();

  @override
  bool equals(ColecaoDosLojistasRecord? e1, ColecaoDosLojistasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nomeDaColecao == e2?.nomeDaColecao &&
        e1?.fotoDaColecao == e2?.fotoDaColecao &&
        listEquality.equals(e1?.produtos, e2?.produtos);
  }

  @override
  int hash(ColecaoDosLojistasRecord? e) => const ListEquality()
      .hash([e?.nomeDaColecao, e?.fotoDaColecao, e?.produtos]);

  @override
  bool isValidKey(Object? o) => o is ColecaoDosLojistasRecord;
}

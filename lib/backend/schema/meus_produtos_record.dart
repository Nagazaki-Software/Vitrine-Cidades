import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeusProdutosRecord extends FirestoreRecord {
  MeusProdutosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeDaColecao" field.
  String? _nomeDaColecao;
  String get nomeDaColecao => _nomeDaColecao ?? '';
  bool hasNomeDaColecao() => _nomeDaColecao != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nomeDaColecao = snapshotData['nomeDaColecao'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('meusProdutos')
          : FirebaseFirestore.instance.collectionGroup('meusProdutos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('meusProdutos').doc(id);

  static Stream<MeusProdutosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeusProdutosRecord.fromSnapshot(s));

  static Future<MeusProdutosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeusProdutosRecord.fromSnapshot(s));

  static MeusProdutosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeusProdutosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeusProdutosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeusProdutosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeusProdutosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeusProdutosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeusProdutosRecordData({
  String? nomeDaColecao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeDaColecao': nomeDaColecao,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeusProdutosRecordDocumentEquality
    implements Equality<MeusProdutosRecord> {
  const MeusProdutosRecordDocumentEquality();

  @override
  bool equals(MeusProdutosRecord? e1, MeusProdutosRecord? e2) {
    return e1?.nomeDaColecao == e2?.nomeDaColecao;
  }

  @override
  int hash(MeusProdutosRecord? e) =>
      const ListEquality().hash([e?.nomeDaColecao]);

  @override
  bool isValidKey(Object? o) => o is MeusProdutosRecord;
}

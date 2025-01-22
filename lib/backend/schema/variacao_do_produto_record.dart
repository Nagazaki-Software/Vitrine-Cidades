import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VariacaoDoProdutoRecord extends FirestoreRecord {
  VariacaoDoProdutoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeDaVariacao" field.
  String? _nomeDaVariacao;
  String get nomeDaVariacao => _nomeDaVariacao ?? '';
  bool hasNomeDaVariacao() => _nomeDaVariacao != null;

  // "imagemDaVariacao" field.
  String? _imagemDaVariacao;
  String get imagemDaVariacao => _imagemDaVariacao ?? '';
  bool hasImagemDaVariacao() => _imagemDaVariacao != null;

  // "UIDdoProduto" field.
  String? _uIDdoProduto;
  String get uIDdoProduto => _uIDdoProduto ?? '';
  bool hasUIDdoProduto() => _uIDdoProduto != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nomeDaVariacao = snapshotData['nomeDaVariacao'] as String?;
    _imagemDaVariacao = snapshotData['imagemDaVariacao'] as String?;
    _uIDdoProduto = snapshotData['UIDdoProduto'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('variacaoDoProduto')
          : FirebaseFirestore.instance.collectionGroup('variacaoDoProduto');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('variacaoDoProduto').doc(id);

  static Stream<VariacaoDoProdutoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VariacaoDoProdutoRecord.fromSnapshot(s));

  static Future<VariacaoDoProdutoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VariacaoDoProdutoRecord.fromSnapshot(s));

  static VariacaoDoProdutoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VariacaoDoProdutoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VariacaoDoProdutoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VariacaoDoProdutoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VariacaoDoProdutoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VariacaoDoProdutoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVariacaoDoProdutoRecordData({
  String? nomeDaVariacao,
  String? imagemDaVariacao,
  String? uIDdoProduto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeDaVariacao': nomeDaVariacao,
      'imagemDaVariacao': imagemDaVariacao,
      'UIDdoProduto': uIDdoProduto,
    }.withoutNulls,
  );

  return firestoreData;
}

class VariacaoDoProdutoRecordDocumentEquality
    implements Equality<VariacaoDoProdutoRecord> {
  const VariacaoDoProdutoRecordDocumentEquality();

  @override
  bool equals(VariacaoDoProdutoRecord? e1, VariacaoDoProdutoRecord? e2) {
    return e1?.nomeDaVariacao == e2?.nomeDaVariacao &&
        e1?.imagemDaVariacao == e2?.imagemDaVariacao &&
        e1?.uIDdoProduto == e2?.uIDdoProduto;
  }

  @override
  int hash(VariacaoDoProdutoRecord? e) => const ListEquality()
      .hash([e?.nomeDaVariacao, e?.imagemDaVariacao, e?.uIDdoProduto]);

  @override
  bool isValidKey(Object? o) => o is VariacaoDoProdutoRecord;
}

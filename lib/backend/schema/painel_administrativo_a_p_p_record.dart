import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PainelAdministrativoAPPRecord extends FirestoreRecord {
  PainelAdministrativoAPPRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ClicksNaCategoria" field.
  int? _clicksNaCategoria;
  int get clicksNaCategoria => _clicksNaCategoria ?? 0;
  bool hasClicksNaCategoria() => _clicksNaCategoria != null;

  void _initializeFields() {
    _clicksNaCategoria = castToType<int>(snapshotData['ClicksNaCategoria']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PainelAdministrativoAPP');

  static Stream<PainelAdministrativoAPPRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PainelAdministrativoAPPRecord.fromSnapshot(s));

  static Future<PainelAdministrativoAPPRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PainelAdministrativoAPPRecord.fromSnapshot(s));

  static PainelAdministrativoAPPRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      PainelAdministrativoAPPRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PainelAdministrativoAPPRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PainelAdministrativoAPPRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PainelAdministrativoAPPRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PainelAdministrativoAPPRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPainelAdministrativoAPPRecordData({
  int? clicksNaCategoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ClicksNaCategoria': clicksNaCategoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class PainelAdministrativoAPPRecordDocumentEquality
    implements Equality<PainelAdministrativoAPPRecord> {
  const PainelAdministrativoAPPRecordDocumentEquality();

  @override
  bool equals(
      PainelAdministrativoAPPRecord? e1, PainelAdministrativoAPPRecord? e2) {
    return e1?.clicksNaCategoria == e2?.clicksNaCategoria;
  }

  @override
  int hash(PainelAdministrativoAPPRecord? e) =>
      const ListEquality().hash([e?.clicksNaCategoria]);

  @override
  bool isValidKey(Object? o) => o is PainelAdministrativoAPPRecord;
}

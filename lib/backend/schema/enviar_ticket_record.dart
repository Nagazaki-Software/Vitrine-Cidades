import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnviarTicketRecord extends FirestoreRecord {
  EnviarTicketRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "numeroTicket" field.
  String? _numeroTicket;
  String get numeroTicket => _numeroTicket ?? '';
  bool hasNumeroTicket() => _numeroTicket != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "prioridade" field.
  String? _prioridade;
  String get prioridade => _prioridade ?? '';
  bool hasPrioridade() => _prioridade != null;

  // "dataAbertura" field.
  DateTime? _dataAbertura;
  DateTime? get dataAbertura => _dataAbertura;
  bool hasDataAbertura() => _dataAbertura != null;

  // "assunto" field.
  String? _assunto;
  String get assunto => _assunto ?? '';
  bool hasAssunto() => _assunto != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _numeroTicket = snapshotData['numeroTicket'] as String?;
    _status = snapshotData['status'] as String?;
    _prioridade = snapshotData['prioridade'] as String?;
    _dataAbertura = snapshotData['dataAbertura'] as DateTime?;
    _assunto = snapshotData['assunto'] as String?;
    _descricao = snapshotData['descricao'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('EnviarTicket')
          : FirebaseFirestore.instance.collectionGroup('EnviarTicket');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('EnviarTicket').doc(id);

  static Stream<EnviarTicketRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EnviarTicketRecord.fromSnapshot(s));

  static Future<EnviarTicketRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EnviarTicketRecord.fromSnapshot(s));

  static EnviarTicketRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EnviarTicketRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EnviarTicketRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EnviarTicketRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EnviarTicketRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EnviarTicketRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEnviarTicketRecordData({
  String? numeroTicket,
  String? status,
  String? prioridade,
  DateTime? dataAbertura,
  String? assunto,
  String? descricao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'numeroTicket': numeroTicket,
      'status': status,
      'prioridade': prioridade,
      'dataAbertura': dataAbertura,
      'assunto': assunto,
      'descricao': descricao,
    }.withoutNulls,
  );

  return firestoreData;
}

class EnviarTicketRecordDocumentEquality
    implements Equality<EnviarTicketRecord> {
  const EnviarTicketRecordDocumentEquality();

  @override
  bool equals(EnviarTicketRecord? e1, EnviarTicketRecord? e2) {
    return e1?.numeroTicket == e2?.numeroTicket &&
        e1?.status == e2?.status &&
        e1?.prioridade == e2?.prioridade &&
        e1?.dataAbertura == e2?.dataAbertura &&
        e1?.assunto == e2?.assunto &&
        e1?.descricao == e2?.descricao;
  }

  @override
  int hash(EnviarTicketRecord? e) => const ListEquality().hash([
        e?.numeroTicket,
        e?.status,
        e?.prioridade,
        e?.dataAbertura,
        e?.assunto,
        e?.descricao
      ]);

  @override
  bool isValidKey(Object? o) => o is EnviarTicketRecord;
}

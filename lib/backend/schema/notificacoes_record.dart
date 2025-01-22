import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificacoesRecord extends FirestoreRecord {
  NotificacoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "dia" field.
  DateTime? _dia;
  DateTime? get dia => _dia;
  bool hasDia() => _dia != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "uidUsuario" field.
  String? _uidUsuario;
  String get uidUsuario => _uidUsuario ?? '';
  bool hasUidUsuario() => _uidUsuario != null;

  // "perfilDoAnuncio" field.
  DocumentReference? _perfilDoAnuncio;
  DocumentReference? get perfilDoAnuncio => _perfilDoAnuncio;
  bool hasPerfilDoAnuncio() => _perfilDoAnuncio != null;

  // "produtoDoAnuncio" field.
  DocumentReference? _produtoDoAnuncio;
  DocumentReference? get produtoDoAnuncio => _produtoDoAnuncio;
  bool hasProdutoDoAnuncio() => _produtoDoAnuncio != null;

  // "perfilOuProduto" field.
  String? _perfilOuProduto;
  String get perfilOuProduto => _perfilOuProduto ?? '';
  bool hasPerfilOuProduto() => _perfilOuProduto != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _dia = snapshotData['dia'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _uidUsuario = snapshotData['uidUsuario'] as String?;
    _perfilDoAnuncio = snapshotData['perfilDoAnuncio'] as DocumentReference?;
    _produtoDoAnuncio = snapshotData['produtoDoAnuncio'] as DocumentReference?;
    _perfilOuProduto = snapshotData['perfilOuProduto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificacoes');

  static Stream<NotificacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacoesRecord.fromSnapshot(s));

  static Future<NotificacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacoesRecord.fromSnapshot(s));

  static NotificacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacoesRecordData({
  String? name,
  DateTime? dia,
  String? description,
  String? uidUsuario,
  DocumentReference? perfilDoAnuncio,
  DocumentReference? produtoDoAnuncio,
  String? perfilOuProduto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'dia': dia,
      'description': description,
      'uidUsuario': uidUsuario,
      'perfilDoAnuncio': perfilDoAnuncio,
      'produtoDoAnuncio': produtoDoAnuncio,
      'perfilOuProduto': perfilOuProduto,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacoesRecordDocumentEquality
    implements Equality<NotificacoesRecord> {
  const NotificacoesRecordDocumentEquality();

  @override
  bool equals(NotificacoesRecord? e1, NotificacoesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.dia == e2?.dia &&
        e1?.description == e2?.description &&
        e1?.uidUsuario == e2?.uidUsuario &&
        e1?.perfilDoAnuncio == e2?.perfilDoAnuncio &&
        e1?.produtoDoAnuncio == e2?.produtoDoAnuncio &&
        e1?.perfilOuProduto == e2?.perfilOuProduto;
  }

  @override
  int hash(NotificacoesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.dia,
        e?.description,
        e?.uidUsuario,
        e?.perfilDoAnuncio,
        e?.produtoDoAnuncio,
        e?.perfilOuProduto
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificacoesRecord;
}

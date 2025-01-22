import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PagamentoRecord extends FirestoreRecord {
  PagamentoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Plano" field.
  String? _plano;
  String get plano => _plano ?? '';
  bool hasPlano() => _plano != null;

  // "metodo" field.
  String? _metodo;
  String get metodo => _metodo ?? '';
  bool hasMetodo() => _metodo != null;

  // "NomeDaPessoa" field.
  String? _nomeDaPessoa;
  String get nomeDaPessoa => _nomeDaPessoa ?? '';
  bool hasNomeDaPessoa() => _nomeDaPessoa != null;

  // "numeroDoCartao" field.
  String? _numeroDoCartao;
  String get numeroDoCartao => _numeroDoCartao ?? '';
  bool hasNumeroDoCartao() => _numeroDoCartao != null;

  // "CPFCNPJ" field.
  String? _cpfcnpj;
  String get cpfcnpj => _cpfcnpj ?? '';
  bool hasCpfcnpj() => _cpfcnpj != null;

  // "statusDoPagamento" field.
  String? _statusDoPagamento;
  String get statusDoPagamento => _statusDoPagamento ?? '';
  bool hasStatusDoPagamento() => _statusDoPagamento != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "dia" field.
  DateTime? _dia;
  DateTime? get dia => _dia;
  bool hasDia() => _dia != null;

  // "invoiceNumber" field.
  String? _invoiceNumber;
  String get invoiceNumber => _invoiceNumber ?? '';
  bool hasInvoiceNumber() => _invoiceNumber != null;

  // "invoiceUrl" field.
  String? _invoiceUrl;
  String get invoiceUrl => _invoiceUrl ?? '';
  bool hasInvoiceUrl() => _invoiceUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _plano = snapshotData['Plano'] as String?;
    _metodo = snapshotData['metodo'] as String?;
    _nomeDaPessoa = snapshotData['NomeDaPessoa'] as String?;
    _numeroDoCartao = snapshotData['numeroDoCartao'] as String?;
    _cpfcnpj = snapshotData['CPFCNPJ'] as String?;
    _statusDoPagamento = snapshotData['statusDoPagamento'] as String?;
    _valor = castToType<double>(snapshotData['valor']);
    _dia = snapshotData['dia'] as DateTime?;
    _invoiceNumber = snapshotData['invoiceNumber'] as String?;
    _invoiceUrl = snapshotData['invoiceUrl'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pagamento')
          : FirebaseFirestore.instance.collectionGroup('pagamento');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('pagamento').doc(id);

  static Stream<PagamentoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PagamentoRecord.fromSnapshot(s));

  static Future<PagamentoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PagamentoRecord.fromSnapshot(s));

  static PagamentoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PagamentoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PagamentoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PagamentoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PagamentoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PagamentoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPagamentoRecordData({
  String? plano,
  String? metodo,
  String? nomeDaPessoa,
  String? numeroDoCartao,
  String? cpfcnpj,
  String? statusDoPagamento,
  double? valor,
  DateTime? dia,
  String? invoiceNumber,
  String? invoiceUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Plano': plano,
      'metodo': metodo,
      'NomeDaPessoa': nomeDaPessoa,
      'numeroDoCartao': numeroDoCartao,
      'CPFCNPJ': cpfcnpj,
      'statusDoPagamento': statusDoPagamento,
      'valor': valor,
      'dia': dia,
      'invoiceNumber': invoiceNumber,
      'invoiceUrl': invoiceUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class PagamentoRecordDocumentEquality implements Equality<PagamentoRecord> {
  const PagamentoRecordDocumentEquality();

  @override
  bool equals(PagamentoRecord? e1, PagamentoRecord? e2) {
    return e1?.plano == e2?.plano &&
        e1?.metodo == e2?.metodo &&
        e1?.nomeDaPessoa == e2?.nomeDaPessoa &&
        e1?.numeroDoCartao == e2?.numeroDoCartao &&
        e1?.cpfcnpj == e2?.cpfcnpj &&
        e1?.statusDoPagamento == e2?.statusDoPagamento &&
        e1?.valor == e2?.valor &&
        e1?.dia == e2?.dia &&
        e1?.invoiceNumber == e2?.invoiceNumber &&
        e1?.invoiceUrl == e2?.invoiceUrl;
  }

  @override
  int hash(PagamentoRecord? e) => const ListEquality().hash([
        e?.plano,
        e?.metodo,
        e?.nomeDaPessoa,
        e?.numeroDoCartao,
        e?.cpfcnpj,
        e?.statusDoPagamento,
        e?.valor,
        e?.dia,
        e?.invoiceNumber,
        e?.invoiceUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is PagamentoRecord;
}

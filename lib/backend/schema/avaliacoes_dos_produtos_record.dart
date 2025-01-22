import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvaliacoesDosProdutosRecord extends FirestoreRecord {
  AvaliacoesDosProdutosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "avaliacao" field.
  String? _avaliacao;
  String get avaliacao => _avaliacao ?? '';
  bool hasAvaliacao() => _avaliacao != null;

  // "nomeDoUsuario" field.
  String? _nomeDoUsuario;
  String get nomeDoUsuario => _nomeDoUsuario ?? '';
  bool hasNomeDoUsuario() => _nomeDoUsuario != null;

  // "tituloDaAvaliacao" field.
  String? _tituloDaAvaliacao;
  String get tituloDaAvaliacao => _tituloDaAvaliacao ?? '';
  bool hasTituloDaAvaliacao() => _tituloDaAvaliacao != null;

  // "IDdaReferenciaDoProduto" field.
  String? _iDdaReferenciaDoProduto;
  String get iDdaReferenciaDoProduto => _iDdaReferenciaDoProduto ?? '';
  bool hasIDdaReferenciaDoProduto() => _iDdaReferenciaDoProduto != null;

  // "imagemDoUsuario" field.
  String? _imagemDoUsuario;
  String get imagemDoUsuario => _imagemDoUsuario ?? '';
  bool hasImagemDoUsuario() => _imagemDoUsuario != null;

  // "diaDaAvaliacao" field.
  DateTime? _diaDaAvaliacao;
  DateTime? get diaDaAvaliacao => _diaDaAvaliacao;
  bool hasDiaDaAvaliacao() => _diaDaAvaliacao != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _avaliacao = snapshotData['avaliacao'] as String?;
    _nomeDoUsuario = snapshotData['nomeDoUsuario'] as String?;
    _tituloDaAvaliacao = snapshotData['tituloDaAvaliacao'] as String?;
    _iDdaReferenciaDoProduto =
        snapshotData['IDdaReferenciaDoProduto'] as String?;
    _imagemDoUsuario = snapshotData['imagemDoUsuario'] as String?;
    _diaDaAvaliacao = snapshotData['diaDaAvaliacao'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('avaliacoesDosProdutos')
          : FirebaseFirestore.instance.collectionGroup('avaliacoesDosProdutos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('avaliacoesDosProdutos').doc(id);

  static Stream<AvaliacoesDosProdutosRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => AvaliacoesDosProdutosRecord.fromSnapshot(s));

  static Future<AvaliacoesDosProdutosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AvaliacoesDosProdutosRecord.fromSnapshot(s));

  static AvaliacoesDosProdutosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvaliacoesDosProdutosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvaliacoesDosProdutosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvaliacoesDosProdutosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvaliacoesDosProdutosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvaliacoesDosProdutosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvaliacoesDosProdutosRecordData({
  String? avaliacao,
  String? nomeDoUsuario,
  String? tituloDaAvaliacao,
  String? iDdaReferenciaDoProduto,
  String? imagemDoUsuario,
  DateTime? diaDaAvaliacao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'avaliacao': avaliacao,
      'nomeDoUsuario': nomeDoUsuario,
      'tituloDaAvaliacao': tituloDaAvaliacao,
      'IDdaReferenciaDoProduto': iDdaReferenciaDoProduto,
      'imagemDoUsuario': imagemDoUsuario,
      'diaDaAvaliacao': diaDaAvaliacao,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvaliacoesDosProdutosRecordDocumentEquality
    implements Equality<AvaliacoesDosProdutosRecord> {
  const AvaliacoesDosProdutosRecordDocumentEquality();

  @override
  bool equals(
      AvaliacoesDosProdutosRecord? e1, AvaliacoesDosProdutosRecord? e2) {
    return e1?.avaliacao == e2?.avaliacao &&
        e1?.nomeDoUsuario == e2?.nomeDoUsuario &&
        e1?.tituloDaAvaliacao == e2?.tituloDaAvaliacao &&
        e1?.iDdaReferenciaDoProduto == e2?.iDdaReferenciaDoProduto &&
        e1?.imagemDoUsuario == e2?.imagemDoUsuario &&
        e1?.diaDaAvaliacao == e2?.diaDaAvaliacao;
  }

  @override
  int hash(AvaliacoesDosProdutosRecord? e) => const ListEquality().hash([
        e?.avaliacao,
        e?.nomeDoUsuario,
        e?.tituloDaAvaliacao,
        e?.iDdaReferenciaDoProduto,
        e?.imagemDoUsuario,
        e?.diaDaAvaliacao
      ]);

  @override
  bool isValidKey(Object? o) => o is AvaliacoesDosProdutosRecord;
}

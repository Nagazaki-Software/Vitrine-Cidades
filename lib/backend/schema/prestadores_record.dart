import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrestadoresRecord extends FirestoreRecord {
  PrestadoresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeEmpresarialDoComerciante" field.
  String? _nomeEmpresarialDoComerciante;
  String get nomeEmpresarialDoComerciante =>
      _nomeEmpresarialDoComerciante ?? '';
  bool hasNomeEmpresarialDoComerciante() =>
      _nomeEmpresarialDoComerciante != null;

  // "localizacao" field.
  LatLng? _localizacao;
  LatLng? get localizacao => _localizacao;
  bool hasLocalizacao() => _localizacao != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  bool hasEndereco() => _endereco != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "fotoDePerfil" field.
  String? _fotoDePerfil;
  String get fotoDePerfil => _fotoDePerfil ?? '';
  bool hasFotoDePerfil() => _fotoDePerfil != null;

  // "fotoDeCapa" field.
  String? _fotoDeCapa;
  String get fotoDeCapa => _fotoDeCapa ?? '';
  bool hasFotoDeCapa() => _fotoDeCapa != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nomeEmpresarialDoComerciante =
        snapshotData['nomeEmpresarialDoComerciante'] as String?;
    _localizacao = snapshotData['localizacao'] as LatLng?;
    _endereco = snapshotData['endereco'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _fotoDePerfil = snapshotData['fotoDePerfil'] as String?;
    _fotoDeCapa = snapshotData['fotoDeCapa'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Prestadores')
          : FirebaseFirestore.instance.collectionGroup('Prestadores');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Prestadores').doc(id);

  static Stream<PrestadoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrestadoresRecord.fromSnapshot(s));

  static Future<PrestadoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PrestadoresRecord.fromSnapshot(s));

  static PrestadoresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrestadoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrestadoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrestadoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrestadoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrestadoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrestadoresRecordData({
  String? nomeEmpresarialDoComerciante,
  LatLng? localizacao,
  String? endereco,
  String? descricao,
  String? fotoDePerfil,
  String? fotoDeCapa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeEmpresarialDoComerciante': nomeEmpresarialDoComerciante,
      'localizacao': localizacao,
      'endereco': endereco,
      'descricao': descricao,
      'fotoDePerfil': fotoDePerfil,
      'fotoDeCapa': fotoDeCapa,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrestadoresRecordDocumentEquality implements Equality<PrestadoresRecord> {
  const PrestadoresRecordDocumentEquality();

  @override
  bool equals(PrestadoresRecord? e1, PrestadoresRecord? e2) {
    return e1?.nomeEmpresarialDoComerciante ==
            e2?.nomeEmpresarialDoComerciante &&
        e1?.localizacao == e2?.localizacao &&
        e1?.endereco == e2?.endereco &&
        e1?.descricao == e2?.descricao &&
        e1?.fotoDePerfil == e2?.fotoDePerfil &&
        e1?.fotoDeCapa == e2?.fotoDeCapa;
  }

  @override
  int hash(PrestadoresRecord? e) => const ListEquality().hash([
        e?.nomeEmpresarialDoComerciante,
        e?.localizacao,
        e?.endereco,
        e?.descricao,
        e?.fotoDePerfil,
        e?.fotoDeCapa
      ]);

  @override
  bool isValidKey(Object? o) => o is PrestadoresRecord;
}

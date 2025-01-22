import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeuServicosRecord extends FirestoreRecord {
  MeuServicosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "specifications" field.
  String? _specifications;
  String get specifications => _specifications ?? '';
  bool hasSpecifications() => _specifications != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "on_sale" field.
  bool? _onSale;
  bool get onSale => _onSale ?? false;
  bool hasOnSale() => _onSale != null;

  // "sale_price" field.
  double? _salePrice;
  double get salePrice => _salePrice ?? 0.0;
  bool hasSalePrice() => _salePrice != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "fotoDoProduto" field.
  String? _fotoDoProduto;
  String get fotoDoProduto => _fotoDoProduto ?? '';
  bool hasFotoDoProduto() => _fotoDoProduto != null;

  // "fotosDosProdutos" field.
  List<String>? _fotosDosProdutos;
  List<String> get fotosDosProdutos => _fotosDosProdutos ?? const [];
  bool hasFotosDosProdutos() => _fotosDosProdutos != null;

  // "categoriaDaManutencao" field.
  String? _categoriaDaManutencao;
  String get categoriaDaManutencao => _categoriaDaManutencao ?? '';
  bool hasCategoriaDaManutencao() => _categoriaDaManutencao != null;

  // "diasDoServico" field.
  List<String>? _diasDoServico;
  List<String> get diasDoServico => _diasDoServico ?? const [];
  bool hasDiasDoServico() => _diasDoServico != null;

  // "minutos" field.
  String? _minutos;
  String get minutos => _minutos ?? '';
  bool hasMinutos() => _minutos != null;

  // "requisitos" field.
  String? _requisitos;
  String get requisitos => _requisitos ?? '';
  bool hasRequisitos() => _requisitos != null;

  // "obsAdicional" field.
  String? _obsAdicional;
  String get obsAdicional => _obsAdicional ?? '';
  bool hasObsAdicional() => _obsAdicional != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _specifications = snapshotData['specifications'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _onSale = snapshotData['on_sale'] as bool?;
    _salePrice = castToType<double>(snapshotData['sale_price']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _fotoDoProduto = snapshotData['fotoDoProduto'] as String?;
    _fotosDosProdutos = getDataList(snapshotData['fotosDosProdutos']);
    _categoriaDaManutencao = snapshotData['categoriaDaManutencao'] as String?;
    _diasDoServico = getDataList(snapshotData['diasDoServico']);
    _minutos = snapshotData['minutos'] as String?;
    _requisitos = snapshotData['requisitos'] as String?;
    _obsAdicional = snapshotData['obsAdicional'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('meuServicos')
          : FirebaseFirestore.instance.collectionGroup('meuServicos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('meuServicos').doc(id);

  static Stream<MeuServicosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeuServicosRecord.fromSnapshot(s));

  static Future<MeuServicosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeuServicosRecord.fromSnapshot(s));

  static MeuServicosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeuServicosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeuServicosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeuServicosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeuServicosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeuServicosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeuServicosRecordData({
  String? name,
  String? description,
  String? specifications,
  double? price,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? onSale,
  double? salePrice,
  int? quantity,
  String? fotoDoProduto,
  String? categoriaDaManutencao,
  String? minutos,
  String? requisitos,
  String? obsAdicional,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'specifications': specifications,
      'price': price,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'on_sale': onSale,
      'sale_price': salePrice,
      'quantity': quantity,
      'fotoDoProduto': fotoDoProduto,
      'categoriaDaManutencao': categoriaDaManutencao,
      'minutos': minutos,
      'requisitos': requisitos,
      'obsAdicional': obsAdicional,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeuServicosRecordDocumentEquality implements Equality<MeuServicosRecord> {
  const MeuServicosRecordDocumentEquality();

  @override
  bool equals(MeuServicosRecord? e1, MeuServicosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.specifications == e2?.specifications &&
        e1?.price == e2?.price &&
        e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.onSale == e2?.onSale &&
        e1?.salePrice == e2?.salePrice &&
        e1?.quantity == e2?.quantity &&
        e1?.fotoDoProduto == e2?.fotoDoProduto &&
        listEquality.equals(e1?.fotosDosProdutos, e2?.fotosDosProdutos) &&
        e1?.categoriaDaManutencao == e2?.categoriaDaManutencao &&
        listEquality.equals(e1?.diasDoServico, e2?.diasDoServico) &&
        e1?.minutos == e2?.minutos &&
        e1?.requisitos == e2?.requisitos &&
        e1?.obsAdicional == e2?.obsAdicional;
  }

  @override
  int hash(MeuServicosRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.specifications,
        e?.price,
        e?.createdAt,
        e?.modifiedAt,
        e?.onSale,
        e?.salePrice,
        e?.quantity,
        e?.fotoDoProduto,
        e?.fotosDosProdutos,
        e?.categoriaDaManutencao,
        e?.diasDoServico,
        e?.minutos,
        e?.requisitos,
        e?.obsAdicional
      ]);

  @override
  bool isValidKey(Object? o) => o is MeuServicosRecord;
}

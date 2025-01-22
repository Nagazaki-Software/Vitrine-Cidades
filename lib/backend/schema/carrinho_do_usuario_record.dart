import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarrinhoDoUsuarioRecord extends FirestoreRecord {
  CarrinhoDoUsuarioRecord._(
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

  // "items" field.
  List<String>? _items;
  List<String> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "nomeDoProduto" field.
  String? _nomeDoProduto;
  String get nomeDoProduto => _nomeDoProduto ?? '';
  bool hasNomeDoProduto() => _nomeDoProduto != null;

  // "nomeDosProdutos" field.
  List<String>? _nomeDosProdutos;
  List<String> get nomeDosProdutos => _nomeDosProdutos ?? const [];
  bool hasNomeDosProdutos() => _nomeDosProdutos != null;

  // "imgDosProdutos" field.
  List<String>? _imgDosProdutos;
  List<String> get imgDosProdutos => _imgDosProdutos ?? const [];
  bool hasImgDosProdutos() => _imgDosProdutos != null;

  // "precoDosItens" field.
  List<String>? _precoDosItens;
  List<String> get precoDosItens => _precoDosItens ?? const [];
  bool hasPrecoDosItens() => _precoDosItens != null;

  // "uidDoComerciante" field.
  String? _uidDoComerciante;
  String get uidDoComerciante => _uidDoComerciante ?? '';
  bool hasUidDoComerciante() => _uidDoComerciante != null;

  // "imgDoProduto" field.
  String? _imgDoProduto;
  String get imgDoProduto => _imgDoProduto ?? '';
  bool hasImgDoProduto() => _imgDoProduto != null;

  // "uidDoProduto" field.
  String? _uidDoProduto;
  String get uidDoProduto => _uidDoProduto ?? '';
  bool hasUidDoProduto() => _uidDoProduto != null;

  // "uidDoUsuario" field.
  String? _uidDoUsuario;
  String get uidDoUsuario => _uidDoUsuario ?? '';
  bool hasUidDoUsuario() => _uidDoUsuario != null;

  // "referenciaItensDoCarrinho" field.
  DocumentReference? _referenciaItensDoCarrinho;
  DocumentReference? get referenciaItensDoCarrinho =>
      _referenciaItensDoCarrinho;
  bool hasReferenciaItensDoCarrinho() => _referenciaItensDoCarrinho != null;

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
    _items = getDataList(snapshotData['items']);
    _nomeDoProduto = snapshotData['nomeDoProduto'] as String?;
    _nomeDosProdutos = getDataList(snapshotData['nomeDosProdutos']);
    _imgDosProdutos = getDataList(snapshotData['imgDosProdutos']);
    _precoDosItens = getDataList(snapshotData['precoDosItens']);
    _uidDoComerciante = snapshotData['uidDoComerciante'] as String?;
    _imgDoProduto = snapshotData['imgDoProduto'] as String?;
    _uidDoProduto = snapshotData['uidDoProduto'] as String?;
    _uidDoUsuario = snapshotData['uidDoUsuario'] as String?;
    _referenciaItensDoCarrinho =
        snapshotData['referenciaItensDoCarrinho'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carrinhoDoUsuario');

  static Stream<CarrinhoDoUsuarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarrinhoDoUsuarioRecord.fromSnapshot(s));

  static Future<CarrinhoDoUsuarioRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CarrinhoDoUsuarioRecord.fromSnapshot(s));

  static CarrinhoDoUsuarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarrinhoDoUsuarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarrinhoDoUsuarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarrinhoDoUsuarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarrinhoDoUsuarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarrinhoDoUsuarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarrinhoDoUsuarioRecordData({
  String? name,
  String? description,
  String? specifications,
  double? price,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? onSale,
  double? salePrice,
  int? quantity,
  String? nomeDoProduto,
  String? uidDoComerciante,
  String? imgDoProduto,
  String? uidDoProduto,
  String? uidDoUsuario,
  DocumentReference? referenciaItensDoCarrinho,
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
      'nomeDoProduto': nomeDoProduto,
      'uidDoComerciante': uidDoComerciante,
      'imgDoProduto': imgDoProduto,
      'uidDoProduto': uidDoProduto,
      'uidDoUsuario': uidDoUsuario,
      'referenciaItensDoCarrinho': referenciaItensDoCarrinho,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarrinhoDoUsuarioRecordDocumentEquality
    implements Equality<CarrinhoDoUsuarioRecord> {
  const CarrinhoDoUsuarioRecordDocumentEquality();

  @override
  bool equals(CarrinhoDoUsuarioRecord? e1, CarrinhoDoUsuarioRecord? e2) {
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
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.nomeDoProduto == e2?.nomeDoProduto &&
        listEquality.equals(e1?.nomeDosProdutos, e2?.nomeDosProdutos) &&
        listEquality.equals(e1?.imgDosProdutos, e2?.imgDosProdutos) &&
        listEquality.equals(e1?.precoDosItens, e2?.precoDosItens) &&
        e1?.uidDoComerciante == e2?.uidDoComerciante &&
        e1?.imgDoProduto == e2?.imgDoProduto &&
        e1?.uidDoProduto == e2?.uidDoProduto &&
        e1?.uidDoUsuario == e2?.uidDoUsuario &&
        e1?.referenciaItensDoCarrinho == e2?.referenciaItensDoCarrinho;
  }

  @override
  int hash(CarrinhoDoUsuarioRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.specifications,
        e?.price,
        e?.createdAt,
        e?.modifiedAt,
        e?.onSale,
        e?.salePrice,
        e?.quantity,
        e?.items,
        e?.nomeDoProduto,
        e?.nomeDosProdutos,
        e?.imgDosProdutos,
        e?.precoDosItens,
        e?.uidDoComerciante,
        e?.imgDoProduto,
        e?.uidDoProduto,
        e?.uidDoUsuario,
        e?.referenciaItensDoCarrinho
      ]);

  @override
  bool isValidKey(Object? o) => o is CarrinhoDoUsuarioRecord;
}

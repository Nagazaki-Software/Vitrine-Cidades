import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SeusprodutosRecord extends FirestoreRecord {
  SeusprodutosRecord._(
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

  // "reviews" field.
  List<double>? _reviews;
  List<double> get reviews => _reviews ?? const [];
  bool hasReviews() => _reviews != null;

  // "localizacaoDoComerciante" field.
  LatLng? _localizacaoDoComerciante;
  LatLng? get localizacaoDoComerciante => _localizacaoDoComerciante;
  bool hasLocalizacaoDoComerciante() => _localizacaoDoComerciante != null;

  // "nomeDoComerciante" field.
  String? _nomeDoComerciante;
  String get nomeDoComerciante => _nomeDoComerciante ?? '';
  bool hasNomeDoComerciante() => _nomeDoComerciante != null;

  // "IDdoComerciante" field.
  String? _iDdoComerciante;
  String get iDdoComerciante => _iDdoComerciante ?? '';
  bool hasIDdoComerciante() => _iDdoComerciante != null;

  // "fotoDoComerciante" field.
  String? _fotoDoComerciante;
  String get fotoDoComerciante => _fotoDoComerciante ?? '';
  bool hasFotoDoComerciante() => _fotoDoComerciante != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "fotosDoProduto" field.
  List<String>? _fotosDoProduto;
  List<String> get fotosDoProduto => _fotosDoProduto ?? const [];
  bool hasFotosDoProduto() => _fotosDoProduto != null;

  // "imagensDaVariacao" field.
  List<String>? _imagensDaVariacao;
  List<String> get imagensDaVariacao => _imagensDaVariacao ?? const [];
  bool hasImagensDaVariacao() => _imagensDaVariacao != null;

  // "nomeDasVariacoes" field.
  List<String>? _nomeDasVariacoes;
  List<String> get nomeDasVariacoes => _nomeDasVariacoes ?? const [];
  bool hasNomeDasVariacoes() => _nomeDasVariacoes != null;

  // "vendidos" field.
  int? _vendidos;
  int get vendidos => _vendidos ?? 0;
  bool hasVendidos() => _vendidos != null;

  // "entregaNoLocal" field.
  bool? _entregaNoLocal;
  bool get entregaNoLocal => _entregaNoLocal ?? false;
  bool hasEntregaNoLocal() => _entregaNoLocal != null;

  // "clicks" field.
  int? _clicks;
  int get clicks => _clicks ?? 0;
  bool hasClicks() => _clicks != null;

  // "tipoDeAssinatura" field.
  String? _tipoDeAssinatura;
  String get tipoDeAssinatura => _tipoDeAssinatura ?? '';
  bool hasTipoDeAssinatura() => _tipoDeAssinatura != null;

  // "estoque" field.
  int? _estoque;
  int get estoque => _estoque ?? 0;
  bool hasEstoque() => _estoque != null;

  // "inativo" field.
  bool? _inativo;
  bool get inativo => _inativo ?? false;
  bool hasInativo() => _inativo != null;

  // "validadeDaPromocao" field.
  DateTime? _validadeDaPromocao;
  DateTime? get validadeDaPromocao => _validadeDaPromocao;
  bool hasValidadeDaPromocao() => _validadeDaPromocao != null;

  // "lojistaReference" field.
  DocumentReference? _lojistaReference;
  DocumentReference? get lojistaReference => _lojistaReference;
  bool hasLojistaReference() => _lojistaReference != null;

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
    _reviews = getDataList(snapshotData['reviews']);
    _localizacaoDoComerciante =
        snapshotData['localizacaoDoComerciante'] as LatLng?;
    _nomeDoComerciante = snapshotData['nomeDoComerciante'] as String?;
    _iDdoComerciante = snapshotData['IDdoComerciante'] as String?;
    _fotoDoComerciante = snapshotData['fotoDoComerciante'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _fotosDoProduto = getDataList(snapshotData['fotosDoProduto']);
    _imagensDaVariacao = getDataList(snapshotData['imagensDaVariacao']);
    _nomeDasVariacoes = getDataList(snapshotData['nomeDasVariacoes']);
    _vendidos = castToType<int>(snapshotData['vendidos']);
    _entregaNoLocal = snapshotData['entregaNoLocal'] as bool?;
    _clicks = castToType<int>(snapshotData['clicks']);
    _tipoDeAssinatura = snapshotData['tipoDeAssinatura'] as String?;
    _estoque = castToType<int>(snapshotData['estoque']);
    _inativo = snapshotData['inativo'] as bool?;
    _validadeDaPromocao = snapshotData['validadeDaPromocao'] as DateTime?;
    _lojistaReference = snapshotData['lojistaReference'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Seusprodutos')
          : FirebaseFirestore.instance.collectionGroup('Seusprodutos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Seusprodutos').doc(id);

  static Stream<SeusprodutosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SeusprodutosRecord.fromSnapshot(s));

  static Future<SeusprodutosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SeusprodutosRecord.fromSnapshot(s));

  static SeusprodutosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SeusprodutosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SeusprodutosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SeusprodutosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SeusprodutosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SeusprodutosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSeusprodutosRecordData({
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
  LatLng? localizacaoDoComerciante,
  String? nomeDoComerciante,
  String? iDdoComerciante,
  String? fotoDoComerciante,
  String? categoria,
  int? vendidos,
  bool? entregaNoLocal,
  int? clicks,
  String? tipoDeAssinatura,
  int? estoque,
  bool? inativo,
  DateTime? validadeDaPromocao,
  DocumentReference? lojistaReference,
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
      'localizacaoDoComerciante': localizacaoDoComerciante,
      'nomeDoComerciante': nomeDoComerciante,
      'IDdoComerciante': iDdoComerciante,
      'fotoDoComerciante': fotoDoComerciante,
      'categoria': categoria,
      'vendidos': vendidos,
      'entregaNoLocal': entregaNoLocal,
      'clicks': clicks,
      'tipoDeAssinatura': tipoDeAssinatura,
      'estoque': estoque,
      'inativo': inativo,
      'validadeDaPromocao': validadeDaPromocao,
      'lojistaReference': lojistaReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class SeusprodutosRecordDocumentEquality
    implements Equality<SeusprodutosRecord> {
  const SeusprodutosRecordDocumentEquality();

  @override
  bool equals(SeusprodutosRecord? e1, SeusprodutosRecord? e2) {
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
        listEquality.equals(e1?.reviews, e2?.reviews) &&
        e1?.localizacaoDoComerciante == e2?.localizacaoDoComerciante &&
        e1?.nomeDoComerciante == e2?.nomeDoComerciante &&
        e1?.iDdoComerciante == e2?.iDdoComerciante &&
        e1?.fotoDoComerciante == e2?.fotoDoComerciante &&
        e1?.categoria == e2?.categoria &&
        listEquality.equals(e1?.fotosDoProduto, e2?.fotosDoProduto) &&
        listEquality.equals(e1?.imagensDaVariacao, e2?.imagensDaVariacao) &&
        listEquality.equals(e1?.nomeDasVariacoes, e2?.nomeDasVariacoes) &&
        e1?.vendidos == e2?.vendidos &&
        e1?.entregaNoLocal == e2?.entregaNoLocal &&
        e1?.clicks == e2?.clicks &&
        e1?.tipoDeAssinatura == e2?.tipoDeAssinatura &&
        e1?.estoque == e2?.estoque &&
        e1?.inativo == e2?.inativo &&
        e1?.validadeDaPromocao == e2?.validadeDaPromocao &&
        e1?.lojistaReference == e2?.lojistaReference;
  }

  @override
  int hash(SeusprodutosRecord? e) => const ListEquality().hash([
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
        e?.reviews,
        e?.localizacaoDoComerciante,
        e?.nomeDoComerciante,
        e?.iDdoComerciante,
        e?.fotoDoComerciante,
        e?.categoria,
        e?.fotosDoProduto,
        e?.imagensDaVariacao,
        e?.nomeDasVariacoes,
        e?.vendidos,
        e?.entregaNoLocal,
        e?.clicks,
        e?.tipoDeAssinatura,
        e?.estoque,
        e?.inativo,
        e?.validadeDaPromocao,
        e?.lojistaReference
      ]);

  @override
  bool isValidKey(Object? o) => o is SeusprodutosRecord;
}

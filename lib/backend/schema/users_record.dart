import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "fotoDoComerciante" field.
  String? _fotoDoComerciante;
  String get fotoDoComerciante => _fotoDoComerciante ?? '';
  bool hasFotoDoComerciante() => _fotoDoComerciante != null;

  // "fotoDeCapaDoAnunciante" field.
  String? _fotoDeCapaDoAnunciante;
  String get fotoDeCapaDoAnunciante => _fotoDeCapaDoAnunciante ?? '';
  bool hasFotoDeCapaDoAnunciante() => _fotoDeCapaDoAnunciante != null;

  // "lojistaReference" field.
  DocumentReference? _lojistaReference;
  DocumentReference? get lojistaReference => _lojistaReference;
  bool hasLojistaReference() => _lojistaReference != null;

  // "localizacaoDoUsuario" field.
  LatLng? _localizacaoDoUsuario;
  LatLng? get localizacaoDoUsuario => _localizacaoDoUsuario;
  bool hasLocalizacaoDoUsuario() => _localizacaoDoUsuario != null;

  // "enderecoDoUsuario" field.
  String? _enderecoDoUsuario;
  String get enderecoDoUsuario => _enderecoDoUsuario ?? '';
  bool hasEnderecoDoUsuario() => _enderecoDoUsuario != null;

  // "lojasQueSigo" field.
  List<String>? _lojasQueSigo;
  List<String> get lojasQueSigo => _lojasQueSigo ?? const [];
  bool hasLojasQueSigo() => _lojasQueSigo != null;

  // "virouComerciante" field.
  bool? _virouComerciante;
  bool get virouComerciante => _virouComerciante ?? false;
  bool hasVirouComerciante() => _virouComerciante != null;

  // "prestadorOuLojista" field.
  String? _prestadorOuLojista;
  String get prestadorOuLojista => _prestadorOuLojista ?? '';
  bool hasPrestadorOuLojista() => _prestadorOuLojista != null;

  // "lojista" field.
  DocumentReference? _lojista;
  DocumentReference? get lojista => _lojista;
  bool hasLojista() => _lojista != null;

  // "prestador" field.
  DocumentReference? _prestador;
  DocumentReference? get prestador => _prestador;
  bool hasPrestador() => _prestador != null;

  // "cpfCnpj" field.
  String? _cpfCnpj;
  String get cpfCnpj => _cpfCnpj ?? '';
  bool hasCpfCnpj() => _cpfCnpj != null;

  // "favoritos" field.
  List<DocumentReference>? _favoritos;
  List<DocumentReference> get favoritos => _favoritos ?? const [];
  bool hasFavoritos() => _favoritos != null;

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  // "plano" field.
  String? _plano;
  String get plano => _plano ?? '';
  bool hasPlano() => _plano != null;

  // "numeroCasa" field.
  int? _numeroCasa;
  int get numeroCasa => _numeroCasa ?? 0;
  bool hasNumeroCasa() => _numeroCasa != null;

  // "complemento" field.
  String? _complemento;
  String get complemento => _complemento ?? '';
  bool hasComplemento() => _complemento != null;

  // "bairro" field.
  String? _bairro;
  String get bairro => _bairro ?? '';
  bool hasBairro() => _bairro != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "seguidores" field.
  List<String>? _seguidores;
  List<String> get seguidores => _seguidores ?? const [];
  bool hasSeguidores() => _seguidores != null;

  // "suspenso" field.
  bool? _suspenso;
  bool get suspenso => _suspenso ?? false;
  bool hasSuspenso() => _suspenso != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _fotoDoComerciante = snapshotData['fotoDoComerciante'] as String?;
    _fotoDeCapaDoAnunciante = snapshotData['fotoDeCapaDoAnunciante'] as String?;
    _lojistaReference = snapshotData['lojistaReference'] as DocumentReference?;
    _localizacaoDoUsuario = snapshotData['localizacaoDoUsuario'] as LatLng?;
    _enderecoDoUsuario = snapshotData['enderecoDoUsuario'] as String?;
    _lojasQueSigo = getDataList(snapshotData['lojasQueSigo']);
    _virouComerciante = snapshotData['virouComerciante'] as bool?;
    _prestadorOuLojista = snapshotData['prestadorOuLojista'] as String?;
    _lojista = snapshotData['lojista'] as DocumentReference?;
    _prestador = snapshotData['prestador'] as DocumentReference?;
    _cpfCnpj = snapshotData['cpfCnpj'] as String?;
    _favoritos = getDataList(snapshotData['favoritos']);
    _admin = snapshotData['admin'] as bool?;
    _plano = snapshotData['plano'] as String?;
    _numeroCasa = castToType<int>(snapshotData['numeroCasa']);
    _complemento = snapshotData['complemento'] as String?;
    _bairro = snapshotData['bairro'] as String?;
    _cidade = snapshotData['cidade'] as String?;
    _estado = snapshotData['estado'] as String?;
    _seguidores = getDataList(snapshotData['seguidores']);
    _suspenso = snapshotData['suspenso'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? fotoDoComerciante,
  String? fotoDeCapaDoAnunciante,
  DocumentReference? lojistaReference,
  LatLng? localizacaoDoUsuario,
  String? enderecoDoUsuario,
  bool? virouComerciante,
  String? prestadorOuLojista,
  DocumentReference? lojista,
  DocumentReference? prestador,
  String? cpfCnpj,
  bool? admin,
  String? plano,
  int? numeroCasa,
  String? complemento,
  String? bairro,
  String? cidade,
  String? estado,
  bool? suspenso,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'fotoDoComerciante': fotoDoComerciante,
      'fotoDeCapaDoAnunciante': fotoDeCapaDoAnunciante,
      'lojistaReference': lojistaReference,
      'localizacaoDoUsuario': localizacaoDoUsuario,
      'enderecoDoUsuario': enderecoDoUsuario,
      'virouComerciante': virouComerciante,
      'prestadorOuLojista': prestadorOuLojista,
      'lojista': lojista,
      'prestador': prestador,
      'cpfCnpj': cpfCnpj,
      'admin': admin,
      'plano': plano,
      'numeroCasa': numeroCasa,
      'complemento': complemento,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
      'suspenso': suspenso,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.fotoDoComerciante == e2?.fotoDoComerciante &&
        e1?.fotoDeCapaDoAnunciante == e2?.fotoDeCapaDoAnunciante &&
        e1?.lojistaReference == e2?.lojistaReference &&
        e1?.localizacaoDoUsuario == e2?.localizacaoDoUsuario &&
        e1?.enderecoDoUsuario == e2?.enderecoDoUsuario &&
        listEquality.equals(e1?.lojasQueSigo, e2?.lojasQueSigo) &&
        e1?.virouComerciante == e2?.virouComerciante &&
        e1?.prestadorOuLojista == e2?.prestadorOuLojista &&
        e1?.lojista == e2?.lojista &&
        e1?.prestador == e2?.prestador &&
        e1?.cpfCnpj == e2?.cpfCnpj &&
        listEquality.equals(e1?.favoritos, e2?.favoritos) &&
        e1?.admin == e2?.admin &&
        e1?.plano == e2?.plano &&
        e1?.numeroCasa == e2?.numeroCasa &&
        e1?.complemento == e2?.complemento &&
        e1?.bairro == e2?.bairro &&
        e1?.cidade == e2?.cidade &&
        e1?.estado == e2?.estado &&
        listEquality.equals(e1?.seguidores, e2?.seguidores) &&
        e1?.suspenso == e2?.suspenso;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.fotoDoComerciante,
        e?.fotoDeCapaDoAnunciante,
        e?.lojistaReference,
        e?.localizacaoDoUsuario,
        e?.enderecoDoUsuario,
        e?.lojasQueSigo,
        e?.virouComerciante,
        e?.prestadorOuLojista,
        e?.lojista,
        e?.prestador,
        e?.cpfCnpj,
        e?.favoritos,
        e?.admin,
        e?.plano,
        e?.numeroCasa,
        e?.complemento,
        e?.bairro,
        e?.cidade,
        e?.estado,
        e?.seguidores,
        e?.suspenso
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

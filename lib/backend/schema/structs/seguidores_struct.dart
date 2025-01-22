// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SeguidoresStruct extends FFFirebaseStruct {
  SeguidoresStruct({
    String? nome,
    DateTime? dia,
    DocumentReference? referenceUser,
    String? img,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nome = nome,
        _dia = dia,
        _referenceUser = referenceUser,
        _img = img,
        super(firestoreUtilData);

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "dia" field.
  DateTime? _dia;
  DateTime? get dia => _dia;
  set dia(DateTime? val) => _dia = val;

  bool hasDia() => _dia != null;

  // "referenceUser" field.
  DocumentReference? _referenceUser;
  DocumentReference? get referenceUser => _referenceUser;
  set referenceUser(DocumentReference? val) => _referenceUser = val;

  bool hasReferenceUser() => _referenceUser != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  static SeguidoresStruct fromMap(Map<String, dynamic> data) =>
      SeguidoresStruct(
        nome: data['nome'] as String?,
        dia: data['dia'] as DateTime?,
        referenceUser: data['referenceUser'] as DocumentReference?,
        img: data['img'] as String?,
      );

  static SeguidoresStruct? maybeFromMap(dynamic data) => data is Map
      ? SeguidoresStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'dia': _dia,
        'referenceUser': _referenceUser,
        'img': _img,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'dia': serializeParam(
          _dia,
          ParamType.DateTime,
        ),
        'referenceUser': serializeParam(
          _referenceUser,
          ParamType.DocumentReference,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
      }.withoutNulls;

  static SeguidoresStruct fromSerializableMap(Map<String, dynamic> data) =>
      SeguidoresStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        dia: deserializeParam(
          data['dia'],
          ParamType.DateTime,
          false,
        ),
        referenceUser: deserializeParam(
          data['referenceUser'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SeguidoresStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SeguidoresStruct &&
        nome == other.nome &&
        dia == other.dia &&
        referenceUser == other.referenceUser &&
        img == other.img;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nome, dia, referenceUser, img]);
}

SeguidoresStruct createSeguidoresStruct({
  String? nome,
  DateTime? dia,
  DocumentReference? referenceUser,
  String? img,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SeguidoresStruct(
      nome: nome,
      dia: dia,
      referenceUser: referenceUser,
      img: img,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SeguidoresStruct? updateSeguidoresStruct(
  SeguidoresStruct? seguidores, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    seguidores
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSeguidoresStructData(
  Map<String, dynamic> firestoreData,
  SeguidoresStruct? seguidores,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (seguidores == null) {
    return;
  }
  if (seguidores.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && seguidores.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final seguidoresData = getSeguidoresFirestoreData(seguidores, forFieldValue);
  final nestedData = seguidoresData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = seguidores.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSeguidoresFirestoreData(
  SeguidoresStruct? seguidores, [
  bool forFieldValue = false,
]) {
  if (seguidores == null) {
    return {};
  }
  final firestoreData = mapToFirestore(seguidores.toMap());

  // Add any Firestore field values
  seguidores.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSeguidoresListFirestoreData(
  List<SeguidoresStruct>? seguidoress,
) =>
    seguidoress?.map((e) => getSeguidoresFirestoreData(e, true)).toList() ?? [];

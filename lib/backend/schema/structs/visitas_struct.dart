// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitasStruct extends FFFirebaseStruct {
  VisitasStruct({
    DocumentReference? referenceDaPessoa,
    DateTime? dia,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _referenceDaPessoa = referenceDaPessoa,
        _dia = dia,
        super(firestoreUtilData);

  // "referenceDaPessoa" field.
  DocumentReference? _referenceDaPessoa;
  DocumentReference? get referenceDaPessoa => _referenceDaPessoa;
  set referenceDaPessoa(DocumentReference? val) => _referenceDaPessoa = val;

  bool hasReferenceDaPessoa() => _referenceDaPessoa != null;

  // "dia" field.
  DateTime? _dia;
  DateTime? get dia => _dia;
  set dia(DateTime? val) => _dia = val;

  bool hasDia() => _dia != null;

  static VisitasStruct fromMap(Map<String, dynamic> data) => VisitasStruct(
        referenceDaPessoa: data['referenceDaPessoa'] as DocumentReference?,
        dia: data['dia'] as DateTime?,
      );

  static VisitasStruct? maybeFromMap(dynamic data) =>
      data is Map ? VisitasStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'referenceDaPessoa': _referenceDaPessoa,
        'dia': _dia,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'referenceDaPessoa': serializeParam(
          _referenceDaPessoa,
          ParamType.DocumentReference,
        ),
        'dia': serializeParam(
          _dia,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static VisitasStruct fromSerializableMap(Map<String, dynamic> data) =>
      VisitasStruct(
        referenceDaPessoa: deserializeParam(
          data['referenceDaPessoa'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        dia: deserializeParam(
          data['dia'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'VisitasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VisitasStruct &&
        referenceDaPessoa == other.referenceDaPessoa &&
        dia == other.dia;
  }

  @override
  int get hashCode => const ListEquality().hash([referenceDaPessoa, dia]);
}

VisitasStruct createVisitasStruct({
  DocumentReference? referenceDaPessoa,
  DateTime? dia,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VisitasStruct(
      referenceDaPessoa: referenceDaPessoa,
      dia: dia,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VisitasStruct? updateVisitasStruct(
  VisitasStruct? visitas, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    visitas
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVisitasStructData(
  Map<String, dynamic> firestoreData,
  VisitasStruct? visitas,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (visitas == null) {
    return;
  }
  if (visitas.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && visitas.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final visitasData = getVisitasFirestoreData(visitas, forFieldValue);
  final nestedData = visitasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = visitas.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVisitasFirestoreData(
  VisitasStruct? visitas, [
  bool forFieldValue = false,
]) {
  if (visitas == null) {
    return {};
  }
  final firestoreData = mapToFirestore(visitas.toMap());

  // Add any Firestore field values
  visitas.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVisitasListFirestoreData(
  List<VisitasStruct>? visitass,
) =>
    visitass?.map((e) => getVisitasFirestoreData(e, true)).toList() ?? [];

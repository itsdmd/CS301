// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GCalEventStruct extends FFFirebaseStruct {
  GCalEventStruct({
    String? id,
    String? htmlLink,
    String? iCalUID,
    String? etag,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _htmlLink = htmlLink,
        _iCalUID = iCalUID,
        _etag = etag,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "htmlLink" field.
  String? _htmlLink;
  String get htmlLink => _htmlLink ?? '';
  set htmlLink(String? val) => _htmlLink = val;

  bool hasHtmlLink() => _htmlLink != null;

  // "iCalUID" field.
  String? _iCalUID;
  String get iCalUID => _iCalUID ?? '';
  set iCalUID(String? val) => _iCalUID = val;

  bool hasICalUID() => _iCalUID != null;

  // "etag" field.
  String? _etag;
  String get etag => _etag ?? '';
  set etag(String? val) => _etag = val;

  bool hasEtag() => _etag != null;

  static GCalEventStruct fromMap(Map<String, dynamic> data) => GCalEventStruct(
        id: data['id'] as String?,
        htmlLink: data['htmlLink'] as String?,
        iCalUID: data['iCalUID'] as String?,
        etag: data['etag'] as String?,
      );

  static GCalEventStruct? maybeFromMap(dynamic data) => data is Map
      ? GCalEventStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'htmlLink': _htmlLink,
        'iCalUID': _iCalUID,
        'etag': _etag,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'htmlLink': serializeParam(
          _htmlLink,
          ParamType.String,
        ),
        'iCalUID': serializeParam(
          _iCalUID,
          ParamType.String,
        ),
        'etag': serializeParam(
          _etag,
          ParamType.String,
        ),
      }.withoutNulls;

  static GCalEventStruct fromSerializableMap(Map<String, dynamic> data) =>
      GCalEventStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        htmlLink: deserializeParam(
          data['htmlLink'],
          ParamType.String,
          false,
        ),
        iCalUID: deserializeParam(
          data['iCalUID'],
          ParamType.String,
          false,
        ),
        etag: deserializeParam(
          data['etag'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GCalEventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GCalEventStruct &&
        id == other.id &&
        htmlLink == other.htmlLink &&
        iCalUID == other.iCalUID &&
        etag == other.etag;
  }

  @override
  int get hashCode => const ListEquality().hash([id, htmlLink, iCalUID, etag]);
}

GCalEventStruct createGCalEventStruct({
  String? id,
  String? htmlLink,
  String? iCalUID,
  String? etag,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GCalEventStruct(
      id: id,
      htmlLink: htmlLink,
      iCalUID: iCalUID,
      etag: etag,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GCalEventStruct? updateGCalEventStruct(
  GCalEventStruct? gCalEvent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gCalEvent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGCalEventStructData(
  Map<String, dynamic> firestoreData,
  GCalEventStruct? gCalEvent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gCalEvent == null) {
    return;
  }
  if (gCalEvent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gCalEvent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gCalEventData = getGCalEventFirestoreData(gCalEvent, forFieldValue);
  final nestedData = gCalEventData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gCalEvent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGCalEventFirestoreData(
  GCalEventStruct? gCalEvent, [
  bool forFieldValue = false,
]) {
  if (gCalEvent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gCalEvent.toMap());

  // Add any Firestore field values
  gCalEvent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGCalEventListFirestoreData(
  List<GCalEventStruct>? gCalEvents,
) =>
    gCalEvents?.map((e) => getGCalEventFirestoreData(e, true)).toList() ?? [];

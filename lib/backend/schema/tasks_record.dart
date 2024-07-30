import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "parent" field.
  DocumentReference? _parent;
  DocumentReference? get parent => _parent;
  bool hasParent() => _parent != null;

  // "due_time" field.
  DateTime? _dueTime;
  DateTime? get dueTime => _dueTime;
  bool hasDueTime() => _dueTime != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "tags" field.
  List<DocumentReference>? _tags;
  List<DocumentReference> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "urgency" field.
  String? _urgency;
  String get urgency => _urgency ?? '';
  bool hasUrgency() => _urgency != null;

  // "is_subtask" field.
  bool? _isSubtask;
  bool get isSubtask => _isSubtask ?? false;
  bool hasIsSubtask() => _isSubtask != null;

  // "checked" field.
  bool? _checked;
  bool get checked => _checked ?? false;
  bool hasChecked() => _checked != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "gglcal_id" field.
  String? _gglcalId;
  String get gglcalId => _gglcalId ?? '';
  bool hasGglcalId() => _gglcalId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _parent = snapshotData['parent'] as DocumentReference?;
    _dueTime = snapshotData['due_time'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _body = snapshotData['body'] as String?;
    _tags = getDataList(snapshotData['tags']);
    _urgency = snapshotData['urgency'] as String?;
    _isSubtask = snapshotData['is_subtask'] as bool?;
    _checked = snapshotData['checked'] as bool?;
    _imageUrl = snapshotData['image_url'] as String?;
    _gglcalId = snapshotData['gglcal_id'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tasks')
          : FirebaseFirestore.instance.collectionGroup('tasks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tasks').doc(id);

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  DateTime? createdTime,
  DateTime? editedTime,
  DocumentReference? parent,
  DateTime? dueTime,
  String? title,
  String? body,
  String? urgency,
  bool? isSubtask,
  bool? checked,
  String? imageUrl,
  String? gglcalId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'edited_time': editedTime,
      'parent': parent,
      'due_time': dueTime,
      'title': title,
      'body': body,
      'urgency': urgency,
      'is_subtask': isSubtask,
      'checked': checked,
      'image_url': imageUrl,
      'gglcal_id': gglcalId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.editedTime == e2?.editedTime &&
        e1?.parent == e2?.parent &&
        e1?.dueTime == e2?.dueTime &&
        e1?.title == e2?.title &&
        e1?.body == e2?.body &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.urgency == e2?.urgency &&
        e1?.isSubtask == e2?.isSubtask &&
        e1?.checked == e2?.checked &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.gglcalId == e2?.gglcalId;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.editedTime,
        e?.parent,
        e?.dueTime,
        e?.title,
        e?.body,
        e?.tags,
        e?.urgency,
        e?.isSubtask,
        e?.checked,
        e?.imageUrl,
        e?.gglcalId
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}

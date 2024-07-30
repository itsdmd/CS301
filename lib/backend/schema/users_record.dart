import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

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

  // "tier" field.
  UserTier? _tier;
  UserTier? get tier => _tier;
  bool hasTier() => _tier != null;

  // "language" field.
  Language? _language;
  Language? get language => _language;
  bool hasLanguage() => _language != null;

  // "dark_mode" field.
  bool? _darkMode;
  bool get darkMode => _darkMode ?? false;
  bool hasDarkMode() => _darkMode != null;

  // "sync_gglcal" field.
  bool? _syncGglcal;
  bool get syncGglcal => _syncGglcal ?? false;
  bool hasSyncGglcal() => _syncGglcal != null;

  // "access_token_gglcal" field.
  String? _accessTokenGglcal;
  String get accessTokenGglcal => _accessTokenGglcal ?? '';
  bool hasAccessTokenGglcal() => _accessTokenGglcal != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _tier = deserializeEnum<UserTier>(snapshotData['tier']);
    _language = deserializeEnum<Language>(snapshotData['language']);
    _darkMode = snapshotData['dark_mode'] as bool?;
    _syncGglcal = snapshotData['sync_gglcal'] as bool?;
    _accessTokenGglcal = snapshotData['access_token_gglcal'] as String?;
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
  UserTier? tier,
  Language? language,
  bool? darkMode,
  bool? syncGglcal,
  String? accessTokenGglcal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'tier': tier,
      'language': language,
      'dark_mode': darkMode,
      'sync_gglcal': syncGglcal,
      'access_token_gglcal': accessTokenGglcal,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.tier == e2?.tier &&
        e1?.language == e2?.language &&
        e1?.darkMode == e2?.darkMode &&
        e1?.syncGglcal == e2?.syncGglcal &&
        e1?.accessTokenGglcal == e2?.accessTokenGglcal;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.tier,
        e?.language,
        e?.darkMode,
        e?.syncGglcal,
        e?.accessTokenGglcal
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

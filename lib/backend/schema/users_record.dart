import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
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

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "businessName" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "BlurHash_photo" field.
  String? _blurHashPhoto;
  String get blurHashPhoto => _blurHashPhoto ?? '';
  bool hasBlurHashPhoto() => _blurHashPhoto != null;

  // "vip" field.
  bool? _vip;
  bool get vip => _vip ?? false;
  bool hasVip() => _vip != null;

  // "Reactions" field.
  int? _reactions;
  int get reactions => _reactions ?? 0;
  bool hasReactions() => _reactions != null;

  // "Followers" field.
  int? _followers;
  int get followers => _followers ?? 0;
  bool hasFollowers() => _followers != null;

  // "Following" field.
  int? _following;
  int get following => _following ?? 0;
  bool hasFollowing() => _following != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "myBio" field.
  String? _myBio;
  String get myBio => _myBio ?? '';
  bool hasMyBio() => _myBio != null;

  // "pinCodeEnabled" field.
  bool? _pinCodeEnabled;
  bool get pinCodeEnabled => _pinCodeEnabled ?? false;
  bool hasPinCodeEnabled() => _pinCodeEnabled != null;

  // "biometricEnabled" field.
  bool? _biometricEnabled;
  bool get biometricEnabled => _biometricEnabled ?? false;
  bool hasBiometricEnabled() => _biometricEnabled != null;

  // "onboardingFinished" field.
  bool? _onboardingFinished;
  bool get onboardingFinished => _onboardingFinished ?? false;
  bool hasOnboardingFinished() => _onboardingFinished != null;

  // "pin_code" field.
  String? _pinCode;
  String get pinCode => _pinCode ?? '';
  bool hasPinCode() => _pinCode != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _businessName = snapshotData['businessName'] as String?;
    _blurHashPhoto = snapshotData['BlurHash_photo'] as String?;
    _vip = snapshotData['vip'] as bool?;
    _reactions = castToType<int>(snapshotData['Reactions']);
    _followers = castToType<int>(snapshotData['Followers']);
    _following = castToType<int>(snapshotData['Following']);
    _direccion = snapshotData['direccion'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _city = snapshotData['city'] as String?;
    _myBio = snapshotData['myBio'] as String?;
    _pinCodeEnabled = snapshotData['pinCodeEnabled'] as bool?;
    _biometricEnabled = snapshotData['biometricEnabled'] as bool?;
    _onboardingFinished = snapshotData['onboardingFinished'] as bool?;
    _pinCode = snapshotData['pin_code'] as String?;
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
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  String? businessName,
  String? blurHashPhoto,
  bool? vip,
  int? reactions,
  int? followers,
  int? following,
  String? direccion,
  LatLng? location,
  String? city,
  String? myBio,
  bool? pinCodeEnabled,
  bool? biometricEnabled,
  bool? onboardingFinished,
  String? pinCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'businessName': businessName,
      'BlurHash_photo': blurHashPhoto,
      'vip': vip,
      'Reactions': reactions,
      'Followers': followers,
      'Following': following,
      'direccion': direccion,
      'location': location,
      'city': city,
      'myBio': myBio,
      'pinCodeEnabled': pinCodeEnabled,
      'biometricEnabled': biometricEnabled,
      'onboardingFinished': onboardingFinished,
      'pin_code': pinCode,
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
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.businessName == e2?.businessName &&
        e1?.blurHashPhoto == e2?.blurHashPhoto &&
        e1?.vip == e2?.vip &&
        e1?.reactions == e2?.reactions &&
        e1?.followers == e2?.followers &&
        e1?.following == e2?.following &&
        e1?.direccion == e2?.direccion &&
        e1?.location == e2?.location &&
        e1?.city == e2?.city &&
        e1?.myBio == e2?.myBio &&
        e1?.pinCodeEnabled == e2?.pinCodeEnabled &&
        e1?.biometricEnabled == e2?.biometricEnabled &&
        e1?.onboardingFinished == e2?.onboardingFinished &&
        e1?.pinCode == e2?.pinCode;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.businessName,
        e?.blurHashPhoto,
        e?.vip,
        e?.reactions,
        e?.followers,
        e?.following,
        e?.direccion,
        e?.location,
        e?.city,
        e?.myBio,
        e?.pinCodeEnabled,
        e?.biometricEnabled,
        e?.onboardingFinished,
        e?.pinCode
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

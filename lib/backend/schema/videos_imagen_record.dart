import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosImagenRecord extends FirestoreRecord {
  VideosImagenRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "listaComentarios" field.
  List<DocumentReference>? _listaComentarios;
  List<DocumentReference> get listaComentarios => _listaComentarios ?? const [];
  bool hasListaComentarios() => _listaComentarios != null;

  // "listaSubComentarios" field.
  List<DocumentReference>? _listaSubComentarios;
  List<DocumentReference> get listaSubComentarios =>
      _listaSubComentarios ?? const [];
  bool hasListaSubComentarios() => _listaSubComentarios != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _video = snapshotData['video'] as String?;
    _imagen = snapshotData['imagen'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _listaComentarios = getDataList(snapshotData['listaComentarios']);
    _listaSubComentarios = getDataList(snapshotData['listaSubComentarios']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videosImagen');

  static Stream<VideosImagenRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosImagenRecord.fromSnapshot(s));

  static Future<VideosImagenRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosImagenRecord.fromSnapshot(s));

  static VideosImagenRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VideosImagenRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosImagenRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosImagenRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosImagenRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosImagenRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosImagenRecordData({
  DocumentReference? userRef,
  String? video,
  String? imagen,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'video': video,
      'imagen': imagen,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosImagenRecordDocumentEquality
    implements Equality<VideosImagenRecord> {
  const VideosImagenRecordDocumentEquality();

  @override
  bool equals(VideosImagenRecord? e1, VideosImagenRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.video == e2?.video &&
        e1?.imagen == e2?.imagen &&
        e1?.time == e2?.time &&
        listEquality.equals(e1?.listaComentarios, e2?.listaComentarios) &&
        listEquality.equals(e1?.listaSubComentarios, e2?.listaSubComentarios);
  }

  @override
  int hash(VideosImagenRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.video,
        e?.imagen,
        e?.time,
        e?.listaComentarios,
        e?.listaSubComentarios
      ]);

  @override
  bool isValidKey(Object? o) => o is VideosImagenRecord;
}

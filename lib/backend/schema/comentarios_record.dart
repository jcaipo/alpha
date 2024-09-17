import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComentariosRecord extends FirestoreRecord {
  ComentariosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "mensaje" field.
  String? _mensaje;
  String get mensaje => _mensaje ?? '';
  bool hasMensaje() => _mensaje != null;

  // "creadoPor" field.
  DocumentReference? _creadoPor;
  DocumentReference? get creadoPor => _creadoPor;
  bool hasCreadoPor() => _creadoPor != null;

  // "creadoFecha" field.
  DateTime? _creadoFecha;
  DateTime? get creadoFecha => _creadoFecha;
  bool hasCreadoFecha() => _creadoFecha != null;

  // "refVideo" field.
  DocumentReference? _refVideo;
  DocumentReference? get refVideo => _refVideo;
  bool hasRefVideo() => _refVideo != null;

  void _initializeFields() {
    _mensaje = snapshotData['mensaje'] as String?;
    _creadoPor = snapshotData['creadoPor'] as DocumentReference?;
    _creadoFecha = snapshotData['creadoFecha'] as DateTime?;
    _refVideo = snapshotData['refVideo'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comentarios');

  static Stream<ComentariosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComentariosRecord.fromSnapshot(s));

  static Future<ComentariosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ComentariosRecord.fromSnapshot(s));

  static ComentariosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComentariosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComentariosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComentariosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComentariosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComentariosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComentariosRecordData({
  String? mensaje,
  DocumentReference? creadoPor,
  DateTime? creadoFecha,
  DocumentReference? refVideo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mensaje': mensaje,
      'creadoPor': creadoPor,
      'creadoFecha': creadoFecha,
      'refVideo': refVideo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComentariosRecordDocumentEquality implements Equality<ComentariosRecord> {
  const ComentariosRecordDocumentEquality();

  @override
  bool equals(ComentariosRecord? e1, ComentariosRecord? e2) {
    return e1?.mensaje == e2?.mensaje &&
        e1?.creadoPor == e2?.creadoPor &&
        e1?.creadoFecha == e2?.creadoFecha &&
        e1?.refVideo == e2?.refVideo;
  }

  @override
  int hash(ComentariosRecord? e) => const ListEquality()
      .hash([e?.mensaje, e?.creadoPor, e?.creadoFecha, e?.refVideo]);

  @override
  bool isValidKey(Object? o) => o is ComentariosRecord;
}

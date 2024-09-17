import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubComentariosRecord extends FirestoreRecord {
  SubComentariosRecord._(
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

  // "fechaCreacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "refVideo" field.
  DocumentReference? _refVideo;
  DocumentReference? get refVideo => _refVideo;
  bool hasRefVideo() => _refVideo != null;

  // "refComentario" field.
  DocumentReference? _refComentario;
  DocumentReference? get refComentario => _refComentario;
  bool hasRefComentario() => _refComentario != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _mensaje = snapshotData['mensaje'] as String?;
    _creadoPor = snapshotData['creadoPor'] as DocumentReference?;
    _fechaCreacion = snapshotData['fechaCreacion'] as DateTime?;
    _refVideo = snapshotData['refVideo'] as DocumentReference?;
    _refComentario = snapshotData['refComentario'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('subComentarios')
          : FirebaseFirestore.instance.collectionGroup('subComentarios');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('subComentarios').doc(id);

  static Stream<SubComentariosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubComentariosRecord.fromSnapshot(s));

  static Future<SubComentariosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubComentariosRecord.fromSnapshot(s));

  static SubComentariosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubComentariosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubComentariosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubComentariosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubComentariosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubComentariosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubComentariosRecordData({
  String? mensaje,
  DocumentReference? creadoPor,
  DateTime? fechaCreacion,
  DocumentReference? refVideo,
  DocumentReference? refComentario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mensaje': mensaje,
      'creadoPor': creadoPor,
      'fechaCreacion': fechaCreacion,
      'refVideo': refVideo,
      'refComentario': refComentario,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubComentariosRecordDocumentEquality
    implements Equality<SubComentariosRecord> {
  const SubComentariosRecordDocumentEquality();

  @override
  bool equals(SubComentariosRecord? e1, SubComentariosRecord? e2) {
    return e1?.mensaje == e2?.mensaje &&
        e1?.creadoPor == e2?.creadoPor &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.refVideo == e2?.refVideo &&
        e1?.refComentario == e2?.refComentario;
  }

  @override
  int hash(SubComentariosRecord? e) => const ListEquality().hash([
        e?.mensaje,
        e?.creadoPor,
        e?.fechaCreacion,
        e?.refVideo,
        e?.refComentario
      ]);

  @override
  bool isValidKey(Object? o) => o is SubComentariosRecord;
}

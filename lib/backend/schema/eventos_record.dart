import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventosRecord extends FirestoreRecord {
  EventosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_uid" field.
  DocumentReference? _userUid;
  DocumentReference? get userUid => _userUid;
  bool hasUserUid() => _userUid != null;

  // "nombreEvento" field.
  String? _nombreEvento;
  String get nombreEvento => _nombreEvento ?? '';
  bool hasNombreEvento() => _nombreEvento != null;

  // "direccionEvento" field.
  String? _direccionEvento;
  String get direccionEvento => _direccionEvento ?? '';
  bool hasDireccionEvento() => _direccionEvento != null;

  // "locationEvento" field.
  LatLng? _locationEvento;
  LatLng? get locationEvento => _locationEvento;
  bool hasLocationEvento() => _locationEvento != null;

  // "dia" field.
  DateTime? _dia;
  DateTime? get dia => _dia;
  bool hasDia() => _dia != null;

  // "hora" field.
  DateTime? _hora;
  DateTime? get hora => _hora;
  bool hasHora() => _hora != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "network" field.
  String? _network;
  String get network => _network ?? '';
  bool hasNetwork() => _network != null;

  void _initializeFields() {
    _userUid = snapshotData['user_uid'] as DocumentReference?;
    _nombreEvento = snapshotData['nombreEvento'] as String?;
    _direccionEvento = snapshotData['direccionEvento'] as String?;
    _locationEvento = snapshotData['locationEvento'] as LatLng?;
    _dia = snapshotData['dia'] as DateTime?;
    _hora = snapshotData['hora'] as DateTime?;
    _imagen = snapshotData['imagen'] as String?;
    _video = snapshotData['video'] as String?;
    _network = snapshotData['network'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('eventos');

  static Stream<EventosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventosRecord.fromSnapshot(s));

  static Future<EventosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventosRecord.fromSnapshot(s));

  static EventosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventosRecordData({
  DocumentReference? userUid,
  String? nombreEvento,
  String? direccionEvento,
  LatLng? locationEvento,
  DateTime? dia,
  DateTime? hora,
  String? imagen,
  String? video,
  String? network,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_uid': userUid,
      'nombreEvento': nombreEvento,
      'direccionEvento': direccionEvento,
      'locationEvento': locationEvento,
      'dia': dia,
      'hora': hora,
      'imagen': imagen,
      'video': video,
      'network': network,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventosRecordDocumentEquality implements Equality<EventosRecord> {
  const EventosRecordDocumentEquality();

  @override
  bool equals(EventosRecord? e1, EventosRecord? e2) {
    return e1?.userUid == e2?.userUid &&
        e1?.nombreEvento == e2?.nombreEvento &&
        e1?.direccionEvento == e2?.direccionEvento &&
        e1?.locationEvento == e2?.locationEvento &&
        e1?.dia == e2?.dia &&
        e1?.hora == e2?.hora &&
        e1?.imagen == e2?.imagen &&
        e1?.video == e2?.video &&
        e1?.network == e2?.network;
  }

  @override
  int hash(EventosRecord? e) => const ListEquality().hash([
        e?.userUid,
        e?.nombreEvento,
        e?.direccionEvento,
        e?.locationEvento,
        e?.dia,
        e?.hora,
        e?.imagen,
        e?.video,
        e?.network
      ]);

  @override
  bool isValidKey(Object? o) => o is EventosRecord;
}

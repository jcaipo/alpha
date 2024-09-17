import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoogleMapsRecord extends FirestoreRecord {
  GoogleMapsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ubicacion" field.
  LatLng? _ubicacion;
  LatLng? get ubicacion => _ubicacion;
  bool hasUbicacion() => _ubicacion != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "descrpcion" field.
  String? _descrpcion;
  String get descrpcion => _descrpcion ?? '';
  bool hasDescrpcion() => _descrpcion != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  void _initializeFields() {
    _ubicacion = snapshotData['ubicacion'] as LatLng?;
    _foto = snapshotData['foto'] as String?;
    _titulo = snapshotData['titulo'] as String?;
    _descrpcion = snapshotData['descrpcion'] as String?;
    _direccion = snapshotData['direccion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Google_maps');

  static Stream<GoogleMapsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoogleMapsRecord.fromSnapshot(s));

  static Future<GoogleMapsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoogleMapsRecord.fromSnapshot(s));

  static GoogleMapsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GoogleMapsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoogleMapsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoogleMapsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoogleMapsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoogleMapsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoogleMapsRecordData({
  LatLng? ubicacion,
  String? foto,
  String? titulo,
  String? descrpcion,
  String? direccion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ubicacion': ubicacion,
      'foto': foto,
      'titulo': titulo,
      'descrpcion': descrpcion,
      'direccion': direccion,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoogleMapsRecordDocumentEquality implements Equality<GoogleMapsRecord> {
  const GoogleMapsRecordDocumentEquality();

  @override
  bool equals(GoogleMapsRecord? e1, GoogleMapsRecord? e2) {
    return e1?.ubicacion == e2?.ubicacion &&
        e1?.foto == e2?.foto &&
        e1?.titulo == e2?.titulo &&
        e1?.descrpcion == e2?.descrpcion &&
        e1?.direccion == e2?.direccion;
  }

  @override
  int hash(GoogleMapsRecord? e) => const ListEquality()
      .hash([e?.ubicacion, e?.foto, e?.titulo, e?.descrpcion, e?.direccion]);

  @override
  bool isValidKey(Object? o) => o is GoogleMapsRecord;
}

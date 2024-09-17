import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'map_location_widget.dart' show MapLocationWidget;
import 'package:flutter/material.dart';

class MapLocationModel extends FlutterFlowModel<MapLocationWidget> {
  ///  Local state fields for this page.

  bool? mapLoaded;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    navBar1Model.dispose();
  }
}

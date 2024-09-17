import '/components/subir_contenido_exclisivo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contenido_exclusivo_widget.dart' show ContenidoExclusivoWidget;
import 'package:flutter/material.dart';

class ContenidoExclusivoModel
    extends FlutterFlowModel<ContenidoExclusivoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for subirContenidoExclisivo component.
  late SubirContenidoExclisivoModel subirContenidoExclisivoModel;

  @override
  void initState(BuildContext context) {
    subirContenidoExclisivoModel =
        createModel(context, () => SubirContenidoExclisivoModel());
  }

  @override
  void dispose() {
    subirContenidoExclisivoModel.dispose();
  }
}

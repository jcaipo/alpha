import '/flutter_flow/flutter_flow_util.dart';
import 'respuesta_comentarios_widget.dart' show RespuestaComentariosWidget;
import 'package:flutter/material.dart';

class RespuestaComentariosModel
    extends FlutterFlowModel<RespuestaComentariosWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldAnadir widget.
  FocusNode? textFieldAnadirFocusNode;
  TextEditingController? textFieldAnadirTextController;
  String? Function(BuildContext, String?)?
      textFieldAnadirTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldAnadirFocusNode?.dispose();
    textFieldAnadirTextController?.dispose();
  }
}

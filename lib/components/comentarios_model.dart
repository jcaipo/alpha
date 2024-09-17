import '/flutter_flow/flutter_flow_util.dart';
import 'comentarios_widget.dart' show ComentariosWidget;
import 'package:flutter/material.dart';

class ComentariosModel extends FlutterFlowModel<ComentariosWidget> {
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

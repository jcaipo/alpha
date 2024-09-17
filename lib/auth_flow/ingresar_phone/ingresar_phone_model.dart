import '/flutter_flow/flutter_flow_util.dart';
import 'ingresar_phone_widget.dart' show IngresarPhoneWidget;
import 'package:flutter/material.dart';

class IngresarPhoneModel extends FlutterFlowModel<IngresarPhoneWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();
  }
}

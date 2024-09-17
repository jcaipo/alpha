import '/flutter_flow/flutter_flow_util.dart';
import 'ingresar_pin_code_widget.dart' show IngresarPinCodeWidget;
import 'package:flutter/material.dart';

class IngresarPinCodeModel extends FlutterFlowModel<IngresarPinCodeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}

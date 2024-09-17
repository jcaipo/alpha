import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'subir_contenido_exclisivo_widget.dart'
    show SubirContenidoExclisivoWidget;
import 'package:flutter/material.dart';

class SubirContenidoExclisivoModel
    extends FlutterFlowModel<SubirContenidoExclisivoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Nombredelcontenido widget.
  FocusNode? nombredelcontenidoFocusNode;
  TextEditingController? nombredelcontenidoTextController;
  String? Function(BuildContext, String?)?
      nombredelcontenidoTextControllerValidator;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioTextController;
  String? Function(BuildContext, String?)? myBioTextControllerValidator;
  // State field(s) for yourNumberBusiness widget.
  FocusNode? yourNumberBusinessFocusNode;
  TextEditingController? yourNumberBusinessTextController;
  String? Function(BuildContext, String?)?
      yourNumberBusinessTextControllerValidator;
  // State field(s) for DropDownNetwork widget.
  String? dropDownNetworkValue;
  FormFieldController<String>? dropDownNetworkValueController;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombredelcontenidoFocusNode?.dispose();
    nombredelcontenidoTextController?.dispose();

    myBioFocusNode?.dispose();
    myBioTextController?.dispose();

    yourNumberBusinessFocusNode?.dispose();
    yourNumberBusinessTextController?.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_profile_component_widget.dart' show EditProfileComponentWidget;
import 'package:flutter/material.dart';

class EditProfileComponentModel
    extends FlutterFlowModel<EditProfileComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for yourNameBusiness widget.
  FocusNode? yourNameBusinessFocusNode;
  TextEditingController? yourNameBusinessTextController;
  String? Function(BuildContext, String?)?
      yourNameBusinessTextControllerValidator;
  // State field(s) for yourNumberBusiness widget.
  FocusNode? yourNumberBusinessFocusNode;
  TextEditingController? yourNumberBusinessTextController;
  String? Function(BuildContext, String?)?
      yourNumberBusinessTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioTextController;
  String? Function(BuildContext, String?)? myBioTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    yourNameBusinessFocusNode?.dispose();
    yourNameBusinessTextController?.dispose();

    yourNumberBusinessFocusNode?.dispose();
    yourNumberBusinessTextController?.dispose();

    myBioFocusNode?.dispose();
    myBioTextController?.dispose();
  }
}

import '/backend/backend.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_member_search_widget.dart' show ListMemberSearchWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ListMemberSearchModel extends FlutterFlowModel<ListMemberSearchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldBuscar widget.
  FocusNode? textFieldBuscarFocusNode;
  TextEditingController? textFieldBuscarTextController;
  String? Function(BuildContext, String?)?
      textFieldBuscarTextControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    textFieldBuscarFocusNode?.dispose();
    textFieldBuscarTextController?.dispose();

    navBar1Model.dispose();
  }
}

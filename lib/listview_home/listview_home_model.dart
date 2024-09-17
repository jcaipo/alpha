import '/components/card_user_comentarios_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'listview_home_widget.dart' show ListviewHomeWidget;
import 'package:flutter/material.dart';

class ListviewHomeModel extends FlutterFlowModel<ListviewHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for cardUserComentarios dynamic component.
  late FlutterFlowDynamicModels<CardUserComentariosModel>
      cardUserComentariosModels;

  @override
  void initState(BuildContext context) {
    cardUserComentariosModels =
        FlutterFlowDynamicModels(() => CardUserComentariosModel());
  }

  @override
  void dispose() {
    cardUserComentariosModels.dispose();
  }
}

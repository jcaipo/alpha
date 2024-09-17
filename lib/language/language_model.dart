import '/components/header_widget.dart';
import '/components/languages_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'language_widget.dart' show LanguageWidget;
import 'package:flutter/material.dart';

class LanguageModel extends FlutterFlowModel<LanguageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for en.
  late LanguagesItemModel enModel;
  // Model for es.
  late LanguagesItemModel esModel;
  // Model for de.
  late LanguagesItemModel deModel;
  // Model for fr.
  late LanguagesItemModel frModel;
  // Model for it.
  late LanguagesItemModel itModel;
  // Model for po.
  late LanguagesItemModel poModel;
  // Model for ja.
  late LanguagesItemModel jaModel;
  // Model for ar.
  late LanguagesItemModel arModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    enModel = createModel(context, () => LanguagesItemModel());
    esModel = createModel(context, () => LanguagesItemModel());
    deModel = createModel(context, () => LanguagesItemModel());
    frModel = createModel(context, () => LanguagesItemModel());
    itModel = createModel(context, () => LanguagesItemModel());
    poModel = createModel(context, () => LanguagesItemModel());
    jaModel = createModel(context, () => LanguagesItemModel());
    arModel = createModel(context, () => LanguagesItemModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    enModel.dispose();
    esModel.dispose();
    deModel.dispose();
    frModel.dispose();
    itModel.dispose();
    poModel.dispose();
    jaModel.dispose();
    arModel.dispose();
  }
}

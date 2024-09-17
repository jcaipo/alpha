import '/components/subir_contenido_exclisivo_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'contenido_exclusivo_model.dart';
export 'contenido_exclusivo_model.dart';

class ContenidoExclusivoWidget extends StatefulWidget {
  const ContenidoExclusivoWidget({super.key});

  @override
  State<ContenidoExclusivoWidget> createState() =>
      _ContenidoExclusivoWidgetState();
}

class _ContenidoExclusivoWidgetState extends State<ContenidoExclusivoWidget> {
  late ContenidoExclusivoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContenidoExclusivoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Align(
        alignment: const AlignmentDirectional(0.0, -1.0),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 570.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.subirContenidoExclisivoModel,
                  updateCallback: () => safeSetState(() {}),
                  child: SubirContenidoExclisivoWidget(
                    navigateAction: () async {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

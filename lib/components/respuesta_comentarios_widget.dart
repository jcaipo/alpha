import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'respuesta_comentarios_model.dart';
export 'respuesta_comentarios_model.dart';

class RespuestaComentariosWidget extends StatefulWidget {
  const RespuestaComentariosWidget({
    super.key,
    required this.comentarioSeleccionado,
    String? creadoPor,
  }) : creadoPor = creadoPor ?? 'creadoPor';

  final ComentariosRecord? comentarioSeleccionado;
  final String creadoPor;

  @override
  State<RespuestaComentariosWidget> createState() =>
      _RespuestaComentariosWidgetState();
}

class _RespuestaComentariosWidgetState
    extends State<RespuestaComentariosWidget> {
  late RespuestaComentariosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RespuestaComentariosModel());

    _model.textFieldAnadirTextController ??= TextEditingController();
    _model.textFieldAnadirFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        height: 80.0,
        constraints: const BoxConstraints(
          maxWidth: 700.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryText,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              AuthUserStreamWidget(
                builder: (context) => Container(
                  width: 50.0,
                  height: 50.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    currentUserPhoto,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textFieldAnadirTextController,
                    focusNode: _model.textFieldAnadirFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'u2yb4y9v' /* Añadir comentario... */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                        ),
                    validator: _model.textFieldAnadirTextControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              FlutterFlowIconButton(
                borderColor: const Color(0x00F83B46),
                borderRadius: 40.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                fillColor: Colors.transparent,
                icon: Icon(
                  Icons.send,
                  color: FlutterFlowTheme.of(context).alternate,
                  size: 40.0,
                ),
                onPressed: () async {
                  await SubComentariosRecord.createDoc(
                          widget.comentarioSeleccionado!.reference)
                      .set(createSubComentariosRecordData(
                    mensaje: _model.textFieldAnadirTextController.text,
                    creadoPor: currentUserReference,
                    fechaCreacion: getCurrentTimestamp,
                    refComentario: widget.comentarioSeleccionado?.reference,
                    refVideo: widget.comentarioSeleccionado?.refVideo,
                  ));
                  safeSetState(() {
                    _model.textFieldAnadirTextController?.clear();
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import '/components/comentarios_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'card_user_comentarios_model.dart';
export 'card_user_comentarios_model.dart';

class CardUserComentariosWidget extends StatefulWidget {
  const CardUserComentariosWidget({
    super.key,
    required this.imagen,
    required this.userName,
    required this.negocioNane,
    required this.videoRef,
    required this.userRef,
  });

  final String? imagen;
  final String? userName;
  final String? negocioNane;
  final DocumentReference? videoRef;
  final DocumentReference? userRef;

  @override
  State<CardUserComentariosWidget> createState() =>
      _CardUserComentariosWidgetState();
}

class _CardUserComentariosWidgetState extends State<CardUserComentariosWidget> {
  late CardUserComentariosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardUserComentariosModel());

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
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
        child: Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            height: 80.0,
            constraints: const BoxConstraints(
              maxWidth: 700.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0x23677681),
              borderRadius: BorderRadius.circular(12.0),
              shape: BoxShape.rectangle,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'DetallesMiembros',
                            queryParameters: {
                              'idInversor': serializeParam(
                                widget.userRef,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Container(
                          width: 70.0,
                          height: 70.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            widget.imagen!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.userName,
                                  'Name',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.negocioNane,
                                  'BusinessName',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).secondaryText,
                        icon: Icon(
                          Icons.comment_outlined,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: ComentariosWidget(
                                  refVideoImagen: widget.videoRef!,
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ],
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

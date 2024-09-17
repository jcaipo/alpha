import '/components/header_widget.dart';
import '/components/languages_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'language_model.dart';
export 'language_model.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({super.key});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  late LanguageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguageModel());

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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          wrapWithModel(
            model: _model.headerModel,
            updateCallback: () => safeSetState(() {}),
            child: HeaderWidget(
              title: FFLocalizations.of(context).getText(
                'i254bb74' /* Cambiar idioma */,
              ),
              showBackButton: true,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'nc2viugc' /* Cambiar idioma */,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setAppLanguage(context, 'en');
                            },
                            child: wrapWithModel(
                              model: _model.enModel,
                              updateCallback: () => safeSetState(() {}),
                              child: LanguagesItemWidget(
                                text: 'English (US)',
                                currentLanguage:
                                    FFLocalizations.of(context).languageCode ==
                                        'en',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setAppLanguage(context, 'es');
                            },
                            child: wrapWithModel(
                              model: _model.esModel,
                              updateCallback: () => safeSetState(() {}),
                              child: LanguagesItemWidget(
                                text: 'Spanish (ES)',
                                currentLanguage:
                                    FFLocalizations.of(context).languageCode ==
                                        'es',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setAppLanguage(context, 'de');
                            },
                            child: wrapWithModel(
                              model: _model.deModel,
                              updateCallback: () => safeSetState(() {}),
                              child: LanguagesItemWidget(
                                text: 'German (DE)',
                                currentLanguage:
                                    FFLocalizations.of(context).languageCode ==
                                        'de',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setAppLanguage(context, 'fr');
                            },
                            child: wrapWithModel(
                              model: _model.frModel,
                              updateCallback: () => safeSetState(() {}),
                              child: LanguagesItemWidget(
                                text: 'Frensh (FR)',
                                currentLanguage:
                                    FFLocalizations.of(context).languageCode ==
                                        'fr',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setAppLanguage(context, 'it');
                            },
                            child: wrapWithModel(
                              model: _model.itModel,
                              updateCallback: () => safeSetState(() {}),
                              child: LanguagesItemWidget(
                                text: 'Italian (IT)',
                                currentLanguage:
                                    FFLocalizations.of(context).languageCode ==
                                        'it',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setAppLanguage(context, 'pt');
                            },
                            child: wrapWithModel(
                              model: _model.poModel,
                              updateCallback: () => safeSetState(() {}),
                              child: LanguagesItemWidget(
                                text: 'Portugese (PO)',
                                currentLanguage:
                                    FFLocalizations.of(context).languageCode ==
                                        'po',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setAppLanguage(context, 'ja');
                            },
                            child: wrapWithModel(
                              model: _model.jaModel,
                              updateCallback: () => safeSetState(() {}),
                              child: LanguagesItemWidget(
                                text: 'Japanese (JA)',
                                currentLanguage:
                                    FFLocalizations.of(context).languageCode ==
                                        'ja',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setAppLanguage(context, 'ar');
                            },
                            child: wrapWithModel(
                              model: _model.arModel,
                              updateCallback: () => safeSetState(() {}),
                              child: LanguagesItemWidget(
                                text: 'Arabic (AR)',
                                currentLanguage:
                                    FFLocalizations.of(context).languageCode ==
                                        'ar',
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ),
              ]
                  .divide(const SizedBox(height: 24.0))
                  .addToStart(const SizedBox(height: 24.0))
                  .addToEnd(const SizedBox(height: 24.0)),
            ),
          ),
        ],
      ),
    );
  }
}
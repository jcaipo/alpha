import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'edit_profile_component_model.dart';
export 'edit_profile_component_model.dart';

class EditProfileComponentWidget extends StatefulWidget {
  const EditProfileComponentWidget({
    super.key,
    String? title,
    String? confirmButtonText,
    required this.navigateAction,
  })  : title = title ?? 'Edit Profile',
        confirmButtonText = confirmButtonText ?? 'Save Changes';

  final String title;
  final String confirmButtonText;
  final Future Function()? navigateAction;

  @override
  State<EditProfileComponentWidget> createState() =>
      _EditProfileComponentWidgetState();
}

class _EditProfileComponentWidgetState
    extends State<EditProfileComponentWidget> {
  late EditProfileComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileComponentModel());

    _model.yourNameTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.yourNameFocusNode ??= FocusNode();

    _model.yourNameBusinessTextController ??= TextEditingController();
    _model.yourNameBusinessFocusNode ??= FocusNode();

    _model.yourNumberBusinessTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      currentPhoneNumber,
      'Telefono',
    ));
    _model.yourNumberBusinessFocusNode ??= FocusNode();

    _model.myBioTextController ??= TextEditingController();
    _model.myBioFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.yourNameBusinessTextController?.text =
              FFLocalizations.of(context).getText(
            'p2wnkf1z' /* Your Name Business */,
          );
          _model.myBioTextController?.text =
              FFLocalizations.of(context).getText(
            'kld83ii5' /* [bio] */,
          );
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 800.0,
        ),
        decoration: const BoxDecoration(),
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                child: Text(
                  widget.title,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Sora',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent1,
                      borderRadius: BorderRadius.circular(12.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: const Duration(milliseconds: 200),
                                  fadeOutDuration: const Duration(milliseconds: 200),
                                  imageUrl: valueOrDefault<String>(
                                    currentUserPhoto,
                                    'https://images.unsplash.com/photo-1499887142886-791eca5918cd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxN3x8dXNlcnxlbnwwfHx8fDE2OTc4MjQ2MjZ8MA&ixlib=rb-4.0.3&q=80&w=400',
                                  ),
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: const Duration(milliseconds: 200),
                                  fadeOutDuration: const Duration(milliseconds: 200),
                                  imageUrl: _model.uploadedFileUrl,
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 32.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final selectedMedia = await selectMedia(
                        mediaSource: MediaSource.photoGallery,
                        multiImage: false,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        safeSetState(() => _model.isDataUploading = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        var downloadUrls = <String>[];
                        try {
                          showUploadMessage(
                            context,
                            FFLocalizations.of(context).getText(
                              'nra9vgw0' /* Cargando el archivo... */,
                            ),
                            showLoading: true,
                          );
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                  ))
                              .toList();

                          downloadUrls = (await Future.wait(
                            selectedMedia.map(
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          _model.isDataUploading = false;
                        }
                        if (selectedUploadedFiles.length ==
                                selectedMedia.length &&
                            downloadUrls.length == selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFile =
                                selectedUploadedFiles.first;
                            _model.uploadedFileUrl = downloadUrls.first;
                          });
                          showUploadMessage(
                              context,
                              FFLocalizations.of(context).getText(
                                'pnd5gw85' /* Exito */,
                              ));
                        } else {
                          safeSetState(() {});
                          showUploadMessage(
                              context,
                              FFLocalizations.of(context).getText(
                                '6dv9i6ph' /* Error al cargar datos */,
                              ));
                          return;
                        }
                      }
                    },
                    text: FFLocalizations.of(context).getText(
                      '0ndwxwme' /* Cambiar foto */,
                    ),
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      elevation: 1.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                child: AuthUserStreamWidget(
                  builder: (context) => TextFormField(
                    controller: _model.yourNameTextController,
                    focusNode: _model.yourNameFocusNode,
                    autofillHints: const [AutofillHints.name],
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'gmwdgai4' /* Nombre completo */,
                      ),
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        'ycj9vf6t' /* Tu nombre completo... */,
                      ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      errorStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).error,
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
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    validator: _model.yourNameTextControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                child: TextFormField(
                  controller: _model.yourNameBusinessTextController,
                  focusNode: _model.yourNameBusinessFocusNode,
                  autofillHints: const [AutofillHints.name],
                  textCapitalization: TextCapitalization.words,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      'l40g2o2w' /* Nombre del negocio */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    hintText: FFLocalizations.of(context).getText(
                      'rst8ns6v' /* El Nombre del negocio... */,
                    ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    errorStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).error,
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
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primary,
                  validator: _model.yourNameBusinessTextControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                child: AuthUserStreamWidget(
                  builder: (context) => TextFormField(
                    controller: _model.yourNumberBusinessTextController,
                    focusNode: _model.yourNumberBusinessFocusNode,
                    autofillHints: const [AutofillHints.name],
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'rp1hes4q' /* Numero de teléfono */,
                      ),
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        't2z0bq3o' /* Tu Numero de teléfono... */,
                      ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      errorStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).error,
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
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    keyboardType: TextInputType.phone,
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    validator: _model.yourNumberBusinessTextControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(null),
                  options: [
                    FFLocalizations.of(context).getText(
                      'cqs14uxb' /* Propietario/Fundador */,
                    ),
                    FFLocalizations.of(context).getText(
                      'wsvfjfy7' /* Director */,
                    ),
                    FFLocalizations.of(context).getText(
                      '6w3e2355' /* Gerente */,
                    ),
                    FFLocalizations.of(context).getText(
                      'm7jyx3gt' /* Gerente medio */,
                    ),
                    FFLocalizations.of(context).getText(
                      'xhyu9acv' /* Empleado */,
                    )
                  ],
                  onChanged: (val) =>
                      safeSetState(() => _model.dropDownValue = val),
                  width: double.infinity,
                  height: 60.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'c6vqzmua' /* Tu Rol */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                child: TextFormField(
                  controller: _model.myBioTextController,
                  focusNode: _model.myBioFocusNode,
                  textCapitalization: TextCapitalization.sentences,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      'ulncaqo3' /* Descripción corta */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    hintText: FFLocalizations.of(context).getText(
                      'pwmv9u1p' /* Un poco sobre ti... */,
                    ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    errorStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).error,
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
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  cursorColor: FlutterFlowTheme.of(context).primary,
                  validator:
                      _model.myBioTextControllerValidator.asValidator(context),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            valueOrDefault<String>(
                              _model.placePickerValue.address,
                              '0',
                            ),
                            maxLines: 3,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          FlutterFlowPlacePicker(
                            iOSGoogleMapsApiKey:
                                'AIzaSyAFbQ4I1a8wjq68JVrVEzPaqEgCFcoEIbU',
                            androidGoogleMapsApiKey:
                                'AIzaSyA5WIZdRuMGE-XxkzwvABL-7mOQatD9V30',
                            webGoogleMapsApiKey:
                                'AIzaSyCEFCqLL7qgr1U0U_0jwKfqF3JtxgQaWM4',
                            onSelect: (place) async {
                              safeSetState(
                                  () => _model.placePickerValue = place);
                            },
                            defaultText: FFLocalizations.of(context).getText(
                              'bn3qps0i' /* Ubicación */,
                            ),
                            icon: Icon(
                              Icons.place,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 16.0,
                            ),
                            buttonOptions: FFButtonOptions(
                              width: 200.0,
                              height: 40.0,
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 2.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      // updateUserInfo

                      await currentUserReference!.update(createUsersRecordData(
                        displayName: _model.yourNameTextController.text,
                        photoUrl: _model.uploadedFileUrl != ''
                            ? _model.uploadedFileUrl
                            : valueOrDefault<String>(
                                currentUserPhoto,
                                'https://images.unsplash.com/photo-1499887142886-791eca5918cd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxN3x8dXNlcnxlbnwwfHx8fDE2OTc4MjQ2MjZ8MA&ixlib=rb-4.0.3&q=80&w=400',
                              ),
                        shortDescription: _model.myBioTextController.text,
                        lastActiveTime: getCurrentTimestamp,
                        role: _model.dropDownValue,
                        blurHashPhoto: _model.uploadedFileUrl,
                        phoneNumber:
                            _model.yourNumberBusinessTextController.text,
                        businessName:
                            _model.yourNameBusinessTextController.text,
                        direccion: _model.placePickerValue.address,
                        location: _model.placePickerValue.latLng,
                        city: _model.placePickerValue.city,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Profile has been updated!',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                      await widget.navigateAction?.call();
                    },
                    text: widget.confirmButtonText,
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/mapa_message_bottom_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'map_location_model.dart';
export 'map_location_model.dart';

class MapLocationWidget extends StatefulWidget {
  const MapLocationWidget({super.key});

  @override
  State<MapLocationWidget> createState() => _MapLocationWidgetState();
}

class _MapLocationWidgetState extends State<MapLocationWidget> {
  late MapLocationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapLocationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!_model.mapLoaded!) {
        var confirmDialogResponse = await showDialog<bool>(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: const Text('Atención!!'),
                  content: const Text(
                      'La aplicación necesita permisos de ubicación para mostrar el mapa. Por favor, habilita los permisos en la configuración del dispositivo.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext, false),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext, true),
                      child: const Text('Confirmar'),
                    ),
                  ],
                );
              },
            ) ??
            false;
      }
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return StreamBuilder<List<EventosRecord>>(
      stream: queryEventosRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<EventosRecord> mapLocationEventosRecordList = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(
                    queryBuilder: (usersRecord) => usersRecord.where(
                      'uid',
                      isEqualTo: currentUserUid,
                    ),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<UsersRecord> containerUsersRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerUsersRecord =
                        containerUsersRecordList.isNotEmpty
                            ? containerUsersRecordList.first
                            : null;

                    return Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Stack(
                              children: [
                                FlutterFlowGoogleMap(
                                  controller: _model.googleMapsController,
                                  onCameraIdle: (latLng) => safeSetState(
                                      () => _model.googleMapsCenter = latLng),
                                  initialLocation: _model.googleMapsCenter ??=
                                      currentUserLocationValue!,
                                  markers: mapLocationEventosRecordList
                                      .map(
                                        (marker) => FlutterFlowMarker(
                                          marker.reference.path,
                                          marker.locationEvento!,
                                          () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      MapaMessageBottomWidget(
                                                    ubicacionParametro: marker,
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                      )
                                      .toList(),
                                  markerColor: GoogleMarkerColor.red,
                                  mapType: MapType.normal,
                                  style: GoogleMapStyle.standard,
                                  initialZoom: 16.0,
                                  allowInteraction: true,
                                  allowZoom: false,
                                  showZoomControls: false,
                                  showLocation: true,
                                  showCompass: false,
                                  showMapToolbar: false,
                                  showTraffic: false,
                                  centerMapOnMarkerTap: true,
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: PointerInterceptor(
                                    intercepting: isWeb,
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 700.0,
                                      ),
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 60.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 50.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              icon: Icon(
                                                Icons.search_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 30.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              elevation: 3.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              child: Container(
                                                width: 250.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                10.0,
                                                                20.0,
                                                                10.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '8u445t4d' /* Chicago */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 50.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              icon: Icon(
                                                Icons.settings_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 30.0,
                                              ),
                                              onPressed: () async {
                                                context.safePop();
                                              },
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 50.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      icon: Icon(
                                        Icons.search,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1634926878768-2a5b3c42f139?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMXx8YXZhdGFyfGVufDB8fHx8MTcyMDYxNjQ5Nnww&ixlib=rb-4.0.3&q=80&w=1080',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1634896941598-b6b500a502a7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMXx8YXZhdGFyfGVufDB8fHx8MTcyMDYxNjQ5Nnww&ixlib=rb-4.0.3&q=80&w=1080',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1640951613773-54706e06851d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMnx8YXZhdGFyfGVufDB8fHx8MTcyMDYxNjQ5Nnww&ixlib=rb-4.0.3&q=80&w=1080',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1608889175123-8ee362201f81?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxOXx8YXZhdGFyfGVufDB8fHx8MTcyMDYxNjQ5Nnww&ixlib=rb-4.0.3&q=80&w=1080',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1640960543409-dbe56ccc30e2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyM3x8YXZhdGFyfGVufDB8fHx8MTcyMDYxNjQ5Nnww&ixlib=rb-4.0.3&q=80&w=1080',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(width: 12.0))
                                      .addToStart(const SizedBox(width: 10.0))
                                      .addToEnd(const SizedBox(width: 10.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              ))
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.navBar1Model,
                        updateCallback: () => safeSetState(() {}),
                        child: const NavBar1Widget(),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

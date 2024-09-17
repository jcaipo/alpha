import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'on_board_complete_modal_model.dart';
export 'on_board_complete_modal_model.dart';

class OnBoardCompleteModalWidget extends StatefulWidget {
  const OnBoardCompleteModalWidget({super.key});

  @override
  State<OnBoardCompleteModalWidget> createState() =>
      _OnBoardCompleteModalWidgetState();
}

class _OnBoardCompleteModalWidgetState
    extends State<OnBoardCompleteModalWidget> {
  late OnBoardCompleteModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnBoardCompleteModalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      Navigator.pop(context);

      context.goNamed('listviewHome');
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(44.0, 0.0, 44.0, 0.0),
            child: Container(
              width: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Lottie.network(
                      'https://lottie.host/437a7cc0-0f1f-474f-b6c8-1caf815d0d35/sw6My1udBb.json',
                      width: 150.0,
                      height: 130.0,
                      fit: BoxFit.cover,
                      animate: true,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '6t67tq7o' /* Felicitaciones! */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Sora',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '6wussefj' /* Su cuenta está lista para usar... */,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    wrapWithModel(
                      model: _model.loadingModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const LoadingWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

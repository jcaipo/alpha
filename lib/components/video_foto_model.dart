import '/flutter_flow/flutter_flow_util.dart';
import 'video_foto_widget.dart' show VideoFotoWidget;
import 'package:flutter/material.dart';

class VideoFotoModel extends FlutterFlowModel<VideoFotoWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

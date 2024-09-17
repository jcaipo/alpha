import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_SecondSecorityLayerConfig')) {
        try {
          final serializedData =
              prefs.getString('ff_SecondSecorityLayerConfig') ?? '{}';
          _SecondSecorityLayerConfig =
              SecondSecurityLayerStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _buscador = false;
  bool get buscador => _buscador;
  set buscador(bool value) {
    _buscador = value;
  }

  String _video = '';
  String get video => _video;
  set video(String value) {
    _video = value;
  }

  String _imagen = '';
  String get imagen => _imagen;
  set imagen(String value) {
    _imagen = value;
  }

  SecondSecurityLayerStruct _SecondSecorityLayerConfig =
      SecondSecurityLayerStruct.fromSerializableMap(
          jsonDecode('{\"enable\":\"true\"}'));
  SecondSecurityLayerStruct get SecondSecorityLayerConfig =>
      _SecondSecorityLayerConfig;
  set SecondSecorityLayerConfig(SecondSecurityLayerStruct value) {
    _SecondSecorityLayerConfig = value;
    prefs.setString('ff_SecondSecorityLayerConfig', value.serialize());
  }

  void updateSecondSecorityLayerConfigStruct(
      Function(SecondSecurityLayerStruct) updateFn) {
    updateFn(_SecondSecorityLayerConfig);
    prefs.setString(
        'ff_SecondSecorityLayerConfig', _SecondSecorityLayerConfig.serialize());
  }

  bool _secondSecurityMesureIsGuranteed = false;
  bool get secondSecurityMesureIsGuranteed => _secondSecurityMesureIsGuranteed;
  set secondSecurityMesureIsGuranteed(bool value) {
    _secondSecurityMesureIsGuranteed = value;
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

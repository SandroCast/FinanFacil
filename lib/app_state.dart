import 'package:flutter/material.dart';
import '/backend/sqlite/sqlite_manager.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _Flutuante = '';
  String get Flutuante => _Flutuante;
  set Flutuante(String _value) {
    _Flutuante = _value;
  }

  String _msgErro = '';
  String get msgErro => _msgErro;
  set msgErro(String _value) {
    _msgErro = _value;
  }
}

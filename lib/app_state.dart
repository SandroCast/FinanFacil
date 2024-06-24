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
  set Flutuante(String value) {
    _Flutuante = value;
  }

  int _abaCategoria = 0;
  int get abaCategoria => _abaCategoria;
  set abaCategoria(int value) {
    _abaCategoria = value;
  }

  String _campoObrigatorio = '';
  String get campoObrigatorio => _campoObrigatorio;
  set campoObrigatorio(String value) {
    _campoObrigatorio = value;
  }

  int _loop = 0;
  int get loop => _loop;
  set loop(int value) {
    _loop = value;
  }

  int _anoSelecionado = 2024;
  int get anoSelecionado => _anoSelecionado;
  set anoSelecionado(int value) {
    _anoSelecionado = value;
  }

  String _mesSelecionado = 'Janeiro';
  String get mesSelecionado => _mesSelecionado;
  set mesSelecionado(String value) {
    _mesSelecionado = value;
  }

  bool _saldoVisivel = false;
  bool get saldoVisivel => _saldoVisivel;
  set saldoVisivel(bool value) {
    _saldoVisivel = value;
  }
}

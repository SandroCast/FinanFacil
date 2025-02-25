import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'dbfinancas',
      'dbfinancas.db',
    );
  }

  /// START READ QUERY CALLS

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future criarNovoRegistro({
    String? descricao,
    int? idcategoria,
    double? valor,
    bool? fixo,
    String? tipotransacao,
    int? parcelas,
    DateTime? dtagendada,
    String? status,
  }) =>
      performCriarNovoRegistro(
        _database,
        descricao: descricao,
        idcategoria: idcategoria,
        valor: valor,
        fixo: fixo,
        tipotransacao: tipotransacao,
        parcelas: parcelas,
        dtagendada: dtagendada,
        status: status,
      );

  /// END UPDATE QUERY CALLS
}

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

  Future<List<BuscaCategoriasRow>> buscaCategorias() => performBuscaCategorias(
        _database,
      );

  Future<List<PesquisaTituloCategoriaRow>> pesquisaTituloCategoria({
    String? titulo,
  }) =>
      performPesquisaTituloCategoria(
        _database,
        titulo: titulo,
      );

  Future<List<BuscaLancamentoPorPeriodoRow>> buscaLancamentoPorPeriodo({
    DateTime? inicio,
    DateTime? fim,
  }) =>
      performBuscaLancamentoPorPeriodo(
        _database,
        inicio: inicio,
        fim: fim,
      );

  Future<List<BuscaLancamentosRow>> buscaLancamentos() =>
      performBuscaLancamentos(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future novoLancamento({
    String? descricao,
    int? idcategoria,
    double? valor,
    bool? fixo,
    String? tipotransacao,
    int? parcelas,
    DateTime? dtagendada,
    String? status,
    String? tipolancamento,
  }) =>
      performNovoLancamento(
        _database,
        descricao: descricao,
        idcategoria: idcategoria,
        valor: valor,
        fixo: fixo,
        tipotransacao: tipotransacao,
        parcelas: parcelas,
        dtagendada: dtagendada,
        status: status,
        tipolancamento: tipolancamento,
      );

  Future novaCategoria({
    String? titulo,
  }) =>
      performNovaCategoria(
        _database,
        titulo: titulo,
      );

  /// END UPDATE QUERY CALLS
}

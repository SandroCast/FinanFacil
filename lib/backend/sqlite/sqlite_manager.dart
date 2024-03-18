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

  Future<List<BuscaCategoriasRow>> buscaCategorias({
    String? tipo,
  }) =>
      performBuscaCategorias(
        _database,
        tipo: tipo,
      );

  Future<List<PesquisaTituloCategoriaRow>> pesquisaTituloCategoria({
    String? titulo,
    String? tipo,
  }) =>
      performPesquisaTituloCategoria(
        _database,
        titulo: titulo,
        tipo: tipo,
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

  Future<List<BuscaTodasAsCategoriasRow>> buscaTodasAsCategorias() =>
      performBuscaTodasAsCategorias(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future novoLancamento({
    String? descricao,
    int? idcategoria,
    double? valor,
    int? fixo,
    String? tipotransacao,
    int? parcela,
    DateTime? dtagendada,
    String? status,
    int? totalparcelas,
  }) =>
      performNovoLancamento(
        _database,
        descricao: descricao,
        idcategoria: idcategoria,
        valor: valor,
        fixo: fixo,
        tipotransacao: tipotransacao,
        parcela: parcela,
        dtagendada: dtagendada,
        status: status,
        totalparcelas: totalparcelas,
      );

  Future novaCategoria({
    String? titulo,
    String? tipo,
  }) =>
      performNovaCategoria(
        _database,
        titulo: titulo,
        tipo: tipo,
      );

  Future excluirCategoria({
    int? id,
  }) =>
      performExcluirCategoria(
        _database,
        id: id,
      );

  Future excluirLancamento({
    int? id,
  }) =>
      performExcluirLancamento(
        _database,
        id: id,
      );

  Future editarLancamento({
    String? descricao,
    int? idcategoria,
    double? valor,
    int? fixo,
    String? tipotransacao,
    int? parcela,
    DateTime? dtagendada,
    String? status,
    int? totalparcelas,
    int? id,
  }) =>
      performEditarLancamento(
        _database,
        descricao: descricao,
        idcategoria: idcategoria,
        valor: valor,
        fixo: fixo,
        tipotransacao: tipotransacao,
        parcela: parcela,
        dtagendada: dtagendada,
        status: status,
        totalparcelas: totalparcelas,
        id: id,
      );

  /// END UPDATE QUERY CALLS
}

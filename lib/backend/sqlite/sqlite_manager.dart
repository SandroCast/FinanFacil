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

  Future<List<BuscaLancamentosRow>> buscaLancamentos({
    String? ano,
    String? mes,
  }) =>
      performBuscaLancamentos(
        _database,
        ano: ano,
        mes: mes,
      );

  Future<List<BuscaTodasAsCategoriasRow>> buscaTodasAsCategorias() =>
      performBuscaTodasAsCategorias(
        _database,
      );

  Future<List<BuscaLancamentosPorIDParcelaFuturasRow>>
      buscaLancamentosPorIDParcelaFuturas({
    String? idparcela,
    int? parcela,
  }) =>
          performBuscaLancamentosPorIDParcelaFuturas(
            _database,
            idparcela: idparcela,
            parcela: parcela,
          );

  Future<List<BuscaLancamentosPorIDParcelaRow>> buscaLancamentosPorIDParcela({
    String? idparcela,
  }) =>
      performBuscaLancamentosPorIDParcela(
        _database,
        idparcela: idparcela,
      );

  Future<List<SaldoAtualRow>> saldoAtual() => performSaldoAtual(
        _database,
      );

  Future<List<SaldoPrevistoRow>> saldoPrevisto({
    DateTime? mesfim,
  }) =>
      performSaldoPrevisto(
        _database,
        mesfim: mesfim,
      );

  Future<List<LancamentosMesAtualRow>> lancamentosMesAtual({
    String? filtro,
  }) =>
      performLancamentosMesAtual(
        _database,
        filtro: filtro,
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
    String? idparcela,
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
        idparcela: idparcela,
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

  Future editarLancamentoPorIDLancamento({
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
    String? idparcela,
  }) =>
      performEditarLancamentoPorIDLancamento(
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
        idparcela: idparcela,
      );

  Future excluirLancamentoTodos({
    String? idparcela,
  }) =>
      performExcluirLancamentoTodos(
        _database,
        idparcela: idparcela,
      );

  Future excluirLancamentoFuturas({
    String? idparcela,
    DateTime? dtagendada,
  }) =>
      performExcluirLancamentoFuturas(
        _database,
        idparcela: idparcela,
        dtagendada: dtagendada,
      );

  Future comecarDoZero() => performComecarDoZero(
        _database,
      );

  Future alterarStatus({
    int? id,
    String? status,
  }) =>
      performAlterarStatus(
        _database,
        id: id,
        status: status,
      );

  /// END UPDATE QUERY CALLS
}

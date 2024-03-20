import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN BUSCACATEGORIAS
Future<List<BuscaCategoriasRow>> performBuscaCategorias(
  Database database, {
  String? tipo,
}) {
  final query = '''
select id, titulo from categorias
where tipo = '${tipo}';
''';
  return _readQuery(database, query, (d) => BuscaCategoriasRow(d));
}

class BuscaCategoriasRow extends SqliteRow {
  BuscaCategoriasRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get titulo => data['titulo'] as String?;
}

/// END BUSCACATEGORIAS

/// BEGIN PESQUISATITULOCATEGORIA
Future<List<PesquisaTituloCategoriaRow>> performPesquisaTituloCategoria(
  Database database, {
  String? titulo,
  String? tipo,
}) {
  final query = '''
select titulo from categorias where titulo = '${titulo}' and tipo = '${tipo}' LIMIT 1;
''';
  return _readQuery(database, query, (d) => PesquisaTituloCategoriaRow(d));
}

class PesquisaTituloCategoriaRow extends SqliteRow {
  PesquisaTituloCategoriaRow(Map<String, dynamic> data) : super(data);

  String? get titulo => data['titulo'] as String?;
}

/// END PESQUISATITULOCATEGORIA

/// BEGIN BUSCALANCAMENTOPORPERIODO
Future<List<BuscaLancamentoPorPeriodoRow>> performBuscaLancamentoPorPeriodo(
  Database database, {
  DateTime? inicio,
  DateTime? fim,
}) {
  final query = '''
select titulo, tipo, sum(valor) as valor from lancamentos
join categorias on id_categoria = categorias.id
where DATE(dt_agendada) BETWEEN DATE('${inicio}') AND DATE('${fim}')
group by titulo, tipo;
''';
  return _readQuery(database, query, (d) => BuscaLancamentoPorPeriodoRow(d));
}

class BuscaLancamentoPorPeriodoRow extends SqliteRow {
  BuscaLancamentoPorPeriodoRow(Map<String, dynamic> data) : super(data);

  String? get titulo => data['titulo'] as String?;
  double? get valor => data['valor'] as double?;
  String? get tipo => data['tipo'] as String?;
}

/// END BUSCALANCAMENTOPORPERIODO

/// BEGIN BUSCALANCAMENTOS
Future<List<BuscaLancamentosRow>> performBuscaLancamentos(
  Database database,
) {
  final query = '''
SELECT lancamentos.id, descricao, valor, fixo, tipo_transacao as avista, parcela, total_parcelas as totalparcelas, status, tipo, strftime('%d/%m/%Y', dt_agendada) AS dtagendada, id_parcela as idparcela FROM lancamentos
join categorias on lancamentos.id_categoria = categorias.id;
''';
  return _readQuery(database, query, (d) => BuscaLancamentosRow(d));
}

class BuscaLancamentosRow extends SqliteRow {
  BuscaLancamentosRow(Map<String, dynamic> data) : super(data);

  String? get descricao => data['descricao'] as String?;
  double? get valor => data['valor'] as double?;
  String? get status => data['status'] as String?;
  DateTime? get dtagendada => data['dtagendada'] as DateTime?;
  int? get id => data['id'] as int?;
  int get fixo => data['fixo'] as int;
  String? get avista => data['avista'] as String?;
  int? get parcela => data['parcela'] as int?;
  String? get tipo => data['tipo'] as String?;
  int? get totalparcelas => data['totalparcelas'] as int?;
  String? get idparcela => data['idparcela'] as String?;
}

/// END BUSCALANCAMENTOS

/// BEGIN BUSCATODASASCATEGORIAS
Future<List<BuscaTodasAsCategoriasRow>> performBuscaTodasAsCategorias(
  Database database,
) {
  final query = '''
select id, titulo, tipo from categorias where titulo is not 'SEM CATEGORIA';
''';
  return _readQuery(database, query, (d) => BuscaTodasAsCategoriasRow(d));
}

class BuscaTodasAsCategoriasRow extends SqliteRow {
  BuscaTodasAsCategoriasRow(Map<String, dynamic> data) : super(data);

  String? get titulo => data['titulo'] as String?;
  String? get tipo => data['tipo'] as String?;
  int? get id => data['id'] as int?;
}

/// END BUSCATODASASCATEGORIAS

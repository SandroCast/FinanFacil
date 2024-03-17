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
  Database database,
) {
  final query = '''
select id, titulo from categorias;
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
}) {
  final query = '''
select titulo from categorias where titulo = '${titulo}' LIMIT 1;
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
select titulo, sum(valor) as valor from lancamentos
join categorias on id_categoria = lancamentos.id
where dt_agendada BETWEEN '${inicio}' AND '${fim}'
group by titulo;
''';
  return _readQuery(database, query, (d) => BuscaLancamentoPorPeriodoRow(d));
}

class BuscaLancamentoPorPeriodoRow extends SqliteRow {
  BuscaLancamentoPorPeriodoRow(Map<String, dynamic> data) : super(data);

  String? get titulo => data['titulo'] as String?;
  double? get valor => data['valor'] as double?;
}

/// END BUSCALANCAMENTOPORPERIODO

/// BEGIN BUSCALANCAMENTOS
Future<List<BuscaLancamentosRow>> performBuscaLancamentos(
  Database database,
) {
  final query = '''
select id, descricao, valor, status, dt_agendada  from lancamentos;
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
}

/// END BUSCALANCAMENTOS

/// BEGIN CONTACATEGORIAS
Future<List<ContaCategoriasRow>> performContaCategorias(
  Database database,
) {
  final query = '''
select count(*) as qtdecateg from categorias;
''';
  return _readQuery(database, query, (d) => ContaCategoriasRow(d));
}

class ContaCategoriasRow extends SqliteRow {
  ContaCategoriasRow(Map<String, dynamic> data) : super(data);

  int? get qtdecateg => data['qtdecateg'] as int?;
}

/// END CONTACATEGORIAS

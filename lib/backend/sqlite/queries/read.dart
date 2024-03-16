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

import 'package:sqflite/sqflite.dart';

/// BEGIN NOVOLANCAMENTO
Future performNovoLancamento(
  Database database, {
  String? descricao,
  int? idcategoria,
  double? valor,
  bool? fixo,
  String? tipotransacao,
  int? parcela,
  DateTime? dtagendada,
  String? status,
  int? totalparcelas,
}) {
  final query = '''
INSERT INTO lancamentos (descricao, id_categoria, valor, fixo, tipo_transacao, parcela, dt_agendada, status, total_parcelas)
VALUES ('${descricao}',  ${idcategoria}, ${valor}, ${fixo}, '${tipotransacao}', ${parcela}, '${dtagendada}', '${status}', ${totalparcelas});
''';
  return database.rawQuery(query);
}

/// END NOVOLANCAMENTO

/// BEGIN NOVACATEGORIA
Future performNovaCategoria(
  Database database, {
  String? titulo,
  String? tipo,
}) {
  final query = '''
INSERT INTO categorias(titulo, tipo) VALUES('${titulo}', '${tipo}');
''';
  return database.rawQuery(query);
}

/// END NOVACATEGORIA

/// BEGIN EXCLUIRCATEGORIA
Future performExcluirCategoria(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM categorias
WHERE id = ${id};
''';
  return database.rawQuery(query);
}

/// END EXCLUIRCATEGORIA

/// BEGIN EXCLUIRLANCAMENTO
Future performExcluirLancamento(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM lancamentos
WHERE id = ${id};
''';
  return database.rawQuery(query);
}

/// END EXCLUIRLANCAMENTO

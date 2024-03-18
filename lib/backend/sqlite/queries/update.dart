import 'package:sqflite/sqflite.dart';

/// BEGIN NOVOLANCAMENTO
Future performNovoLancamento(
  Database database, {
  String? descricao,
  int? idcategoria,
  double? valor,
  bool? fixo,
  String? tipotransacao,
  int? parcelas,
  DateTime? dtagendada,
  String? status,
}) {
  final query = '''
INSERT INTO lancamentos (descricao, id_categoria, valor, fixo, tipo_transacao, parcela, dt_agendada, status)
VALUES ('${descricao}',  ${idcategoria}, ${valor}, ${fixo}, '${tipotransacao}', '${parcelas}', '${dtagendada}', '${status}');
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

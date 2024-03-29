import 'package:sqflite/sqflite.dart';

/// BEGIN NOVOLANCAMENTO
Future performNovoLancamento(
  Database database, {
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
}) {
  final query = '''
INSERT INTO lancamentos (descricao, id_categoria, valor, fixo, tipo_transacao, parcela, dt_agendada, status, total_parcelas, id_parcela)
VALUES ('${descricao}',  ${idcategoria}, ${valor}, ${fixo}, '${tipotransacao}', ${parcela}, '${dtagendada}', '${status}', ${totalparcelas}, '${idparcela}');
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

/// BEGIN EDITARLANCAMENTOPORIDLANCAMENTO
Future performEditarLancamentoPorIDLancamento(
  Database database, {
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
}) {
  final query = '''
UPDATE lancamentos
SET descricao = '${descricao}', id_categoria =  ${idcategoria}, valor = ${valor}, fixo = ${fixo}, tipo_transacao = '${tipotransacao}',
parcela = ${parcela}, dt_agendada = '${dtagendada}', status = '${status}', total_parcelas = ${totalparcelas}, id_parcela = '${idparcela}'
WHERE id = ${id};

''';
  return database.rawQuery(query);
}

/// END EDITARLANCAMENTOPORIDLANCAMENTO

/// BEGIN EXCLUIRLANCAMENTOTODOS
Future performExcluirLancamentoTodos(
  Database database, {
  String? idparcela,
}) {
  final query = '''
DELETE FROM lancamentos
WHERE id > 0 and id_parcela = '${idparcela}';
''';
  return database.rawQuery(query);
}

/// END EXCLUIRLANCAMENTOTODOS

/// BEGIN EXCLUIRLANCAMENTOFUTURAS
Future performExcluirLancamentoFuturas(
  Database database, {
  String? idparcela,
  DateTime? dtagendada,
}) {
  final query = '''
DELETE FROM lancamentos
WHERE id > 0 and id_parcela = '${idparcela}' and dt_agendada >= '${dtagendada}';
''';
  return database.rawQuery(query);
}

/// END EXCLUIRLANCAMENTOFUTURAS

/// BEGIN COMECARDOZERO
Future performComecarDoZero(
  Database database,
) {
  final query = '''
DELETE FROM lancamentos;
''';
  return database.rawQuery(query);
}

/// END COMECARDOZERO

/// BEGIN ALTERARSTATUS
Future performAlterarStatus(
  Database database, {
  int? id,
  String? status,
}) {
  final query = '''
UPDATE lancamentos
SET status = '${status}'
WHERE id = ${id};
''';
  return database.rawQuery(query);
}

/// END ALTERARSTATUS

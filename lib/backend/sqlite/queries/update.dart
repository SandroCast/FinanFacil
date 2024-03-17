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
  String? tipolancamento,
}) {
  final query = '''
INSERT INTO lancamentos (descricao, id_categoria, valor, fixo, tipo_transacao, parcelas, dt_agendada, status, tipo_lancamento)
VALUES ('${descricao}',  ${idcategoria}, ${valor}, ${fixo}, '${tipotransacao}', ${parcelas}, '${dtagendada}', '${status}', '${tipolancamento}');
''';
  return database.rawQuery(query);
}

/// END NOVOLANCAMENTO

/// BEGIN NOVACATEGORIA
Future performNovaCategoria(
  Database database, {
  String? titulo,
}) {
  final query = '''
INSERT INTO categorias(titulo) VALUES('${titulo}');
''';
  return database.rawQuery(query);
}

/// END NOVACATEGORIA

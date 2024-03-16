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
INSERT INTO lancamentos (descricao, id_categoria, valor, fixo, tipo_transacao, parcelas, dt_agendada, status)
VALUES ('${descricao}',  ${idcategoria}, ${valor}, ${fixo}, '${tipotransacao}', ${parcelas}, '${dtagendada}', '${status}');
''';
  return database.rawQuery(query);
}

/// END NOVOLANCAMENTO

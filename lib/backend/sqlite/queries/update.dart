import 'package:sqflite/sqflite.dart';

/// BEGIN CRIAR NOVO REGISTRO
Future performCriarNovoRegistro(
  Database database, {
  String? descricao,
  String? categoria,
  double? valor,
  bool? fixo,
  String? tipotransacao,
  int? parcelas,
  DateTime? dtagendada,
  String? status,
}) {
  final query = '''
INSERT INTO lancamentos (descricao, categoria, valor, fixo, tipo_transacao, parcelas, dt_agendada, status)
VALUES ('${descricao}',  '${categoria}', ${valor}, ${fixo}, '${tipotransacao}', ${parcelas}, '${dtagendada}', '${status}');
''';
  return database.rawQuery(query);
}

/// END CRIAR NOVO REGISTRO

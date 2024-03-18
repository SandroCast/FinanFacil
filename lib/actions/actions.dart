import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future novoLancamento(
  BuildContext context, {
  required String? descricao,
  required int? idcategoria,
  required double? valor,
  required String? tipo,
  required int? fixo,
  required String? tipotransacao,
  required int? parcela,
  required DateTime? dtagendada,
  required String? status,
  required int? totalparcelas,
}) async {
  await SQLiteManager.instance.novoLancamento(
    descricao: descricao!,
    idcategoria: idcategoria!,
    valor: tipo == 'Receita' ? valor! : (-(valor!)),
    fixo: fixo!,
    tipotransacao: tipotransacao,
    parcela: parcela,
    dtagendada: dtagendada!,
    status: status!,
    totalparcelas: totalparcelas,
  );
}

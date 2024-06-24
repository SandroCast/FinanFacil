import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'editar_lancamento_parcelado_widget.dart'
    show EditarLancamentoParceladoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarLancamentoParceladoModel
    extends FlutterFlowModel<EditarLancamentoParceladoWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - SQLite (buscaLancamentosPorIDParcelaFuturas)] action in Button widget.
  List<BuscaLancamentosPorIDParcelaFuturasRow>? retornoLancamentos;
  // Stores action output result for [Backend Call - SQLite (buscaLancamentosPorIDParcela)] action in Button widget.
  List<BuscaLancamentosPorIDParcelaRow>? retornoLancamentosIdParcela;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

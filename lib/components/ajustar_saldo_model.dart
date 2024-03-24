import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'ajustar_saldo_widget.dart' show AjustarSaldoWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AjustarSaldoModel extends FlutterFlowModel<AjustarSaldoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for saldoVisivel widget.
  FocusNode? saldoVisivelFocusNode;
  TextEditingController? saldoVisivelController;
  String? Function(BuildContext, String?)? saldoVisivelControllerValidator;
  // State field(s) for saldoDigitado widget.
  FocusNode? saldoDigitadoFocusNode;
  TextEditingController? saldoDigitadoController;
  String? Function(BuildContext, String?)? saldoDigitadoControllerValidator;
  // Stores action output result for [Custom Action - calcularAjusteSaldo] action in Button widget.
  double? retornoAjuste;
  // Stores action output result for [Custom Action - geraUnicoID] action in Button widget.
  String? iDUnicoGerado;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    saldoVisivelFocusNode?.dispose();
    saldoVisivelController?.dispose();

    saldoDigitadoFocusNode?.dispose();
    saldoDigitadoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

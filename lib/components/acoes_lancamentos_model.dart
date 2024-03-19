import '/backend/sqlite/sqlite_manager.dart';
import '/components/acoes_categorias_widget.dart';
import '/components/deletar_lancamento_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'acoes_lancamentos_widget.dart' show AcoesLancamentosWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AcoesLancamentosModel extends FlutterFlowModel<AcoesLancamentosWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for descricao widget.
  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoController;
  String? Function(BuildContext, String?)? descricaoControllerValidator;
  // State field(s) for categoria widget.
  int? categoriaValue;
  FormFieldController<int>? categoriaValueController;
  // State field(s) for precoVisivel widget.
  FocusNode? precoVisivelFocusNode;
  TextEditingController? precoVisivelController;
  String? Function(BuildContext, String?)? precoVisivelControllerValidator;
  // State field(s) for precoDigitado widget.
  FocusNode? precoDigitadoFocusNode;
  TextEditingController? precoDigitadoController;
  String? Function(BuildContext, String?)? precoDigitadoControllerValidator;
  // State field(s) for fixo widget.
  bool? fixoValue;
  // State field(s) for avista widget.
  String? avistaValue;
  FormFieldController<String>? avistaValueController;
  // State field(s) for parcelas widget.
  FocusNode? parcelasFocusNode;
  TextEditingController? parcelasController;
  String? Function(BuildContext, String?)? parcelasControllerValidator;
  // State field(s) for data widget.
  FocusNode? dataFocusNode;
  TextEditingController? dataController;
  final dataMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dataControllerValidator;
  DateTime? datePicked;
  // State field(s) for statusDespesa widget.
  String? statusDespesaValue;
  FormFieldController<String>? statusDespesaValueController;
  // State field(s) for statusReceita widget.
  String? statusReceitaValue;
  FormFieldController<String>? statusReceitaValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descricaoFocusNode?.dispose();
    descricaoController?.dispose();

    precoVisivelFocusNode?.dispose();
    precoVisivelController?.dispose();

    precoDigitadoFocusNode?.dispose();
    precoDigitadoController?.dispose();

    parcelasFocusNode?.dispose();
    parcelasController?.dispose();

    dataFocusNode?.dispose();
    dataController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'acoes_transacoes_widget.dart' show AcoesTransacoesWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AcoesTransacoesModel extends FlutterFlowModel<AcoesTransacoesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for descricao widget.
  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoController;
  String? Function(BuildContext, String?)? descricaoControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for SwitchListFixo widget.
  bool? switchListFixoValue;
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
  // State field(s) for statusReceita widget.
  String? statusReceitaValue;
  FormFieldController<String>? statusReceitaValueController;
  // State field(s) for statusDespesa widget.
  String? statusDespesaValue;
  FormFieldController<String>? statusDespesaValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descricaoFocusNode?.dispose();
    descricaoController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    parcelasFocusNode?.dispose();
    parcelasController?.dispose();

    dataFocusNode?.dispose();
    dataController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'acoes_transacoes_widget.dart' show AcoesTransacoesWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
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
  // State field(s) for status widget.
  String? statusValue;
  FormFieldController<String>? statusValueController;

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

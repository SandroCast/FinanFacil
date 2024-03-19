import '/backend/sqlite/sqlite_manager.dart';
import '/components/deletar_categoria_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'acoes_categorias_widget.dart' show AcoesCategoriasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AcoesCategoriasModel extends FlutterFlowModel<AcoesCategoriasWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for tipo widget.
  String? tipoValue;
  FormFieldController<String>? tipoValueController;
  // State field(s) for categoria widget.
  FocusNode? categoriaFocusNode;
  TextEditingController? categoriaController;
  String? Function(BuildContext, String?)? categoriaControllerValidator;
  // Stores action output result for [Backend Call - SQLite (pesquisaTituloCategoria)] action in Button widget.
  List<PesquisaTituloCategoriaRow>? retornoVarificaCategoria;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    categoriaFocusNode?.dispose();
    categoriaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

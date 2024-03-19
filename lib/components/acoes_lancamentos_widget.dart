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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'acoes_lancamentos_model.dart';
export 'acoes_lancamentos_model.dart';

class AcoesLancamentosWidget extends StatefulWidget {
  const AcoesLancamentosWidget({
    super.key,
    required this.tipo,
    this.lancamento,
    required this.ativo,
  });

  final String? tipo;
  final BuscaLancamentosRow? lancamento;
  final int? ativo;

  @override
  State<AcoesLancamentosWidget> createState() => _AcoesLancamentosWidgetState();
}

class _AcoesLancamentosWidgetState extends State<AcoesLancamentosWidget>
    with TickerProviderStateMixin {
  late AcoesLancamentosModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcoesLancamentosModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().campoObrigatorio = '';
      });
    });

    _model.descricaoController ??=
        TextEditingController(text: widget.lancamento?.descricao);
    _model.descricaoFocusNode ??= FocusNode();

    _model.precoVisivelController ??= TextEditingController(
        text: formatNumber(
      (widget.lancamento!.valor!),
      formatType: FormatType.custom,
      currency: 'R\$ ',
      format: ',##0.00#',
      locale: 'pt_br',
    ));
    _model.precoVisivelFocusNode ??= FocusNode();

    _model.precoDigitadoController ??= TextEditingController(
        text: widget.lancamento?.valor != null
            ? functions
                .converterDoubleParaInt((widget.lancamento!.valor!))
                .toString()
            : '0');
    _model.precoDigitadoFocusNode ??= FocusNode();
    _model.precoDigitadoFocusNode!.addListener(() => setState(() {}));
    _model.parcelasController ??= TextEditingController(
        text: widget.lancamento?.totalparcelas?.toString());
    _model.parcelasFocusNode ??= FocusNode();

    _model.dataController ??=
        TextEditingController(text: widget.lancamento?.dtagendada);
    _model.dataFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 20.0),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Container(
                        width: 50.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.tipo!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: widget.tipo == 'Receita'
                                        ? Color(0xFF00B048)
                                        : Color(0xFFFD0101),
                                    fontSize: 30.0,
                                  ),
                            ),
                            if (widget.lancamento != null)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: DeletarLancamentoWidget(
                                          lancamento: widget.lancamento!,
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Icon(
                                  Icons.delete_forever,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 35.0,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _model.descricaoController,
                              focusNode: _model.descricaoFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Descrição',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.descricaoControllerValidator
                                  .asValidator(context),
                            ),
                            if (FFAppState().campoObrigatorio == 'descricao')
                              Text(
                                'Campo Obrigatório',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 14.0,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child:
                                      FutureBuilder<List<BuscaCategoriasRow>>(
                                    future:
                                        SQLiteManager.instance.buscaCategorias(
                                      tipo: widget.tipo,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final containerBuscaCategoriasRowList =
                                          snapshot.data!;
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: FlutterFlowDropDown<int>(
                                          controller: _model
                                                  .categoriaValueController ??=
                                              FormFieldController<int>(
                                            _model.categoriaValue ??=
                                                widget.lancamento?.id,
                                          ),
                                          options: List<int>.from(
                                              containerBuscaCategoriasRowList
                                                  .map((e) => e.id)
                                                  .withoutNulls
                                                  .toList()),
                                          optionLabels:
                                              containerBuscaCategoriasRowList
                                                  .map((e) => e.titulo)
                                                  .withoutNulls
                                                  .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.categoriaValue = val),
                                          width: double.infinity,
                                          height: 50.0,
                                          searchHintTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          searchTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          hintText: 'Categoria...',
                                          searchHintText:
                                              'Pesquise a categoria...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: true,
                                          isMultiSelect: false,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: AcoesCategoriasWidget(
                                              aba: 2,
                                              tipo: widget.tipo,
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Icon(
                                      Icons.add_circle,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (FFAppState().campoObrigatorio == 'categoria')
                              Text(
                                'Campo Obrigatório',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).error,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50.0,
                                    child: Stack(
                                      children: [
                                        TextFormField(
                                          controller:
                                              _model.precoVisivelController,
                                          focusNode:
                                              _model.precoVisivelFocusNode,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Valor',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 14.0,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Color(0xFF95A1AC),
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    (_model.precoDigitadoFocusNode
                                                                    ?.hasFocus ??
                                                                false) ==
                                                            true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : Color(0xFFE0E3E7),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 24.0, 0.0, 24.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 16.0,
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .precoVisivelControllerValidator
                                              .asValidator(context),
                                        ),
                                        Opacity(
                                          opacity: 0.0,
                                          child: TextFormField(
                                            controller:
                                                _model.precoDigitadoController,
                                            focusNode:
                                                _model.precoDigitadoFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.precoDigitadoController',
                                              Duration(milliseconds: 0),
                                              () async {
                                                setState(() {
                                                  _model.precoVisivelController
                                                          ?.text =
                                                      functions
                                                          .converteValorParaReal(
                                                              _model
                                                                  .precoDigitadoController
                                                                  .text)!;
                                                });
                                              },
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Valor do Produto',
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 14.0,
                                                  ),
                                              alignLabelWithHint: false,
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 16.0,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 35.0, 0.0, 35.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 1.0,
                                                ),
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .precoDigitadoControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150.0,
                                  decoration: BoxDecoration(),
                                  child: SwitchListTile.adaptive(
                                    value: _model.fixoValue ??=
                                        widget.lancamento?.fixo == 1
                                            ? true
                                            : false,
                                    onChanged: (newValue) async {
                                      setState(
                                          () => _model.fixoValue = newValue!);
                                    },
                                    title: Text(
                                      'FIXO',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 15.0,
                                          ),
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                              ],
                            ),
                            if (FFAppState().campoObrigatorio == 'valor')
                              Text(
                                'Campo Obrigatório',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).error,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      if (!_model.fixoValue!)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model.avistaValueController ??=
                                        FormFieldController<String>(
                                      _model.avistaValue ??=
                                          widget.lancamento != null
                                              ? widget.lancamento?.avista
                                              : 'A VISTA',
                                    ),
                                    options: List<String>.from(
                                        ['A VISTA', 'PARCELADO']),
                                    optionLabels: ['A VISTA', 'PARCELADO'],
                                    onChanged: (val) => setState(
                                        () => _model.avistaValue = val),
                                    width: 30.0,
                                    height: 50.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Opacity(
                                      opacity: _model.avistaValue == 'PARCELADO'
                                          ? 1.0
                                          : 0.0,
                                      child: TextFormField(
                                        controller: _model.parcelasController,
                                        focusNode: _model.parcelasFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Quantidade de Parcelas',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .parcelasControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    if (FFAppState().campoObrigatorio ==
                                        'parcelasNum')
                                      Text(
                                        'Apenas Número',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                      ),
                                    if (FFAppState().campoObrigatorio ==
                                        'parcelas')
                                      Text(
                                        'Campo Obrigatório',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Stack(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    children: [
                                      TextFormField(
                                        controller: _model.dataController,
                                        focusNode: _model.dataFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Data Transação',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        keyboardType: TextInputType.datetime,
                                        validator: _model
                                            .dataControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.dataMask],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Icon(
                                          Icons.calendar_month,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.0,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final _datePickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2050),
                                              builder: (context, child) {
                                                return wrapInMaterialDatePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  headerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 32.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                  pickerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  pickerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  selectedDateTimeBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  selectedDateTimeForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  actionButtonForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );

                                            if (_datePickedDate != null) {
                                              safeSetState(() {
                                                _model.datePicked = DateTime(
                                                  _datePickedDate.year,
                                                  _datePickedDate.month,
                                                  _datePickedDate.day,
                                                );
                                              });
                                            }
                                            setState(() {
                                              _model.dataController?.text =
                                                  dateTimeFormat('dd/MM/y',
                                                      _model.datePicked);
                                            });
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (FFAppState().campoObrigatorio == 'data')
                              Text(
                                'Campo Obrigatório',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).error,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.tipo == 'Despesa')
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .statusDespesaValueController ??=
                                                FormFieldController<String>(
                                              _model.statusDespesaValue ??=
                                                  widget.lancamento != null
                                                      ? widget
                                                          .lancamento?.status
                                                      : 'PENDENTE',
                                            ),
                                            options: List<String>.from(
                                                ['PENDENTE', 'PAGO']),
                                            optionLabels: ['PENDENTE', 'PAGO'],
                                            onChanged: (val) => setState(() =>
                                                _model.statusDespesaValue =
                                                    val),
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                            hintText: 'Status',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 2.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Text(
                                                'Status',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 10.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            if (widget.tipo == 'Receita')
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .statusReceitaValueController ??=
                                                FormFieldController<String>(
                                              _model.statusReceitaValue ??=
                                                  widget.lancamento != null
                                                      ? widget
                                                          .lancamento?.status
                                                      : 'PENDENTE',
                                            ),
                                            options: List<String>.from(
                                                ['PENDENTE', 'RECEBIDO']),
                                            optionLabels: [
                                              'PENDENTE',
                                              'RECEBIDO'
                                            ],
                                            onChanged: (val) => setState(() =>
                                                _model.statusReceitaValue =
                                                    val),
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                            hintText: 'Status',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 2.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Text(
                                                'Status',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 10.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            if (FFAppState().campoObrigatorio == 'status')
                              Text(
                                'Campo Obrigatório',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).error,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    FFAppState().campoObrigatorio = '';
                                  });
                                  if (_model.descricaoController.text == null ||
                                      _model.descricaoController.text == '') {
                                    setState(() {
                                      FFAppState().campoObrigatorio =
                                          'descricao';
                                    });
                                    return;
                                  } else {
                                    if (_model.categoriaValue == null) {
                                      setState(() {
                                        FFAppState().campoObrigatorio =
                                            'categoria';
                                      });
                                      return;
                                    } else {
                                      if ((_model.precoVisivelController.text !=
                                                      null &&
                                                  _model.precoVisivelController
                                                          .text !=
                                                      ''
                                              ? functions.salvaPrecoBanco(_model
                                                  .precoVisivelController.text)!
                                              : 0.0) <
                                          1.0) {
                                        setState(() {
                                          FFAppState().campoObrigatorio =
                                              'valor';
                                        });
                                        return;
                                      } else {
                                        if ((_model.fixoValue == false) &&
                                            (_model.avistaValue ==
                                                'PARCELADO') &&
                                            (_model.parcelasController.text ==
                                                    null ||
                                                _model.parcelasController
                                                        .text ==
                                                    '')) {
                                          setState(() {
                                            FFAppState().campoObrigatorio =
                                                'parcelas';
                                          });
                                          return;
                                        } else {
                                          if ((_model.fixoValue == false) &&
                                              (_model.avistaValue ==
                                                  'PARCELADO') &&
                                              !functions.verificaSeApenasNumero(
                                                  _model.parcelasController
                                                      .text)!) {
                                            setState(() {
                                              FFAppState().campoObrigatorio =
                                                  'parcelasNum';
                                            });
                                            return;
                                          } else {
                                            if (_model.datePicked == null) {
                                              setState(() {
                                                FFAppState().campoObrigatorio =
                                                    'data';
                                              });
                                              return;
                                            } else {
                                              if ((widget.tipo == 'Receita') &&
                                                  (_model.statusReceitaValue ==
                                                          null ||
                                                      _model.statusReceitaValue ==
                                                          '')) {
                                                setState(() {
                                                  FFAppState()
                                                          .campoObrigatorio =
                                                      'status';
                                                });
                                                return;
                                              } else {
                                                if ((widget.tipo ==
                                                        'Despesa') &&
                                                    (_model.statusDespesaValue ==
                                                            null ||
                                                        _model.statusDespesaValue ==
                                                            '')) {
                                                  setState(() {
                                                    FFAppState()
                                                            .campoObrigatorio =
                                                        'status';
                                                  });
                                                  return;
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }

                                  if (!(widget.lancamento != null)) {
                                    if ((_model.fixoValue == false) &&
                                        (_model.avistaValue == 'PARCELADO')) {
                                      setState(() {
                                        FFAppState().DataTime =
                                            _model.datePicked;
                                      });
                                      setState(() {
                                        FFAppState().loop = 1;
                                      });
                                      while (functions.stringParaInt(_model
                                              .parcelasController.text)! >=
                                          FFAppState().loop) {
                                        await SQLiteManager.instance
                                            .novoLancamento(
                                          descricao:
                                              _model.descricaoController.text,
                                          idcategoria: _model.categoriaValue!,
                                          valor: widget.tipo == 'Receita'
                                              ? functions.salvaPrecoBanco(_model
                                                  .precoVisivelController.text)!
                                              : (-(functions.salvaPrecoBanco(
                                                  _model.precoVisivelController
                                                      .text)!)),
                                          fixo: _model.fixoValue! ? 1 : 0,
                                          tipotransacao: _model.avistaValue,
                                          parcela: FFAppState().loop,
                                          dtagendada: FFAppState().DataTime!,
                                          status: widget.tipo == 'Receita'
                                              ? _model.statusReceitaValue!
                                              : _model.statusDespesaValue!,
                                          totalparcelas: int.tryParse(
                                              _model.parcelasController.text),
                                        );
                                        setState(() {
                                          FFAppState().DataTime =
                                              functions.adicionarUmMes(
                                                  FFAppState().DataTime!);
                                        });
                                        setState(() {
                                          FFAppState().loop =
                                              FFAppState().loop + 1;
                                        });
                                      }
                                    } else {
                                      await SQLiteManager.instance
                                          .novoLancamento(
                                        descricao:
                                            _model.descricaoController.text,
                                        idcategoria: _model.categoriaValue!,
                                        valor: widget.tipo == 'Receita'
                                            ? functions.salvaPrecoBanco(_model
                                                .precoVisivelController.text)!
                                            : (-(functions.salvaPrecoBanco(
                                                _model.precoVisivelController
                                                    .text)!)),
                                        fixo: _model.fixoValue! ? 1 : 0,
                                        tipotransacao: _model.avistaValue,
                                        dtagendada: _model.datePicked!,
                                        status: widget.tipo == 'Receita'
                                            ? _model.statusReceitaValue!
                                            : _model.statusDespesaValue!,
                                        parcela: 0,
                                        totalparcelas: 0,
                                      );
                                    }

                                    Navigator.pop(context);
                                    if (widget.ativo == 1) {
                                      context.goNamed(
                                        'Inicio',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    } else {
                                      if (widget.ativo == 2) {
                                        context.goNamed(
                                          'Lancamentos',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else {
                                        if (widget.ativo == 3) {
                                          context.goNamed(
                                            'Categorias',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        }
                                      }
                                    }
                                  }
                                },
                                text: 'Salvar',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}

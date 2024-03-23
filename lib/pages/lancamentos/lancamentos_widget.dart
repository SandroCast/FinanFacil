import '/backend/sqlite/sqlite_manager.dart';
import '/components/acoes_lancamentos_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lancamentos_model.dart';
export 'lancamentos_model.dart';

class LancamentosWidget extends StatefulWidget {
  const LancamentosWidget({super.key});

  @override
  State<LancamentosWidget> createState() => _LancamentosWidgetState();
}

class _LancamentosWidgetState extends State<LancamentosWidget>
    with TickerProviderStateMixin {
  late LancamentosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LancamentosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().anoSelecionado = functions.obterAno(getCurrentTimestamp)!;
        FFAppState().mesSelecionado = functions.obterMes(getCurrentTimestamp)!;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 15.0, 5.0, 13.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (FFAppState().mesSelecionado ==
                                              'Janeiro') {
                                            setState(() {
                                              FFAppState().mesSelecionado =
                                                  functions
                                                      .gerarListaDeMeses(
                                                          FFAppState()
                                                              .mesSelecionado)!
                                                      .first;
                                              FFAppState().anoSelecionado =
                                                  FFAppState().anoSelecionado +
                                                      -1;
                                            });
                                          } else {
                                            setState(() {
                                              FFAppState().mesSelecionado =
                                                  functions
                                                      .gerarListaDeMeses(
                                                          FFAppState()
                                                              .mesSelecionado)!
                                                      .first;
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.arrow_back_ios_new,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            FFAppState().Flutuante = 'meses';
                                          });
                                        },
                                        child: Text(
                                          '${FFAppState().mesSelecionado} ${FFAppState().anoSelecionado.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 17.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (FFAppState().mesSelecionado ==
                                              'Dezembro') {
                                            setState(() {
                                              FFAppState().mesSelecionado =
                                                  functions
                                                      .gerarListaDeMeses(
                                                          FFAppState()
                                                              .mesSelecionado)!
                                                      .last;
                                              FFAppState().anoSelecionado =
                                                  FFAppState().anoSelecionado +
                                                      1;
                                            });
                                          } else {
                                            setState(() {
                                              FFAppState().mesSelecionado =
                                                  functions
                                                      .gerarListaDeMeses(
                                                          FFAppState()
                                                              .mesSelecionado)!
                                                      .last;
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FutureBuilder<List<SaldoPrevistoRow>>(
                                future: SQLiteManager.instance.saldoPrevisto(
                                  mesfim: functions.stringParaDateTime(
                                      '${FFAppState().anoSelecionado.toString()}-${functions.mesParaNumero(FFAppState().mesSelecionado)}-31 23:59:59.999'),
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
                                  final containerSaldoPrevistoRowList =
                                      snapshot.data!;
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: containerSaldoPrevistoRowList
                                                  .first.valor !=
                                              null
                                          ? (containerSaldoPrevistoRowList
                                                      .first.valor! >=
                                                  0.0
                                              ? Color(0xFF00B048)
                                              : Color(0xFFFD0101))
                                          : Color(0xFF00B048),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Saldo no fim do mês:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              containerSaldoPrevistoRowList
                                                          .first.valor !=
                                                      null
                                                  ? (containerSaldoPrevistoRowList
                                                              .first.valor! >=
                                                          0.0
                                                      ? formatNumber(
                                                          containerSaldoPrevistoRowList
                                                              .first.valor!,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'R\$ ',
                                                          format: ',##0.00#',
                                                          locale: 'pt_br',
                                                        )
                                                      : formatNumber(
                                                          -(containerSaldoPrevistoRowList
                                                              .first.valor!),
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: '- R\$ ',
                                                          format: ',##0.00#',
                                                          locale: 'pt_br',
                                                        ))
                                                  : 'R\$ 0,00',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 100.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FutureBuilder<List<BuscaLancamentosRow>>(
                                        future: SQLiteManager.instance
                                            .buscaLancamentos(
                                          ano: FFAppState()
                                              .anoSelecionado
                                              .toString(),
                                          mes: functions.mesParaNumero(
                                              FFAppState().mesSelecionado),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final containerBuscaLancamentosRowList =
                                              snapshot.data!;
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (containerBuscaLancamentosRowList
                                                        .length >
                                                    0)
                                                  Builder(
                                                    builder: (context) {
                                                      final listaLancamentos =
                                                          containerBuscaLancamentosRowList
                                                              .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listaLancamentos
                                                                .length,
                                                        itemBuilder: (context,
                                                            listaLancamentosIndex) {
                                                          final listaLancamentosItem =
                                                              listaLancamentos[
                                                                  listaLancamentosIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    useSafeArea:
                                                                        true,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              AcoesLancamentosWidget(
                                                                            tipo:
                                                                                listaLancamentosItem.tipo!,
                                                                            lancamento:
                                                                                listaLancamentosItem,
                                                                            ativo:
                                                                                2,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                },
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          10.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 4.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(0.0, 2.0),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(10.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                child: Container(
                                                                                  width: 10.0,
                                                                                  height: 38.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: listaLancamentosItem.tipo == 'Receita' ? Color(0xFF00B048) : Color(0xFFFD0101),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          listaLancamentosItem.descricao!,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                color: listaLancamentosItem.tipo == 'Receita' ? Color(0xFF00B048) : Color(0xFFFD0101),
                                                                                                fontSize: 13.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          listaLancamentosItem.tipo == 'Receita'
                                                                                              ? formatNumber(
                                                                                                  listaLancamentosItem.valor!,
                                                                                                  formatType: FormatType.custom,
                                                                                                  currency: 'R\$ ',
                                                                                                  format: ',##0.00#',
                                                                                                  locale: 'pt_br',
                                                                                                )
                                                                                              : formatNumber(
                                                                                                  -(listaLancamentosItem.valor!),
                                                                                                  formatType: FormatType.custom,
                                                                                                  currency: '- R\$ ',
                                                                                                  format: ',##0.00#',
                                                                                                  locale: 'pt_br',
                                                                                                ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                color: listaLancamentosItem.tipo == 'Receita' ? Color(0xFF00B048) : Color(0xFFFD0101),
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Data: ${dateTimeFormat('dd/MM/y', functions.stringParaDateTime(listaLancamentosItem.dtagendada!))}',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                fontSize: 12.0,
                                                                                              ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
                                                                                                  child: Text(
                                                                                                    () {
                                                                                                      if (listaLancamentosItem.fixo == 1) {
                                                                                                        return 'FIXO';
                                                                                                      } else if (listaLancamentosItem.avista == 'A VISTA') {
                                                                                                        return 'A VISTA';
                                                                                                      } else {
                                                                                                        return '${listaLancamentosItem.parcela?.toString()}/${listaLancamentosItem.totalparcelas?.toString()}';
                                                                                                      }
                                                                                                    }(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          fontSize: 11.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (listaLancamentosItem.status == 'PENDENTE')
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.access_time_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'PENDENTE',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                                          fontSize: 12.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            if (listaLancamentosItem.status == 'PAGO')
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.check_circle,
                                                                                                    color: FlutterFlowTheme.of(context).success,
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'PAGO',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: FlutterFlowTheme.of(context).success,
                                                                                                          fontSize: 12.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            if (listaLancamentosItem.status == 'RECEBIDO')
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.check_circle,
                                                                                                    color: FlutterFlowTheme.of(context).success,
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'RECEBIDO',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Readex Pro',
                                                                                                          color: FlutterFlowTheme.of(context).success,
                                                                                                          fontSize: 12.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
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
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                if (containerBuscaLancamentosRowList
                                                        .length ==
                                                    0)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 30.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Não há lançamentos.',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 16.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: wrapWithModel(
                            model: _model.navBarModel,
                            updateCallback: () => setState(() {}),
                            child: NavBarWidget(
                              ativo: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (FFAppState().Flutuante == 'meses')
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          FFAppState().Flutuante = '';
                        });
                      },
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: double.infinity,
                          height: 85.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 10.0, 5.0),
                                      child: FlutterFlowChoiceChips(
                                        options: functions
                                            .gerarListaDeAnos(
                                                FFAppState().anoSelecionado)!
                                            .map((e) => e.toString())
                                            .toList()
                                            .map((label) => ChipData(label))
                                            .toList(),
                                        onChanged: (val) async {
                                          setState(() => _model.choiceAnoValue =
                                              val?.firstOrNull);
                                          setState(() {
                                            FFAppState().anoSelecionado =
                                                functions.stringParaInt(
                                                    _model.choiceAnoValue!)!;
                                          });
                                        },
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor: Color(0xFF66C3FF),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          iconSize: 18.0,
                                          elevation: 4.0,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          iconSize: 18.0,
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        chipSpacing: 12.0,
                                        rowSpacing: 12.0,
                                        multiselect: false,
                                        initialized:
                                            _model.choiceAnoValue != null,
                                        alignment: WrapAlignment.center,
                                        controller: _model
                                                .choiceAnoValueController ??=
                                            FormFieldController<List<String>>(
                                          [
                                            FFAppState()
                                                .anoSelecionado
                                                .toString()
                                          ],
                                        ),
                                        wrapped: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 10.0, 5.0),
                                      child: FlutterFlowChoiceChips(
                                        options: functions
                                            .gerarListaDeMeses(
                                                FFAppState().mesSelecionado)!
                                            .map((label) => ChipData(label))
                                            .toList(),
                                        onChanged: (val) async {
                                          setState(() => _model.choiceMesValue =
                                              val?.firstOrNull);
                                          setState(() {
                                            FFAppState().mesSelecionado =
                                                _model.choiceMesValue!;
                                          });
                                        },
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor: Color(0xFF66C3FF),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          iconSize: 18.0,
                                          elevation: 4.0,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          iconSize: 18.0,
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        chipSpacing: 12.0,
                                        rowSpacing: 12.0,
                                        multiselect: false,
                                        initialized:
                                            _model.choiceMesValue != null,
                                        alignment: WrapAlignment.center,
                                        controller: _model
                                                .choiceMesValueController ??=
                                            FormFieldController<List<String>>(
                                          [FFAppState().mesSelecionado],
                                        ),
                                        wrapped: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

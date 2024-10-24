import '/components/confirma_sair_widget.dart';
import '/components/expressao_invalida_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'atividade03_model.dart';
export 'atividade03_model.dart';

class Atividade03Widget extends StatefulWidget {
  const Atividade03Widget({super.key});

  @override
  State<Atividade03Widget> createState() => _Atividade03WidgetState();
}

class _Atividade03WidgetState extends State<Atividade03Widget> {
  late Atividade03Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Atividade03Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.expressaoEscolhida =
          FFAppConstants.expressoesAtividade03[random_data.randomInteger(0, 3)];
      safeSetState(() {});
      _model.expressaoCorreta = functions
          .splitBySpace(_model.expressaoEscolhida!)
          .toList()
          .cast<String>();
      safeSetState(() {});
      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    decoration: BoxDecoration(
                      color: Color(0xFF5694E7),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(dialogContext)
                                                  .unfocus(),
                                          child: ConfirmaSairWidget(),
                                        ),
                                      );
                                    },
                                  );
                                },
                                text: 'voltar',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x004B39EF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  100.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowTimer(
                                initialTime: _model.timerInitialTimeMs,
                                getDisplayTime: (value) =>
                                    StopWatchTimer.getDisplayTime(
                                  value,
                                  hours: false,
                                  milliSecond: false,
                                ),
                                controller: _model.timerController,
                                updateStateInterval:
                                    Duration(milliseconds: 1000),
                                onChanged: (value, displayTime, shouldUpdate) {
                                  _model.timerMilliseconds = value;
                                  _model.timerValue = displayTime;
                                  if (shouldUpdate) safeSetState(() {});
                                },
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF5694E7),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return tentativa1[0] ==
                                                expressaoCorreta[0];
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa1[0]);
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return tentativa1[0] !=
                                                expressaoCorreta[0];
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa1[0]);
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 0)) {
                                          return FFAppState()
                                              .expressaoAtual
                                              .first;
                                        } else if (_model.contadorTentativa >
                                            0) {
                                          return _model.tentativa1.first;
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return tentativa1[1] ==
                                                expressaoCorreta[1];
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa1[1]);
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return tentativa1[1] !=
                                                expressaoCorreta[1];
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa1[1]);
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 0) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                1)) {
                                          return FFAppState().expressaoAtual[1];
                                        } else if (_model.contadorTentativa >
                                            0) {
                                          return _model.tentativa1[1];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return tentativa1[2] ==
                                                expressaoCorreta[2];
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((FFAppState()
                                              .expressaoAtual
                                              .isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa1[2]);
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return tentativa1[2] !=
                                                expressaoCorreta[2];
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> expressaoCorreta,
                                                  List<String> tentativa1) {
                                            return !expressaoCorreta
                                                .contains(tentativa1[2]);
                                          }(_model.expressaoCorreta.toList(),
                                              _model.tentativa1.toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                2) &&
                                            (_model.contadorTentativa == 0)) {
                                          return FFAppState().expressaoAtual[2];
                                        } else if (_model.contadorTentativa >
                                            0) {
                                          return _model.tentativa1[2];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return tentativa1[3] ==
                                                expressaoCorreta[3];
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa1[3]);
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta[3] !=
                                                tentativa1[3];
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> expressaoCorreta,
                                                  List<String> tentativa1) {
                                            return !expressaoCorreta
                                                .contains(tentativa1[3]);
                                          }(_model.expressaoCorreta.toList(),
                                              _model.tentativa1.toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                3) &&
                                            (_model.contadorTentativa == 0)) {
                                          return FFAppState().expressaoAtual[3];
                                        } else if (_model.contadorTentativa >
                                            0) {
                                          return _model.tentativa1[3];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return tentativa1[4] ==
                                                expressaoCorreta[4];
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa1[4]);
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta[4] !=
                                                tentativa1[4];
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa1[4]);
                                          }(
                                              FFAppState()
                                                  .expressaoAtual
                                                  .toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                4) &&
                                            (_model.contadorTentativa == 0)) {
                                          return FFAppState().expressaoAtual[4];
                                        } else if (_model.contadorTentativa >
                                            0) {
                                          return _model.tentativa1[4];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return tentativa1[5] ==
                                                expressaoCorreta[5];
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa1[5]);
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta[5] !=
                                                tentativa1[5];
                                          }(
                                              FFAppState()
                                                  .expressaoAtual
                                                  .toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa1[5]);
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                5) &&
                                            (_model.contadorTentativa == 0)) {
                                          return FFAppState().expressaoAtual[5];
                                        } else if (_model.contadorTentativa >
                                            0) {
                                          return _model.tentativa1[5];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta[6] ==
                                                tentativa1[6];
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa1[6]);
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta[6] !=
                                                tentativa1[6];
                                          }(
                                              FFAppState()
                                                  .expressaoAtual
                                                  .toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 0) &&
                                          ((List<String> tentativa1,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa1[6]);
                                          }(
                                              _model.tentativa1.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                6) &&
                                            (_model.contadorTentativa == 0)) {
                                          return FFAppState().expressaoAtual[6];
                                        } else if (_model.contadorTentativa >
                                            0) {
                                          return _model.tentativa1[6];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF5694E7),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[0] ==
                                                expressaoCorreta[0];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[0]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[0] !=
                                                expressaoCorreta[0];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[0]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 1)) {
                                          return FFAppState()
                                              .expressaoAtual
                                              .first;
                                        } else if (_model.contadorTentativa >
                                            1) {
                                          return _model.tentativa2.first;
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[1] ==
                                                expressaoCorreta[1];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[1]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[1] !=
                                                expressaoCorreta[1];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[1]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                1) &&
                                            (_model.contadorTentativa == 1)) {
                                          return FFAppState().expressaoAtual[1];
                                        } else if (_model.contadorTentativa >
                                            1) {
                                          return _model.tentativa2[1];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[2] ==
                                                expressaoCorreta[2];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[2]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[2] !=
                                                expressaoCorreta[2];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[2]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 1) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                2)) {
                                          return FFAppState().expressaoAtual[2];
                                        } else if (_model.contadorTentativa >
                                            1) {
                                          return _model.tentativa2[2];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[3] ==
                                                expressaoCorreta[3];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[3]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[3] !=
                                                expressaoCorreta[3];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[3]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 1) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                3)) {
                                          return FFAppState().expressaoAtual[3];
                                        } else if (_model.contadorTentativa >
                                            1) {
                                          return _model.tentativa2[3];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[4] ==
                                                expressaoCorreta[4];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[4]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[4] !=
                                                expressaoCorreta[4];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[4]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 1) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                4)) {
                                          return FFAppState().expressaoAtual[4];
                                        } else if (_model.contadorTentativa >
                                            1) {
                                          return _model.tentativa2[4];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[5] ==
                                                expressaoCorreta[5];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[5]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[5] !=
                                                expressaoCorreta[5];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[5]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 1) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                5)) {
                                          return FFAppState().expressaoAtual[5];
                                        } else if (_model.contadorTentativa >
                                            1) {
                                          return _model.tentativa2[5];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[6] ==
                                                expressaoCorreta[6];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[6]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[6] !=
                                                expressaoCorreta[6];
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 1) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[6]);
                                          }(
                                              _model.tentativa2.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 1) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                6)) {
                                          return FFAppState().expressaoAtual[6];
                                        } else if (_model.contadorTentativa >
                                            1) {
                                          return _model.tentativa2[6];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF5694E7),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[0] ==
                                                expressaoCorreta[0];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[0]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[0] !=
                                                expressaoCorreta[0];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[0]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 2)) {
                                          return FFAppState()
                                              .expressaoAtual
                                              .first;
                                        } else if (_model.contadorTentativa >
                                            2) {
                                          return _model.tentativa3.first;
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[1] ==
                                                expressaoCorreta[1];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[1]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[1] !=
                                                expressaoCorreta[1];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[1]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 2) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                1)) {
                                          return FFAppState().expressaoAtual[1];
                                        } else if (_model.contadorTentativa >
                                            2) {
                                          return _model.tentativa3[1];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[2] ==
                                                expressaoCorreta[2];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[2]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[2] !=
                                                expressaoCorreta[2];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[2]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 2) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                2)) {
                                          return FFAppState().expressaoAtual[2];
                                        } else if (_model.contadorTentativa >
                                            2) {
                                          return _model.tentativa3[2];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[3] ==
                                                expressaoCorreta[3];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[3]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[3] !=
                                                expressaoCorreta[3];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[3]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 2) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                3)) {
                                          return FFAppState().expressaoAtual[3];
                                        } else if (_model.contadorTentativa >
                                            2) {
                                          return _model.tentativa3[3];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[4] ==
                                                expressaoCorreta[4];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[4]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[4] !=
                                                expressaoCorreta[4];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[4]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 2) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                4)) {
                                          return FFAppState().expressaoAtual[4];
                                        } else if (_model.contadorTentativa >
                                            2) {
                                          return _model.tentativa3[4];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[5] ==
                                                expressaoCorreta[5];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[5]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[5] !=
                                                expressaoCorreta[5];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[5]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 2) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                5)) {
                                          return FFAppState().expressaoAtual[5];
                                        } else if (_model.contadorTentativa >
                                            2) {
                                          return _model.tentativa3[5];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[6] ==
                                                expressaoCorreta[6];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[6]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[6] !=
                                                expressaoCorreta[6];
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 2) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[6]);
                                          }(
                                              _model.tentativa3.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 2) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                6)) {
                                          return FFAppState().expressaoAtual[6];
                                        } else if (_model.contadorTentativa >
                                            2) {
                                          return _model.tentativa3[6];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF5694E7),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[0] ==
                                                expressaoCorreta[0];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[0]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[0] !=
                                                expressaoCorreta[0];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[0]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 3)) {
                                          return FFAppState()
                                              .expressaoAtual
                                              .first;
                                        } else if (_model.contadorTentativa >
                                            3) {
                                          return _model.tentativa4.first;
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[1] ==
                                                expressaoCorreta[1];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[1]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[1] !=
                                                expressaoCorreta[1];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[1]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 3) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                1)) {
                                          return FFAppState().expressaoAtual[1];
                                        } else if (_model.contadorTentativa >
                                            3) {
                                          return _model.tentativa4[1];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[2] ==
                                                expressaoCorreta[2];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[2]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[2] !=
                                                expressaoCorreta[2];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[2]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 3) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                2)) {
                                          return FFAppState().expressaoAtual[2];
                                        } else if (_model.contadorTentativa >
                                            3) {
                                          return _model.tentativa4[2];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[3] ==
                                                expressaoCorreta[3];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[3]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[3] !=
                                                expressaoCorreta[3];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[3]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 3) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                3)) {
                                          return FFAppState().expressaoAtual[3];
                                        } else if (_model.contadorTentativa >
                                            3) {
                                          return _model.tentativa4[3];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[4] ==
                                                expressaoCorreta[4];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[4]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[4] !=
                                                expressaoCorreta[4];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[4]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 3) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                4)) {
                                          return FFAppState().expressaoAtual[4];
                                        } else if (_model.contadorTentativa >
                                            3) {
                                          return _model.tentativa4[4];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[5] ==
                                                expressaoCorreta[5];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[5]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[5] !=
                                                expressaoCorreta[5];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[5]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 3) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                5)) {
                                          return FFAppState().expressaoAtual[5];
                                        } else if (_model.contadorTentativa >
                                            3) {
                                          return _model.tentativa4[5];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[6] ==
                                                expressaoCorreta[6];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[6]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[6] !=
                                                expressaoCorreta[6];
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 3) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[6]);
                                          }(
                                              _model.tentativa4.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 3) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                6)) {
                                          return FFAppState().expressaoAtual[6];
                                        } else if (_model.contadorTentativa >
                                            3) {
                                          return _model.tentativa4[6];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF5694E7),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[0] ==
                                                expressaoCorreta[0];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[0]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[0] !=
                                                expressaoCorreta[0];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[0]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 4)) {
                                          return FFAppState()
                                              .expressaoAtual
                                              .first;
                                        } else if (_model.contadorTentativa >
                                            4) {
                                          return _model.tentativa5.first;
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[1] ==
                                                expressaoCorreta[1];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[1]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[1] !=
                                                expressaoCorreta[1];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[1]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 4) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                1)) {
                                          return FFAppState().expressaoAtual[1];
                                        } else if (_model.contadorTentativa >
                                            4) {
                                          return _model.tentativa5[1];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[2] ==
                                                expressaoCorreta[2];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[2]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[2] !=
                                                expressaoCorreta[2];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[2]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 4) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                2)) {
                                          return FFAppState().expressaoAtual[2];
                                        } else if (_model.contadorTentativa >
                                            4) {
                                          return _model.tentativa5[2];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[3] ==
                                                expressaoCorreta[3];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[3]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[3] !=
                                                expressaoCorreta[3];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[3]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 4) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                3)) {
                                          return FFAppState().expressaoAtual[3];
                                        } else if (_model.contadorTentativa >
                                            4) {
                                          return _model.tentativa5[3];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[4] ==
                                                expressaoCorreta[4];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[4]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[4] !=
                                                expressaoCorreta[4];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[4]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 4) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                4)) {
                                          return FFAppState().expressaoAtual[4];
                                        } else if (_model.contadorTentativa >
                                            4) {
                                          return _model.tentativa5[4];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[5] ==
                                                expressaoCorreta[5];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[5]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[5] !=
                                                expressaoCorreta[5];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[5]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 4) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                5)) {
                                          return FFAppState().expressaoAtual[5];
                                        } else if (_model.contadorTentativa >
                                            4) {
                                          return _model.tentativa5[5];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[6] ==
                                                expressaoCorreta[6];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[6]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[6] !=
                                                expressaoCorreta[6];
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 4) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[6]);
                                          }(
                                              _model.tentativa5.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 4) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                6)) {
                                          return FFAppState().expressaoAtual[6];
                                        } else if (_model.contadorTentativa >
                                            4) {
                                          return _model.tentativa5[6];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF5694E7),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[0] ==
                                                expressaoCorreta[0];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[0]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[0] !=
                                                expressaoCorreta[0];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[0]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 5)) {
                                          return FFAppState()
                                              .expressaoAtual
                                              .first;
                                        } else if (_model.contadorTentativa >
                                            5) {
                                          return _model.tentativa4.first;
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[1] ==
                                                expressaoCorreta[1];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[1]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[1] !=
                                                expressaoCorreta[1];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[1]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 5) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                1)) {
                                          return FFAppState().expressaoAtual[1];
                                        } else if (_model.contadorTentativa >
                                            5) {
                                          return _model.tentativa4[1];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[2] ==
                                                expressaoCorreta[2];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[2]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[2] !=
                                                expressaoCorreta[2];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[2]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 5) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                2)) {
                                          return FFAppState().expressaoAtual[2];
                                        } else if (_model.contadorTentativa >
                                            5) {
                                          return _model.tentativa4[2];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[3] ==
                                                expressaoCorreta[3];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[3]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[3] !=
                                                expressaoCorreta[3];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[3]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 5) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                3)) {
                                          return FFAppState().expressaoAtual[3];
                                        } else if (_model.contadorTentativa >
                                            5) {
                                          return _model.tentativa4[3];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[4] ==
                                                expressaoCorreta[4];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[4]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[4] !=
                                                expressaoCorreta[4];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[4]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 5) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                4)) {
                                          return FFAppState().expressaoAtual[4];
                                        } else if (_model.contadorTentativa >
                                            5) {
                                          return _model.tentativa4[4];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[5] ==
                                                expressaoCorreta[5];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[5]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[5] !=
                                                expressaoCorreta[5];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[5]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 5) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                5)) {
                                          return FFAppState().expressaoAtual[5];
                                        } else if (_model.contadorTentativa >
                                            5) {
                                          return _model.tentativa4[5];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if ((_model.tentativa2.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[6] ==
                                                expressaoCorreta[6];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF53AB63);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return expressaoCorreta
                                                .contains(tentativa[6]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList())) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return tentativa[6] !=
                                                expressaoCorreta[6];
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFFB86F22);
                                      } else if ((_model
                                              .tentativa1.isNotEmpty) &&
                                          (_model.contadorTentativa > 5) &&
                                          ((List<String> tentativa,
                                                  List<String> expressaoCorreta) {
                                            return !expressaoCorreta
                                                .contains(tentativa[6]);
                                          }(
                                              _model.tentativa6.toList(),
                                              _model.expressaoCorreta
                                                  .toList()))) {
                                        return Color(0xFF636060);
                                      } else {
                                        return Colors.white;
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      () {
                                        if ((FFAppState()
                                                .expressaoAtual
                                                .isNotEmpty) &&
                                            (_model.contadorTentativa == 5) &&
                                            (FFAppState()
                                                    .expressaoAtual
                                                    .toList()
                                                    .length >
                                                6)) {
                                          return FFAppState().expressaoAtual[6];
                                        } else if (_model.contadorTentativa >
                                            5) {
                                          return _model.tentativa4[6];
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
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
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                _model.botao0 = await actions.newCustomAction2(
                                  '0',
                                );
                                _shouldSetState = true;
                                if (FFAppState()
                                        .expressaoAtual
                                        .toList()
                                        .length ==
                                    7) {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                FFAppState()
                                    .addToExpressaoAtual(_model.botao0!);
                                safeSetState(() {});
                                if (_shouldSetState) safeSetState(() {});
                              },
                              text: '0',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.12,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                _model.botao1 = await actions.newCustomAction2(
                                  '1',
                                );
                                _shouldSetState = true;
                                if (FFAppState()
                                        .expressaoAtual
                                        .toList()
                                        .length ==
                                    7) {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                FFAppState()
                                    .addToExpressaoAtual(_model.botao1!);
                                safeSetState(() {});
                                if (_shouldSetState) safeSetState(() {});
                              },
                              text: '1',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.12,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                _model.botao2 = await actions.newCustomAction2(
                                  '2',
                                );
                                _shouldSetState = true;
                                if (FFAppState()
                                        .expressaoAtual
                                        .toList()
                                        .length ==
                                    7) {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                FFAppState()
                                    .addToExpressaoAtual(_model.botao2!);
                                safeSetState(() {});
                                if (_shouldSetState) safeSetState(() {});
                              },
                              text: '2',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.12,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                _model.botao3 = await actions.newCustomAction2(
                                  '3',
                                );
                                _shouldSetState = true;
                                if (FFAppState()
                                        .expressaoAtual
                                        .toList()
                                        .length ==
                                    7) {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                FFAppState()
                                    .addToExpressaoAtual(_model.botao3!);
                                safeSetState(() {});
                                if (_shouldSetState) safeSetState(() {});
                              },
                              text: '3',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.12,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                _model.botao4 = await actions.newCustomAction2(
                                  '4',
                                );
                                _shouldSetState = true;
                                if (FFAppState()
                                        .expressaoAtual
                                        .toList()
                                        .length ==
                                    7) {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                FFAppState()
                                    .addToExpressaoAtual(_model.botao4!);
                                safeSetState(() {});
                                if (_shouldSetState) safeSetState(() {});
                              },
                              text: '4',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.12,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  _model.botao5 =
                                      await actions.newCustomAction2(
                                    '5',
                                  );
                                  _shouldSetState = true;
                                  if (FFAppState()
                                          .expressaoAtual
                                          .toList()
                                          .length ==
                                      7) {
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  FFAppState()
                                      .addToExpressaoAtual(_model.botao5!);
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: '5',
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  _model.botao6 =
                                      await actions.newCustomAction2(
                                    '6',
                                  );
                                  _shouldSetState = true;
                                  if (FFAppState()
                                          .expressaoAtual
                                          .toList()
                                          .length ==
                                      7) {
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  FFAppState()
                                      .addToExpressaoAtual(_model.botao6!);
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: '6',
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  _model.botao7 =
                                      await actions.newCustomAction2(
                                    '7',
                                  );
                                  _shouldSetState = true;
                                  if (FFAppState()
                                          .expressaoAtual
                                          .toList()
                                          .length ==
                                      7) {
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  FFAppState()
                                      .addToExpressaoAtual(_model.botao7!);
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: '7',
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  _model.botao8 =
                                      await actions.newCustomAction2(
                                    '8',
                                  );
                                  _shouldSetState = true;
                                  if (FFAppState()
                                          .expressaoAtual
                                          .toList()
                                          .length ==
                                      7) {
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  FFAppState()
                                      .addToExpressaoAtual(_model.botao8!);
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: '8',
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  _model.botao9 =
                                      await actions.newCustomAction2(
                                    '9',
                                  );
                                  _shouldSetState = true;
                                  if (FFAppState()
                                          .expressaoAtual
                                          .toList()
                                          .length ==
                                      7) {
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  FFAppState()
                                      .addToExpressaoAtual(_model.botao9!);
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: '9',
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.12,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 1.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    _model.botaoSoma =
                                        await actions.newCustomAction2(
                                      '+',
                                    );
                                    _shouldSetState = true;
                                    if (FFAppState()
                                            .expressaoAtual
                                            .toList()
                                            .length ==
                                        7) {
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    FFAppState()
                                        .addToExpressaoAtual(_model.botaoSoma!);
                                    safeSetState(() {});
                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: '+',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.12,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    _model.botaoSubtracao =
                                        await actions.newCustomAction2(
                                      '-',
                                    );
                                    _shouldSetState = true;
                                    if (FFAppState()
                                            .expressaoAtual
                                            .toList()
                                            .length ==
                                        7) {
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    FFAppState().addToExpressaoAtual(
                                        _model.botaoSubtracao!);
                                    safeSetState(() {});
                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: '-',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.12,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    _model.botaoMultiplicacao =
                                        await actions.newCustomAction2(
                                      '*',
                                    );
                                    _shouldSetState = true;
                                    if (FFAppState()
                                            .expressaoAtual
                                            .toList()
                                            .length ==
                                        7) {
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    FFAppState().addToExpressaoAtual(
                                        _model.botaoMultiplicacao!);
                                    safeSetState(() {});
                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: '*',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.12,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    _model.botaoDivisao =
                                        await actions.newCustomAction2(
                                      '/',
                                    );
                                    _shouldSetState = true;
                                    if (FFAppState()
                                            .expressaoAtual
                                            .toList()
                                            .length ==
                                        7) {
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    FFAppState().addToExpressaoAtual(
                                        _model.botaoDivisao!);
                                    safeSetState(() {});
                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: '/',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.12,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    _model.botaoIgual =
                                        await actions.newCustomAction2(
                                      '=',
                                    );
                                    _shouldSetState = true;
                                    if (FFAppState()
                                            .expressaoAtual
                                            .toList()
                                            .length ==
                                        7) {
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    FFAppState().addToExpressaoAtual(
                                        _model.botaoIgual!);
                                    safeSetState(() {});
                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: '=',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.12,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().removeFromExpressaoAtual(
                                      FFAppState().expressaoAtual.last);
                                  safeSetState(() {});
                                },
                                text: '<-',
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.15,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              if (FFAppState().expressaoAtual.length >= 7)
                                Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      if ((FFAppState()
                                                  .expressaoAtual
                                                  .toList()
                                                  .length ==
                                              7) &&
                                          functions.validadeDaExpressao(
                                              FFAppState()
                                                  .expressaoAtual
                                                  .toList())) {
                                        _model.contadorTentativa =
                                            _model.contadorTentativa + 1;
                                        safeSetState(() {});
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(dialogContext)
                                                        .unfocus(),
                                                child:
                                                    ExpressaoInvalidaWidget(),
                                              ),
                                            );
                                          },
                                        );

                                        return;
                                      }

                                      if (_model.contadorTentativa == 1) {
                                        _model.tentativa1 = FFAppState()
                                            .expressaoAtual
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        FFAppState().expressaoAtual = [];
                                        safeSetState(() {});
                                      } else if (_model.contadorTentativa ==
                                          2) {
                                        _model.tentativa2 = FFAppState()
                                            .expressaoAtual
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        FFAppState().expressaoAtual = [];
                                        safeSetState(() {});
                                      } else if (_model.contadorTentativa ==
                                          3) {
                                        _model.tentativa3 = FFAppState()
                                            .expressaoAtual
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        FFAppState().expressaoAtual = [];
                                        safeSetState(() {});
                                      } else if (_model.contadorTentativa ==
                                          4) {
                                        _model.tentativa4 = FFAppState()
                                            .expressaoAtual
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        FFAppState().expressaoAtual = [];
                                        safeSetState(() {});
                                      } else if (_model.contadorTentativa ==
                                          5) {
                                        _model.tentativa5 = FFAppState()
                                            .expressaoAtual
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        FFAppState().expressaoAtual = [];
                                        safeSetState(() {});
                                      } else if (_model.contadorTentativa ==
                                          6) {
                                        _model.tentativa6 = FFAppState()
                                            .expressaoAtual
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        FFAppState().expressaoAtual = [];
                                        safeSetState(() {});
                                      } else {
                                        return;
                                      }
                                    },
                                    text: 'Enter',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.17,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.05,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                            ].divide(SizedBox(width: 30.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

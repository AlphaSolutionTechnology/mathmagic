import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'atividade01_model.dart';
export 'atividade01_model.dart';

class Atividade01Widget extends StatefulWidget {
  const Atividade01Widget({
    super.key,
    double? progressLoad,
  }) : this.progressLoad = progressLoad ?? 0.0;

  final double progressLoad;

  @override
  State<Atividade01Widget> createState() => _Atividade01WidgetState();
}

class _Atividade01WidgetState extends State<Atividade01Widget> {
  late Atividade01Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Atividade01Model());
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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    height: 400.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF9DC6F4),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        75.0, 0.0, 0.0, 0.0),
                                    child: LinearPercentIndicator(
                                      percent: FFAppState().progressState,
                                      width: 250.0,
                                      lineHeight: 15.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).accent4,
                                      barRadius: Radius.circular(20.0),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              constraints: BoxConstraints(
                                minWidth: 300.0,
                                minHeight: 197.0,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF006400),
                                border: Border.all(
                                  color: Color(0xFFD9D9D9),
                                  width: 15.0,
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.apiResulttqq =
                                      await PullQuestionsCall.call();

                                  if ((_model.apiResulttqq?.succeeded ??
                                      true)) {
                                    FFAppState().questionJSON =
                                        (_model.apiResulttqq?.jsonBody ?? '')
                                            .toList()
                                            .cast<dynamic>();
                                    safeSetState(() {});
                                    FFAppState().Question = getJsonField(
                                      FFAppState().questionJSON[
                                          FFAppState().actualQuestion],
                                      r'''$.question''',
                                    ).toString();
                                    safeSetState(() {});
                                    FFAppState().OptionList = functions
                                        .shuffleList(FFAppState().questionJSON[
                                            FFAppState().actualQuestion])
                                        .toList()
                                        .cast<String>();
                                    safeSetState(() {});
                                    FFAppState().thisRightAnswer = getJsonField(
                                      FFAppState().questionJSON[
                                          FFAppState().actualQuestion],
                                      r'''$.answer''',
                                    ).toString();
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                                child: Text(
                                  valueOrDefault<String>(
                                    FFAppState().Question,
                                    'Prepare-se...',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 40.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          FFAppState().choosedOption =
                              FFAppState().OptionList.first;
                          safeSetState(() {});
                        },
                        text: valueOrDefault<String>(
                          FFAppState().OptionList.first,
                          'Carregando...',
                        ),
                        options: FFButtonOptions(
                          width: 300.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).alternate,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          FFAppState().choosedOption =
                              FFAppState().OptionList[1];
                          safeSetState(() {});
                        },
                        text: FFAppState().OptionList[1],
                        options: FFButtonOptions(
                          width: 300.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).alternate,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          FFAppState().choosedOption =
                              FFAppState().OptionList.last;
                          safeSetState(() {});
                        },
                        text: FFAppState().OptionList.last,
                        options: FFButtonOptions(
                          width: 300.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).alternate,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ].divide(SizedBox(height: 40.0)),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.4),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: (FFAppState().choosedOption == null ||
                              FFAppState().choosedOption == '')
                          ? null
                          : () async {
                              if (FFAppState().choosedOption ==
                                  FFAppState().thisRightAnswer) {
                                FFAppState().totalCorrectAnswers =
                                    FFAppState().totalCorrectAnswers + 1;
                                safeSetState(() {});
                                FFAppState().progressState =
                                    FFAppState().progressState + 0.3;
                                safeSetState(() {});
                              } else {
                                FFAppState().progressState =
                                    FFAppState().progressState + 0.3;
                                safeSetState(() {});
                              }

                              if (FFAppState().actualQuestion == 3) {
                                context.pushNamed('XPLAVELPAGE2');

                                FFAppState().actualQuestion = 0;
                                safeSetState(() {});
                              } else {
                                FFAppState().actualQuestion =
                                    FFAppState().actualQuestion + 1;
                                safeSetState(() {});
                                await action_blocks.nextQuestion(context);

                                context.goNamed('Atividade01');
                              }
                            },
                      text: 'Próxima',
                      options: FFButtonOptions(
                        width: 300.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                        disabledColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        disabledTextColor: Color(0xFF090808),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}

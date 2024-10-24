import '/auth/firebase_auth/auth_util.dart';
import '/components/select_persona_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_persona_page_model.dart';
export 'select_persona_page_model.dart';

class SelectPersonaPageWidget extends StatefulWidget {
  const SelectPersonaPageWidget({super.key});

  @override
  State<SelectPersonaPageWidget> createState() =>
      _SelectPersonaPageWidgetState();
}

class _SelectPersonaPageWidgetState extends State<SelectPersonaPageWidget> {
  late SelectPersonaPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectPersonaPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isHomeSelected = false;
      FFAppState().isProfileSelected = false;
      FFAppState().isRevisionSelected = false;
      safeSetState(() {});
    });
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: 369.0,
                  height: 64.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF1D1865),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.9, 0.0),
                        child: Container(
                          width: 90.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color(0x001D1865),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.83, -0.01),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/icon_-_soma_div_mult.svg',
                                    width: 22.0,
                                    height: 22.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              AuthUserStreamWidget(
                                builder: (context) => Text(
                                  'Nível: ${valueOrDefault(currentUserDocument?.playerLevel, 0).toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.38, 0.0),
                        child: Container(
                          width: 64.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.97, 0.0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Color(0xFF960017),
                                    size: 28.0,
                                  ),
                                ),
                                Text(
                                  '${random_data.randomInteger(0, 5).toString()}/5',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.35, 0.0),
                        child: Container(
                          width: 118.0,
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.1, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 25.0,
                                  height: 25.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/images/coin-svgrepo-com.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    formatNumber(
                                      valueOrDefault(
                                          currentUserDocument?.coin, 0),
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.commaDecimal,
                                      currency: '\$',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('chatAiScreen');
                          },
                          child: Container(
                            width: 80.0,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/Clip_path_group.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Text(
                                  'IA',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
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
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: wrapWithModel(
                  model: _model.selectPersonaModel,
                  updateCallback: () => safeSetState(() {}),
                  child: SelectPersonaWidget(),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: 290.0,
                    height: 64.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1865),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-0.7, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 100.0,
                                buttonSize: 50.0,
                                fillColor: valueOrDefault<Color>(
                                  FFAppState().isHomeSelected
                                      ? FlutterFlowTheme.of(context).tertiary
                                      : Color(0xFF1D1865),
                                  Color(0xFF1D1865),
                                ),
                                icon: Icon(
                                  Icons.home,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  FFAppState().isHomeSelected = true;
                                  FFAppState().isRevisionSelected = false;
                                  FFAppState().isProfileSelected = false;

                                  context.pushNamed(
                                    'MainPage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-0.2, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 100.0,
                                buttonSize: 50.0,
                                fillColor: valueOrDefault<Color>(
                                  FFAppState().isRevisionSelected
                                      ? FlutterFlowTheme.of(context).tertiary
                                      : Color(0xFF1D1865),
                                  Color(0xFF1D1865),
                                ),
                                icon: Icon(
                                  Icons.book_rounded,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  // action1
                                  FFAppState().isHomeSelected = false;
                                  FFAppState().isRevisionSelected = true;
                                  FFAppState().isProfileSelected = false;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.2, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 100.0,
                                buttonSize: 50.0,
                                fillColor: valueOrDefault<Color>(
                                  FFAppState().isProfileSelected
                                      ? FlutterFlowTheme.of(context).tertiary
                                      : Color(0xFF1D1865),
                                  Color(0xFF1D1865),
                                ),
                                icon: Icon(
                                  Icons.person,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  FFAppState().isHomeSelected = false;
                                  FFAppState().isRevisionSelected = false;
                                  FFAppState().isProfileSelected = true;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

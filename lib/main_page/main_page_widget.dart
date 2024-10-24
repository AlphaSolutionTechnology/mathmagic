import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<bool>(currentUserDocument?.isFirstLogin, false)) {
        context.pushNamed('LevelPage');
      }
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
        backgroundColor: Color(0xFFF9F7E2),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 371.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF5AA2FF),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Container(
                                                width: 85.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x001D1865),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.83, -0.01),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/icon_-_soma_div_mult.svg',
                                                          width: 23.0,
                                                          height: 23.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Text(
                                                        'Nível: ${valueOrDefault(currentUserDocument?.playerLevel, 0).toString()}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.45, 0.0),
                                              child: Container(
                                                width: 65.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Icon(
                                                              Icons.favorite,
                                                              color: Color(
                                                                  0xFF960017),
                                                              size: 23.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            '${random_data.randomInteger(0, 5).toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.14, 0.0),
                                              child: Container(
                                                width: 107.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 20.0,
                                                        height: 20.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: SvgPicture.asset(
                                                          'assets/images/coin-svgrepo-com.svg',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Text(
                                                          formatNumber(
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.coin,
                                                                0),
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .commaDecimal,
                                                            currency: '\$',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'SelectPersonaPage',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .leftToRight,
                                                        duration: Duration(
                                                            milliseconds: 400),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 80.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/images/Clip_path_group.png',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          'IA',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: PageView(
                                controller: _model.pageViewController ??=
                                    PageController(initialPage: 0),
                                scrollDirection: Axis.vertical,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/Vector_7.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.71, 0.01),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Color(0xFF088F38),
                                                    borderRadius: 100.0,
                                                    borderWidth: 2.4,
                                                    buttonSize: 60.0,
                                                    fillColor:
                                                        Color(0xDE010004),
                                                    icon: Icon(
                                                      Icons.star_border,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.9, 0.57),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Color(0xFF088F38),
                                                    borderRadius: 100.0,
                                                    borderWidth: 2.4,
                                                    buttonSize: 60.0,
                                                    fillColor:
                                                        Color(0xDE010004),
                                                    icon: Icon(
                                                      Icons.star_border,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.65, -0.98),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Color(0xFF088F38),
                                                    borderRadius: 100.0,
                                                    borderWidth: 2.4,
                                                    buttonSize: 60.0,
                                                    fillColor:
                                                        Color(0xDE010004),
                                                    icon: Icon(
                                                      Icons.star_border,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                    showLoadingIndicator: true,
                                                    onPressed: () async {
                                                      await action_blocks
                                                          .callQuestion(
                                                              context);

                                                      context.pushNamed(
                                                          'Atividade01');
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.03, -0.52),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Color(0xFF088F38),
                                                    borderRadius: 100.0,
                                                    borderWidth: 2.4,
                                                    buttonSize: 60.0,
                                                    fillColor:
                                                        Color(0xDE010004),
                                                    icon: Icon(
                                                      Icons.star_border,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                          'Atividade03');
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.92, 0.24),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Color(0xFF088F38),
                                                    borderRadius: 100.0,
                                                    borderWidth: 2.4,
                                                    buttonSize: 60.0,
                                                    fillColor:
                                                        Color(0xDE010004),
                                                    icon: Icon(
                                                      Icons.star_border,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        height: 811.0,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -0.78),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/Vector_7_(1).png',
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.14, -0.07),
                                              child: FlutterFlowIconButton(
                                                borderColor: Color(0xFF088F38),
                                                borderRadius: 100.0,
                                                borderWidth: 2.4,
                                                buttonSize: 60.0,
                                                fillColor: Color(0xDE010004),
                                                icon: Icon(
                                                  Icons.star_border,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.74, 0.41),
                                              child: FlutterFlowIconButton(
                                                borderColor: Color(0xFF088F38),
                                                borderRadius: 100.0,
                                                borderWidth: 2.4,
                                                buttonSize: 60.0,
                                                fillColor: Color(0xDE010004),
                                                icon: Icon(
                                                  Icons.star_border,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.45, -0.8),
                                              child: FlutterFlowIconButton(
                                                borderColor: Color(0xFF088F38),
                                                borderRadius: 100.0,
                                                borderWidth: 2.4,
                                                buttonSize: 60.0,
                                                fillColor: Color(0xDE010004),
                                                icon: Icon(
                                                  Icons.star_border,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.91, -0.43),
                                              child: FlutterFlowIconButton(
                                                borderColor: Color(0xFF088F38),
                                                borderRadius: 100.0,
                                                borderWidth: 2.4,
                                                buttonSize: 60.0,
                                                fillColor: Color(0xDE010004),
                                                icon: Icon(
                                                  Icons.star_border,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.94, 0.3),
                                              child: FlutterFlowIconButton(
                                                borderColor: Color(0xFF088F38),
                                                borderRadius: 100.0,
                                                borderWidth: 2.4,
                                                buttonSize: 60.0,
                                                fillColor: Color(0xDE010004),
                                                icon: Icon(
                                                  Icons.star_border,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          height: 811.0,
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -0.8),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Vector_7_(2).png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.06, -0.13),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Color(0xFF088F38),
                                                  borderRadius: 100.0,
                                                  borderWidth: 2.4,
                                                  buttonSize: 60.0,
                                                  fillColor: Color(0xDE010004),
                                                  icon: Icon(
                                                    Icons.star_border,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.96, 0.43),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Color(0xFF088F38),
                                                  borderRadius: 100.0,
                                                  borderWidth: 2.4,
                                                  buttonSize: 60.0,
                                                  fillColor: Color(0xDE010004),
                                                  icon: Icon(
                                                    Icons.star_border,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.49, -0.86),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Color(0xFF088F38),
                                                  borderRadius: 100.0,
                                                  borderWidth: 2.4,
                                                  buttonSize: 60.0,
                                                  fillColor: Color(0xDE010004),
                                                  icon: Icon(
                                                    Icons.star_border,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.68, -0.55),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Color(0xFF088F38),
                                                  borderRadius: 100.0,
                                                  borderWidth: 2.4,
                                                  buttonSize: 60.0,
                                                  fillColor: Color(0xDE010004),
                                                  icon: Icon(
                                                    Icons.star_border,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.85, 0.27),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Color(0xFF088F38),
                                                  borderRadius: 100.0,
                                                  borderWidth: 2.4,
                                                  buttonSize: 60.0,
                                                  fillColor: Color(0xDE010004),
                                                  icon: Icon(
                                                    Icons.star_border,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
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
                Align(
                  alignment: AlignmentDirectional(0.0, 1.06),
                  child: Container(
                    width: 393.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF5AA2FF),
                      borderRadius: BorderRadius.circular(0.0),
                      shape: BoxShape.rectangle,
                    ),
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 0.0,
                                borderWidth: 0.0,
                                buttonSize: 50.0,
                                fillColor: FFAppState().isHomeSelected
                                    ? Color(0xFFA8A8A8)
                                    : Color(0x00000000),
                                icon: Icon(
                                  Icons.home,
                                  color: FFAppState().isHomeSelected
                                      ? Color(0xFF71EC42)
                                      : Colors.white,
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
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 100.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.book_rounded,
                                  color: valueOrDefault<Color>(
                                    FFAppState().isRevisionSelected
                                        ? Color(0xFFA8FF40)
                                        : Colors.white,
                                    Colors.white,
                                  ),
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
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 100.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.person,
                                  color: valueOrDefault<Color>(
                                    FFAppState().isProfileSelected
                                        ? Color(0xFF97FF46)
                                        : Colors.white,
                                    Colors.white,
                                  ),
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  FFAppState().isHomeSelected = false;
                                  FFAppState().isRevisionSelected = false;
                                  FFAppState().isProfileSelected = true;
                                  safeSetState(() {});

                                  context.pushNamed('profilepage');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('OnBoarding', context.mounted);
                  },
                  text: 'Button',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}

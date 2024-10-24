import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future<bool?> activateButton(BuildContext context) async {
  FFAppState().isContinueLevelButtonActive = true;

  return null;
}

Future chooseOption(BuildContext context) async {}

Future callQuestion(BuildContext context) async {
  ApiCallResponse? apiResulttqq;

  apiResulttqq = await CallQuestionGroup.callAditionCall.call();

  if ((apiResulttqq?.succeeded ?? true)) {
    FFAppState().questionJSON =
        (apiResulttqq?.jsonBody ?? '').toList().cast<dynamic>();
    FFAppState().Question = getJsonField(
      FFAppState().questionJSON[FFAppState().actualQuestion],
      r'''$.question''',
    ).toString().toString();
    FFAppState().OptionList = functions
        .shuffleList(FFAppState().questionJSON[FFAppState().actualQuestion])
        .toList()
        .cast<String>();
    FFAppState().thisRightAnswer = getJsonField(
      FFAppState().questionJSON[FFAppState().actualQuestion],
      r'''$.answer''',
    ).toString().toString();
  }
}

Future nextQuestion(BuildContext context) async {
  FFAppState().Question = getJsonField(
    FFAppState().questionJSON[FFAppState().actualQuestion],
    r'''$.question''',
  ).toString().toString();
  FFAppState().OptionList = functions
      .shuffleList(FFAppState().questionJSON[FFAppState().actualQuestion])
      .toList()
      .cast<String>();
  FFAppState().thisRightAnswer = getJsonField(
    FFAppState().questionJSON[FFAppState().actualQuestion],
    r'''$.answer''',
  ).toString().toString();
}

Future input(BuildContext context) async {
  if (!((List<String> expressaoAtual) {
    return expressaoAtual.length <= 6;
  }(FFAppState().expressaoAtual.toList()))) {
    return;
  }
}

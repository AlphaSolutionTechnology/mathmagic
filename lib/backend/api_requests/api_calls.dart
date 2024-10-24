import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start GROQ Group Code

class GroqGroup {
  static String getBaseUrl() => 'https://api.groq.com/openai/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };
  static SendFullPromptCall sendFullPromptCall = SendFullPromptCall();
}

class SendFullPromptCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
    String? prompt = '',
  }) async {
    final baseUrl = GroqGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "model": "llama-3.1-70b-versatile",
  "messages": [
    {
      "role": "user",
      "content": "${prompt}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Full Prompt',
      apiUrl: '${baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization':
            'Bearer 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',
        'Content-Type': 'application/json;charset=utf-8',
        'Accept-Encoding': 'gzip, deflate, br',
        'Accept-Language': 'pt-BR',
        'Cache-Control': 'no-cache',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? createdTimestamp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created''',
      ));
  String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.role''',
      ));
  String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

/// End GROQ Group Code

/// Start call question Group Code

class CallQuestionGroup {
  static String getBaseUrl() => 'https://questions-s5kn.onrender.com/question';
  static Map<String, String> headers = {
    'x-api-key': '1508c0ae4e57cae397c0884c3caf6beb',
  };
  static CallAditionCall callAditionCall = CallAditionCall();
  static CallMultiplicationCall callMultiplicationCall =
      CallMultiplicationCall();
  static CallSubtractionCall callSubtractionCall = CallSubtractionCall();
  static CallDivisionCall callDivisionCall = CallDivisionCall();
}

class CallAditionCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = CallQuestionGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'callAdition',
      apiUrl: '${baseUrl}/getquestion',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '1508c0ae4e57cae397c0884c3caf6beb',
        'Content-Type': 'application/json;charset=utf-8',
      },
      params: {
        'topic': "addition",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CallMultiplicationCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = CallQuestionGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'callMultiplication',
      apiUrl: '${baseUrl}/getquestion',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '1508c0ae4e57cae397c0884c3caf6beb',
        'Content-Type': 'application/json;charset=utf-8',
      },
      params: {
        'topic': "multiplication",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CallSubtractionCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = CallQuestionGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'callSubtraction',
      apiUrl: '${baseUrl}/getquestion',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '1508c0ae4e57cae397c0884c3caf6beb',
        'Content-Type': 'application/json;charset=utf-8',
      },
      params: {
        'topic': "subtraction",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CallDivisionCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = CallQuestionGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'callDivision',
      apiUrl: '${baseUrl}/getquestion',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '1508c0ae4e57cae397c0884c3caf6beb',
        'Content-Type': 'application/json;charset=utf-8',
      },
      params: {
        'topic': "division",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End call question Group Code

class PullQuestionsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'pull questions',
      apiUrl: 'https://questions-s5kn.onrender.com/question/getquestion',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '1508c0ae4e57cae397c0884c3caf6beb',
        'Content-Type': 'application/json; charset=utf-8',
      },
      params: {
        'topic': "multiplication",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

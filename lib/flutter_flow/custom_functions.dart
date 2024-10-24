import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  // If chatHistory isn't a list, make it a list and then add newChat
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSON(String prompt) {
  return json.decode(
      '{"model": "llama-3.1-70b-versatile","messages": [{"role": "user","content": "$prompt"}]}');
  // Cria o JSON com o formato que você especificou
}

String decodeToUtf(String utf) {
  try {
    return utf8.decode(latin1.encode(utf));
  } catch (e) {
    return utf;
  }
}

dynamic alterContentInJson(dynamic json) {
  String newContent = "";
  if (json is Map) {
    return json.map((key, value) {
      if (key == "content") {
        newContent = decodeToUtf(value);
        return MapEntry(key, newContent);
      }
      return MapEntry(key, alterContentInJson(value));
    });
  }

  if (json is List) {
    return json.map((element) => alterContentInJson(element)).toList();
  }

  return json;
}

List<String> processAnswerFromAPI(String str) {
  final String questionDelimiter = 'Pergunta: "';
  final String answerDelimiter = 'Resposta: "';

  final int questionStart =
      str.indexOf(questionDelimiter) + questionDelimiter.length;
  final int questionEnd = str.indexOf('";', questionStart);

  final int answerStart = str.indexOf(answerDelimiter) + answerDelimiter.length;
  final int answerEnd = str.indexOf('";', answerStart);

  if (questionStart < 0 ||
      answerStart < 0 ||
      questionEnd < 0 ||
      answerEnd < 0) {
    throw FormatException('Invalid input format');
  }

  String question = str.substring(questionStart, questionEnd);
  String answer = str.substring(answerStart, answerEnd);

  return [question, answer];
}

List<String> shuffleList(dynamic unshuffledList) {
  List<String> options = [];

  options.add(unshuffledList['answer']);
  options.add(unshuffledList['wrong_answer']);
  options.add(unshuffledList['second_wrong_answer']);

  options.shuffle();

  return options;
}

String transformInString(List<String> listOfData) {
  return listOfData.toString();
}

List<String> splitBySpace(String inputString) {
  return inputString.split(' ');
}

List<String> returnPageState(List<String> pageParam) {
  return pageParam;
}

bool validadeDaExpressao(List<String> expressaoAtual) {
  // Encontra o sinal de igual
  int equalIndex = expressaoAtual.indexOf("=");
  if (equalIndex == -1 ||
      equalIndex == 0 ||
      equalIndex == expressaoAtual.length - 1) {
    return false; // Se não houver "=", ou se "=" for o primeiro ou último, é inválida
  }

  // Parte esquerda da expressão
  List<String> leftExpression = expressaoAtual.sublist(0, equalIndex);

  // Parte direita da expressão
  List<String> rightExpression = expressaoAtual.sublist(equalIndex + 1);

  // Avalia a parte esquerda
  int? leftValue = evaluateExpression(leftExpression);
  if (leftValue == null) {
    return false; // Se a parte esquerda não for válida
  }

  // Avalia a parte direita
  int? rightValue = evaluateExpression(rightExpression);
  if (rightValue == null) {
    return false; // Se a parte direita não for válida
  }

  // Compara os valores
  return leftValue == rightValue;
}

int? evaluateExpression(List<String> expression) {
  // Função genérica que avalia qualquer lado da expressão

  List<String> operators = ["+", "-", "*", "/"];
  int? result;
  String? currentOperator;

  int? parseNumber(String str) {
    try {
      return int.parse(str);
    } catch (e) {
      return null; // Retorna null se não for um número
    }
  }

  if (expression.length == 1) {
    return parseNumber(
        expression[0]); // Se for uma única entrada, deve ser um número
  }

  for (int i = 0; i < expression.length; i++) {
    String token = expression[i];

    if (i % 2 == 0) {
      // Espera-se um número em posições pares
      int? num = parseNumber(token);
      if (num == null) {
        return null; // Expressão inválida se não for um número
      }
      if (result == null) {
        result = num; // Define o primeiro número
      } else if (currentOperator != null) {
        // Realiza a operação de acordo com o operador atual
        if (currentOperator == "+") {
          result += num;
        } else if (currentOperator == "-") {
          result -= num;
        } else if (currentOperator == "*") {
          result *= num;
        } else if (currentOperator == "/") {
          if (num == 0) return null; // Divisão por zero é inválida
          result ~/= num; // Divisão inteira
        }
      }
    } else {
      // Espera-se um operador em posições ímpares
      if (!operators.contains(token)) {
        return null; // Operador inválido
      }
      currentOperator = token;
    }
  }

  return result;
}

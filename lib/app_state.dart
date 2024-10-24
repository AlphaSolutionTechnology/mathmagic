import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userObjective = prefs.getString('ff_userObjective') ?? _userObjective;
    });
    _safeInit(() {
      _userActualLevel =
          prefs.getString('ff_userActualLevel') ?? _userActualLevel;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isHomeSelected = false;
  bool get isHomeSelected => _isHomeSelected;
  set isHomeSelected(bool value) {
    _isHomeSelected = value;
  }

  bool _isRevisionSelected = false;
  bool get isRevisionSelected => _isRevisionSelected;
  set isRevisionSelected(bool value) {
    _isRevisionSelected = value;
  }

  bool _isProfileSelected = false;
  bool get isProfileSelected => _isProfileSelected;
  set isProfileSelected(bool value) {
    _isProfileSelected = value;
  }

  String _userObjective = '';
  String get userObjective => _userObjective;
  set userObjective(String value) {
    _userObjective = value;
    prefs.setString('ff_userObjective', value);
  }

  String _userActualLevel = '';
  String get userActualLevel => _userActualLevel;
  set userActualLevel(String value) {
    _userActualLevel = value;
    prefs.setString('ff_userActualLevel', value);
  }

  bool _isContinueLevelButtonActive = false;
  bool get isContinueLevelButtonActive => _isContinueLevelButtonActive;
  set isContinueLevelButtonActive(bool value) {
    _isContinueLevelButtonActive = value;
  }

  List<bool> _botoesVisiveis = [];
  List<bool> get botoesVisiveis => _botoesVisiveis;
  set botoesVisiveis(List<bool> value) {
    _botoesVisiveis = value;
  }

  void addToBotoesVisiveis(bool value) {
    botoesVisiveis.add(value);
  }

  void removeFromBotoesVisiveis(bool value) {
    botoesVisiveis.remove(value);
  }

  void removeAtIndexFromBotoesVisiveis(int index) {
    botoesVisiveis.removeAt(index);
  }

  void updateBotoesVisiveisAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    botoesVisiveis[index] = updateFn(_botoesVisiveis[index]);
  }

  void insertAtIndexInBotoesVisiveis(int index, bool value) {
    botoesVisiveis.insert(index, value);
  }

  List<String> _respostasClicadas = [];
  List<String> get respostasClicadas => _respostasClicadas;
  set respostasClicadas(List<String> value) {
    _respostasClicadas = value;
  }

  void addToRespostasClicadas(String value) {
    respostasClicadas.add(value);
  }

  void removeFromRespostasClicadas(String value) {
    respostasClicadas.remove(value);
  }

  void removeAtIndexFromRespostasClicadas(int index) {
    respostasClicadas.removeAt(index);
  }

  void updateRespostasClicadasAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    respostasClicadas[index] = updateFn(_respostasClicadas[index]);
  }

  void insertAtIndexInRespostasClicadas(int index, String value) {
    respostasClicadas.insert(index, value);
  }

  String _userInput = '';
  String get userInput => _userInput;
  set userInput(String value) {
    _userInput = value;
  }

  String _initialPrompt =
      'Agora você é um mestre em matematica, sua personalidade é a que eu vou colocar no final, voce deve ensinar bem matematica, não responda o que tiver entre os marcadores :;  apenas siga a instrução por exemplo voce não deve falar: ok, agora sou professor de matematica,  garanta que a resposta seja correta e que seja em português mesmo que eu fale em inglês, limite-se a responder coisas de matemática ou coisas que estão relacionadas a sua personalidade, qualquer coisa relacionada a outro assunto diga apenas que Não posso falar sobre isso agora';
  String get initialPrompt => _initialPrompt;
  set initialPrompt(String value) {
    _initialPrompt = value;
  }

  String _personality =
      'sua personalidade é de um mestre matemático misturado com a personalidade de um mago ancião';
  String get personality => _personality;
  set personality(String value) {
    _personality = value;
  }

  SelectedPerson? _selectedPerson = SelectedPerson.Mago;
  SelectedPerson? get selectedPerson => _selectedPerson;
  set selectedPerson(SelectedPerson? value) {
    _selectedPerson = value;
  }

  String _Question = '';
  String get Question => _Question;
  set Question(String value) {
    _Question = value;
  }

  List<String> _OptionList = [];
  List<String> get OptionList => _OptionList;
  set OptionList(List<String> value) {
    _OptionList = value;
  }

  void addToOptionList(String value) {
    OptionList.add(value);
  }

  void removeFromOptionList(String value) {
    OptionList.remove(value);
  }

  void removeAtIndexFromOptionList(int index) {
    OptionList.removeAt(index);
  }

  void updateOptionListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    OptionList[index] = updateFn(_OptionList[index]);
  }

  void insertAtIndexInOptionList(int index, String value) {
    OptionList.insert(index, value);
  }

  String _choosedOption = '';
  String get choosedOption => _choosedOption;
  set choosedOption(String value) {
    _choosedOption = value;
  }

  int _totalCorrectAnswers = 0;
  int get totalCorrectAnswers => _totalCorrectAnswers;
  set totalCorrectAnswers(int value) {
    _totalCorrectAnswers = value;
  }

  String _thisRightAnswer = '';
  String get thisRightAnswer => _thisRightAnswer;
  set thisRightAnswer(String value) {
    _thisRightAnswer = value;
  }

  List<dynamic> _questionJSON = [];
  List<dynamic> get questionJSON => _questionJSON;
  set questionJSON(List<dynamic> value) {
    _questionJSON = value;
  }

  void addToQuestionJSON(dynamic value) {
    questionJSON.add(value);
  }

  void removeFromQuestionJSON(dynamic value) {
    questionJSON.remove(value);
  }

  void removeAtIndexFromQuestionJSON(int index) {
    questionJSON.removeAt(index);
  }

  void updateQuestionJSONAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    questionJSON[index] = updateFn(_questionJSON[index]);
  }

  void insertAtIndexInQuestionJSON(int index, dynamic value) {
    questionJSON.insert(index, value);
  }

  int _actualQuestion = 0;
  int get actualQuestion => _actualQuestion;
  set actualQuestion(int value) {
    _actualQuestion = value;
  }

  List<String> _expressaoAtual = [];
  List<String> get expressaoAtual => _expressaoAtual;
  set expressaoAtual(List<String> value) {
    _expressaoAtual = value;
  }

  void addToExpressaoAtual(String value) {
    expressaoAtual.add(value);
  }

  void removeFromExpressaoAtual(String value) {
    expressaoAtual.remove(value);
  }

  void removeAtIndexFromExpressaoAtual(int index) {
    expressaoAtual.removeAt(index);
  }

  void updateExpressaoAtualAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    expressaoAtual[index] = updateFn(_expressaoAtual[index]);
  }

  void insertAtIndexInExpressaoAtual(int index, String value) {
    expressaoAtual.insert(index, value);
  }

  double _progressState = 0.0;
  double get progressState => _progressState;
  set progressState(double value) {
    _progressState = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

import '/components/confirma_sair_widget.dart';
import '/components/expressao_invalida_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'atividade03_widget.dart' show Atividade03Widget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Atividade03Model extends FlutterFlowModel<Atividade03Widget> {
  ///  Local state fields for this page.

  List<String> expressaoCorreta = [];
  void addToExpressaoCorreta(String item) => expressaoCorreta.add(item);
  void removeFromExpressaoCorreta(String item) => expressaoCorreta.remove(item);
  void removeAtIndexFromExpressaoCorreta(int index) =>
      expressaoCorreta.removeAt(index);
  void insertAtIndexInExpressaoCorreta(int index, String item) =>
      expressaoCorreta.insert(index, item);
  void updateExpressaoCorretaAtIndex(int index, Function(String) updateFn) =>
      expressaoCorreta[index] = updateFn(expressaoCorreta[index]);

  String? expressaoEscolhida;

  int contadorTentativa = 0;

  List<String> tentativa1 = [];
  void addToTentativa1(String item) => tentativa1.add(item);
  void removeFromTentativa1(String item) => tentativa1.remove(item);
  void removeAtIndexFromTentativa1(int index) => tentativa1.removeAt(index);
  void insertAtIndexInTentativa1(int index, String item) =>
      tentativa1.insert(index, item);
  void updateTentativa1AtIndex(int index, Function(String) updateFn) =>
      tentativa1[index] = updateFn(tentativa1[index]);

  List<String> tentativa2 = [];
  void addToTentativa2(String item) => tentativa2.add(item);
  void removeFromTentativa2(String item) => tentativa2.remove(item);
  void removeAtIndexFromTentativa2(int index) => tentativa2.removeAt(index);
  void insertAtIndexInTentativa2(int index, String item) =>
      tentativa2.insert(index, item);
  void updateTentativa2AtIndex(int index, Function(String) updateFn) =>
      tentativa2[index] = updateFn(tentativa2[index]);

  List<String> tentativa3 = [];
  void addToTentativa3(String item) => tentativa3.add(item);
  void removeFromTentativa3(String item) => tentativa3.remove(item);
  void removeAtIndexFromTentativa3(int index) => tentativa3.removeAt(index);
  void insertAtIndexInTentativa3(int index, String item) =>
      tentativa3.insert(index, item);
  void updateTentativa3AtIndex(int index, Function(String) updateFn) =>
      tentativa3[index] = updateFn(tentativa3[index]);

  List<String> tentativa4 = [];
  void addToTentativa4(String item) => tentativa4.add(item);
  void removeFromTentativa4(String item) => tentativa4.remove(item);
  void removeAtIndexFromTentativa4(int index) => tentativa4.removeAt(index);
  void insertAtIndexInTentativa4(int index, String item) =>
      tentativa4.insert(index, item);
  void updateTentativa4AtIndex(int index, Function(String) updateFn) =>
      tentativa4[index] = updateFn(tentativa4[index]);

  List<String> tentativa5 = [];
  void addToTentativa5(String item) => tentativa5.add(item);
  void removeFromTentativa5(String item) => tentativa5.remove(item);
  void removeAtIndexFromTentativa5(int index) => tentativa5.removeAt(index);
  void insertAtIndexInTentativa5(int index, String item) =>
      tentativa5.insert(index, item);
  void updateTentativa5AtIndex(int index, Function(String) updateFn) =>
      tentativa5[index] = updateFn(tentativa5[index]);

  List<String> tentativa6 = [];
  void addToTentativa6(String item) => tentativa6.add(item);
  void removeFromTentativa6(String item) => tentativa6.remove(item);
  void removeAtIndexFromTentativa6(int index) => tentativa6.removeAt(index);
  void insertAtIndexInTentativa6(int index, String item) =>
      tentativa6.insert(index, item);
  void updateTentativa6AtIndex(int index, Function(String) updateFn) =>
      tentativa6[index] = updateFn(tentativa6[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // Stores action output result for [Custom Action - newCustomAction2] action in opcao0 widget.
  String? botao0;
  // Stores action output result for [Custom Action - newCustomAction2] action in opcao1 widget.
  String? botao1;
  // Stores action output result for [Custom Action - newCustomAction2] action in opcao2 widget.
  String? botao2;
  // Stores action output result for [Custom Action - newCustomAction2] action in opcao3 widget.
  String? botao3;
  // Stores action output result for [Custom Action - newCustomAction2] action in opcao4 widget.
  String? botao4;
  // Stores action output result for [Custom Action - newCustomAction2] action in opcao5 widget.
  String? botao5;
  // Stores action output result for [Custom Action - newCustomAction2] action in opcao6 widget.
  String? botao6;
  // Stores action output result for [Custom Action - newCustomAction2] action in opcao7 widget.
  String? botao7;
  // Stores action output result for [Custom Action - newCustomAction2] action in opcao8 widget.
  String? botao8;
  // Stores action output result for [Custom Action - newCustomAction2] action in opcao9 widget.
  String? botao9;
  // Stores action output result for [Custom Action - newCustomAction2] action in soma widget.
  String? botaoSoma;
  // Stores action output result for [Custom Action - newCustomAction2] action in subtracao widget.
  String? botaoSubtracao;
  // Stores action output result for [Custom Action - newCustomAction2] action in multiplicacao widget.
  String? botaoMultiplicacao;
  // Stores action output result for [Custom Action - newCustomAction2] action in divisao widget.
  String? botaoDivisao;
  // Stores action output result for [Custom Action - newCustomAction2] action in igualdade widget.
  String? botaoIgual;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}

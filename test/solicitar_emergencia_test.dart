// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/models/ModelProvider.dart';
import 'package:hmv_care_app/app/data/providers/emergencias/emergencias_amplify.dart';
import 'package:hmv_care_app/app/modules/emergencia/perguntas.dart';
import 'package:hmv_care_app/app/modules/emergencia/solicitar_emergencia_controller.dart';

void main() {
  Pacientes paciente = Pacientes(
      data_nascimento: '12/05/1960', fumante: true, peso: '80', altura: '1,70');
  SolicitarEmergenciaController controller =
      SolicitarEmergenciaController(EmergenciasAmplify(), paciente);
  test('Risco Médio', () {
    Map<String, String> questionario = {};

    questionario[perguntas[1]!] = "NÃO";
    questionario[perguntas[2]!] = "NÃO";
    questionario[perguntas[3]!] = "NÃO";
    questionario[perguntas[4]!] = "NÃO";
    questionario[perguntas[5]!] = "NÃO";
    questionario[perguntas[6]!] = "NÃO";
    var risco = controller.calcularRisco(questionario);
    expect(risco, EmergenciaSeveridadeEnum.MEDIO);
  });
  test('Risco Alto', () {
    Map<String, String> questionario = {};

    questionario[perguntas[1]!] = "SIM";
    questionario[perguntas[2]!] = "SIM";
    questionario[perguntas[3]!] = "SIM";
    questionario[perguntas[4]!] = "SIM";
    questionario[perguntas[5]!] = "SIM";
    questionario[perguntas[6]!] = "SIM";
    var risco = controller.calcularRisco(questionario);
    expect(risco, EmergenciaSeveridadeEnum.GRAVE);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/models/ModelProvider.dart';
import 'package:hmv_care_app/app/data/providers/pacientes/pacientes_amplify.dart';
import 'package:hmv_care_app/app/modules/habitos/habitos_controller.dart';

void main() {
  Pacientes paciente = Pacientes();
  HabitosController controller =
      HabitosController(PacientesAmplify(), paciente);
  group('Teste Altura: ', () {
    test('Negativa', () {
      expect(controller.checkAltura('-1.50'), false);
    });
    test('Fora do normal', () {
      expect(controller.checkAltura('150'), false);
    });
    test('Formato inválido', () {
      expect(controller.checkAltura('1+25'), false);
    });
    test('Com letras', () {
      expect(controller.checkAltura('1,25 m'), false);
    });
    test('Formato válido com virgula', () {
      expect(controller.checkAltura('1,25'), true);
    });
    test('Formato válido com ponto', () {
      expect(controller.checkAltura('1.25'), true);
    });
  });

  group('Teste Peso: ', () {
    test('Negativa', () {
      expect(controller.checkPeso('-80'), false);
    });
    test('Zero', () {
      expect(controller.checkPeso('0'), false);
    });
    test('Fora do normal', () {
      expect(controller.checkPeso('1500'), false);
    });
    test('Formato inválido', () {
      expect(controller.checkPeso('87+65'), false);
    });
    test('Com letras', () {
      expect(controller.checkPeso('87 kg'), false);
    });
    test('Formato válido com decimal', () {
      expect(controller.checkPeso('87,95'), true);
      expect(controller.checkPeso('87.95'), true);
    });
    test('Formato válido', () {
      expect(controller.checkPeso('80'), true);
    });
  });
}

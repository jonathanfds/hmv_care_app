import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/models/QuestionarioPergunta.dart';
import 'package:hmv_care_app/core/utils/functions.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/ModelProvider.dart';
import '../../data/repositories/emergencias_repository.dart';
import 'perguntas.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class SolicitarEmergenciaController extends GetxController {
  late Pacientes _paciente;
  IEmergenciasRepository _emergenciasRepository;
  SolicitarEmergenciaController(this._emergenciasRepository, this._paciente);

  final _dorPeito = Rxn<bool>();
  set dorPeito(value) => _dorPeito.value = value;
  get dorPeito => _dorPeito.value;

  final _difRespirar = Rxn<bool>();
  set difRespirar(value) => _difRespirar.value = value;
  get difRespirar => _difRespirar.value;

  final _dorCabeca = Rxn<bool>();
  set dorCabeca(value) => _dorCabeca.value = value;
  get dorCabeca => _dorCabeca.value;

  final _dorAbdominal = Rxn<bool>();
  set dorAbdominal(value) => _dorAbdominal.value = value;
  get dorAbdominal => _dorAbdominal.value;

  final _senteNausea = Rxn<bool>();
  set senteNausea(value) => _senteNausea.value = value;
  get senteNausea => _senteNausea.value;

  final _alteracaoCardiaca = Rxn<bool>();
  set alteracaoCardiaca(value) => _alteracaoCardiaca.value = value;
  get alteracaoCardiaca => _alteracaoCardiaca.value;

  final _loading = false.obs;
  set loading(value) => _loading.value = value;
  get loading => _loading.value;

  final _complete = false.obs;
  set complete(value) => _complete.value = value;
  get complete => _complete.value;

  @override
  void onInit() async {
    super.onInit();
  }

  confirmarEmergencia() async {
    loading = true;
    await Future.delayed(const Duration(seconds: 2));
    Map<String, String> questionario = {};

    questionario[perguntas[1]!] = dorPeito == true ? "SIM" : "NÃO";
    questionario[perguntas[2]!] = difRespirar == true ? "SIM" : "NÃO";
    questionario[perguntas[3]!] = dorCabeca == true ? "SIM" : "NÃO";
    questionario[perguntas[4]!] = dorAbdominal == true ? "SIM" : "NÃO";
    questionario[perguntas[5]!] = senteNausea == true ? "SIM" : "NÃO";
    questionario[perguntas[6]!] = alteracaoCardiaca == true ? "SIM" : "NÃO";

    String formattedDate =
        DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());
    Emergencia emergencia = Emergencia(
        data: formattedDate,
        paciente: _paciente,
        emergenciaPacienteId: _paciente.id,
        status: EmergenciaStatusEnum.ABERTO,
        severidade: calcularRisco(questionario),
        questionario: questionario.entries
            .map(
                (e) => QuestionarioPergunta(pergunta: e.key, resposta: e.value))
            .toList());

    var result = await _emergenciasRepository.insert(emergencia);
    loading = false;
    complete = result;
    if (result) {}
  }

  EmergenciaSeveridadeEnum calcularRisco(Map<String, String> questionario) {
    var idade = calc_idade(_paciente.data_nascimento!);
    var imc = calc_imc(_paciente.peso!, _paciente.altura!);
    var pontos = 0;
    if (idade >= 10 && idade <= 20) {
      pontos += 1;
    } else if (idade > 20 && idade <= 30) {
      pontos += 2;
    } else if (idade > 30 && idade <= 40) {
      pontos += 3;
    } else if (idade > 40 && idade <= 50) {
      pontos += 4;
    } else if (idade > 50 && idade <= 60) {
      pontos += 5;
      if (_paciente.fumante!) {
        pontos += 4;
      }
    } else if (idade > 60) {
      pontos += 6;
      if (_paciente.fumante!) {
        pontos += 6;
      }
    }
    if (_paciente.fumante! && idade <= 50) {
      pontos += 2;
    }
    if (_paciente.atividade_fisica == AtividadeFisicaEnum.SEDENTARIO) {
      pontos += 4;
    }
    EmergenciaSeveridadeEnum risco = EmergenciaSeveridadeEnum.LEVE;
    int countSim = questionario.values.where((t) => t == "SIM").length;
    if (countSim > 3) {
      risco = EmergenciaSeveridadeEnum.GRAVE;
    } else if (countSim >= 3 && pontos > 10) {
      risco = EmergenciaSeveridadeEnum.GRAVE;
    } else if (countSim > 1 || (pontos > 4 && pontos <= 10)) {
      risco = EmergenciaSeveridadeEnum.MEDIO;
    }
    return risco;
  }

  Future openMapsHMV() async {
    //await MapsLauncher.launchQuery('R. Ramiro Barcelos, 910 - Moinhos de Vento, Porto Alegre - RS, 90035-000');
    await launch(
        'https://www.google.com/maps/place/Hospital+Moinhos+de+Vento/@-30.0250744,-51.2106763,17z/data=!3m1!4b1!4m5!3m4!1s0x951979b07aa72de9:0x5cdcc40ab2e5bf89!8m2!3d-30.0250791!4d-51.2084876');
  }

  Future openCallHMV() async {
    //(51) 3314-3434
    await launch('tel:+55513314-3434');
  }
}

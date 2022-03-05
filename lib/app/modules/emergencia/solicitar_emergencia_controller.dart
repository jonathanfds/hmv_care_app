import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/emergencia.dart';
import '../../data/models/paciente.dart';
import '../../data/repositories/emergencias_repository.dart';
import 'perguntas.dart';

class SolicitarEmergenciaController extends GetxController {
  late Paciente _paciente;
  EmergenciasRepository _emergenciasRepository;
  SolicitarEmergenciaController(this._emergenciasRepository);

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
    _paciente = Get.arguments as Paciente;
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

    var dateNow = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss').format(dateNow);
    Emergencia emergencia = Emergencia(
        id: Uuid().v4(),
        data: formattedDate,
        paciente: _paciente,
        questionario: questionario);

    var result = await _emergenciasRepository.insert(emergencia);
    loading = false;
    complete = result;
    if (result) {}
  }
}

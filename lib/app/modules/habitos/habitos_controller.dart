import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/models/ModelProvider.dart';
import 'package:intl/intl.dart';

import '../../data/repositories/pacientes_repository.dart';

class HabitosController extends GetxController {
  TextEditingController alergiaRemediosController = TextEditingController();
  TextEditingController remediosControladosController = TextEditingController();
  TextEditingController doencasController = TextEditingController();
  TextEditingController observacoesController = TextEditingController();
  final IPacientesRepository _pacientesRepository;
  final Pacientes _paciente;

  HabitosController(this._pacientesRepository)
      : _paciente = Get.arguments as Pacientes;

  final _loading = false.obs;
  set loading(value) => _loading.value = value;
  get loading => _loading.value;

  @override
  void onInit() async {
    super.onInit();
    loadInfo();
  }

  final _alergiaMedicamento = Rxn<bool>();
  set alergiaMedicamento(value) => _alergiaMedicamento.value = value;
  get alergiaMedicamento => _alergiaMedicamento.value;

  final _medicamentoControlado = Rxn<bool>();
  set medicamentoControlado(value) => _medicamentoControlado.value = value;
  get medicamentoControlado => _medicamentoControlado.value;

  final _historicoCardiaco = Rxn<bool>();
  set historicoCardiaco(value) => _historicoCardiaco.value = value;
  get historicoCardiaco => _historicoCardiaco.value;

  final _fumante = Rxn<bool>();
  set fumante(value) => _fumante.value = value;
  get fumante => _fumante.value;

  final _bebida = Rxn<bool>();
  set bebida(value) => _bebida.value = value;
  get bebida => _bebida.value;

  final _atividadeFisica = atividadeFisicaOpcoes[0].obs;
  set atividadeFisica(value) => _atividadeFisica.value = value;
  get atividadeFisica => _atividadeFisica.value;

  final _doencas = Rxn<bool>();
  set doencas(value) => _doencas.value = value;
  get doencas => _doencas.value;

  static const atividadeFisicaOpcoes = [
    '1 vez por semana',
    '2 ou 3 vezes por semana',
    '4 ou 5 vezes por semana',
    '6 ou mais vezes por semana',
    'Não pratica'
  ];

  loadInfo() {
    if (_paciente.atividade_fisica != null) {
      atividadeFisica = atividadeFisicaOpcoes[
          AtividadeFisicaEnum.values.indexOf(_paciente.atividade_fisica!)];
    }
    bebida = _paciente.bebida_alcoolica;
    fumante = _paciente.fumante;

    alergiaMedicamento =
        _paciente.remedios_alergia?.isEmpty == true ? false : true;

    medicamentoControlado =
        _paciente.remedios_controlados?.isEmpty == true ? false : true;

    doencas = _paciente.doencas?.isEmpty == true ? false : true;

    doencasController = TextEditingController(text: _paciente.doencas);
    historicoCardiaco = _paciente.possui_historico_cardiaco;
    remediosControladosController =
        TextEditingController(text: _paciente.remedios_controlados);
    alergiaRemediosController =
        TextEditingController(text: _paciente.remedios_alergia);
    observacoesController = TextEditingController(text: _paciente.observacoes);
  }

  atualizar() async {
    //ATUALIZAR DADOS
    Pacientes paciente = _paciente.copyWith(
        atividade_fisica: AtividadeFisicaEnum
            .values[atividadeFisicaOpcoes.indexOf(atividadeFisica)],
        doencas: doencas == true ? doencasController.text : '',
        bebida_alcoolica: bebida,
        fumante: fumante,
        possui_historico_cardiaco: historicoCardiaco,
        remedios_controlados:
            medicamentoControlado ? remediosControladosController.text : '',
        remedios_alergia:
            alergiaMedicamento ? alergiaRemediosController.text : '',
        observacoes: observacoesController.text);
    await _pacientesRepository.update(paciente);
    Get.back();
  }
}

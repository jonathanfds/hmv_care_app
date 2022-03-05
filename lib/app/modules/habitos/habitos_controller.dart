import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/models/paciente.dart';
import 'package:intl/intl.dart';

import '../../data/repositories/pacientes_repository.dart';

class HabitosController extends GetxController {
  TextEditingController alergiaRemediosController = TextEditingController();
  TextEditingController remediosControladosController = TextEditingController();
  TextEditingController doencasController = TextEditingController();
  TextEditingController observacoesController = TextEditingController();
  final PacientesRepository _pacientesRepository;
  final Paciente _paciente;

  HabitosController(this._pacientesRepository)
      : _paciente = Get.arguments as Paciente;

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
    'Não pratica',
    '1 vez por semana',
    '2 ou 3 vezes por semana',
    '4 ou 5 vezes por semana',
    '5 ou mais vezes por semana'
  ];

  loadInfo() {
    atividadeFisica = _paciente.atividadeFisica;
    bebida = _paciente.bebidaAlcoolica;
    fumante = _paciente.fumante;

    alergiaMedicamento =
        _paciente.remediosAlergia?.isEmpty == true ? false : true;

    medicamentoControlado =
        _paciente.remediosControlados?.isEmpty == true ? false : true;

    doencasController = TextEditingController(text: _paciente.doencas);
    historicoCardiaco = _paciente.possuiHistoricoCardiaco;
    remediosControladosController =
        TextEditingController(text: _paciente.remediosControlados);
    alergiaRemediosController =
        TextEditingController(text: _paciente.remediosAlergia);
    observacoesController = TextEditingController(text: _paciente.observacoes);
  }

  atualizar() async {
    //ATUALIZAR DADOS
    var dateNow = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss').format(dateNow);
    _paciente.ultimaAtualizacao = formattedDate;
    _paciente.atividadeFisica = atividadeFisica;
    _paciente.doencas = doencas == true ? doencasController.text : '';
    _paciente.bebidaAlcoolica = bebida;
    _paciente.fumante = fumante;
    _paciente.possuiHistoricoCardiaco = historicoCardiaco;
    _paciente.remediosControlados =
        medicamentoControlado ? remediosControladosController.text : '';
    _paciente.remediosAlergia =
        alergiaMedicamento ? alergiaRemediosController.text : '';
    _paciente.observacoes = observacoesController.text;
    await _pacientesRepository.update(_paciente);
    Get.back();
  }
}

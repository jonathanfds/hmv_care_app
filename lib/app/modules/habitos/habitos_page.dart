import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/widgets/custom_yesno_checkbox.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../widgets/custom_button.dart';
import 'habitos_controller.dart';

class HabitosPage extends GetView<HabitosController> {
  @override
  Widget build(BuildContext context) {
    var heightOffset = (MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom +
        AppBar().preferredSize.height);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Minha Saúde'),
          actions: [
            IconButton(
                onPressed: () async {
                  await controller.atualizar();
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: SafeArea(
            child: SizedBox(
          width: Get.width,
          height: Get.height - heightOffset,
          child: SingleChildScrollView(
            child: Obx(() => controller.loading
                ? Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(height: 15),
                          Text('Estamos salvando suas alterações...',
                              textAlign: TextAlign.center,
                              style: KTextStyle.titleTextStyle)
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Center(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: buildQuestions()),
                      )
                    ],
                  )),
          ),
        )));
  }

  Widget buildQuestions() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _buildTextQuestion(
          '1', 'Qual sua altura ?', controller.alturaController, 'Altura'),
      const SizedBox(height: 15),
      _buildTextQuestion(
          '2', 'Qual seu peso ?', controller.pesoController, 'Peso'),
      const SizedBox(height: 15),
      Obx(() => YesNoQuestion(3, 'Possui alergia a algum medicamento ?',
              controller.alergiaMedicamento, (checkboxValue) {
            controller.alergiaMedicamento =
                controller.alergiaMedicamento == null
                    ? checkboxValue
                    : !controller.alergiaMedicamento;
          })),
      Obx(() => controller.alergiaMedicamento == true
          ? Container(
              child: _buildTextField(
                  controller.alergiaRemediosController, 'Quais remédios?'),
              margin: const EdgeInsets.only(left: 20, top: 0),
            )
          : const SizedBox.shrink()),
      const SizedBox(height: 15),
      Obx(() => YesNoQuestion(4, 'Toma algum medicamento de uso contínuo ?',
              controller.medicamentoControlado, (checkboxValue) {
            controller.medicamentoControlado =
                controller.medicamentoControlado == null
                    ? checkboxValue
                    : !controller.medicamentoControlado;
          })),
      Obx(() => controller.medicamentoControlado == true
          ? Container(
              child: _buildTextField(
                  controller.remediosControladosController, 'Quais remédios?'),
              margin: const EdgeInsets.only(left: 20, top: 0),
            )
          : const SizedBox.shrink()),
      const SizedBox(height: 15),
      Obx(() => YesNoQuestion(
              5,
              'Possui histórico de doença cardíaca em familiares ?',
              controller.historicoCardiaco, (checkboxValue) {
            controller.historicoCardiaco = controller.historicoCardiaco == null
                ? checkboxValue
                : !controller.historicoCardiaco;
          })),
      const SizedBox(height: 15),
      Obx(() => YesNoQuestion(
              6, 'Possui alguma doença diagnosticada ?', controller.doencas,
              (checkboxValue) {
            controller.doencas = controller.doencas == null
                ? checkboxValue
                : !controller.doencas;
          })),
      Obx(() => controller.doencas == true
          ? Container(
              child: _buildTextField(
                  controller.doencasController, 'Quais doenças?'),
              margin: const EdgeInsets.only(left: 20, top: 0),
            )
          : const SizedBox.shrink()),
      const SizedBox(height: 15),
      Obx(() =>
          YesNoQuestion(7, 'É fumante ?', controller.fumante, (checkboxValue) {
            controller.fumante = controller.fumante == null
                ? checkboxValue
                : !controller.fumante;
          })),
      const SizedBox(height: 15),
      Obx(() =>
          YesNoQuestion(8, 'Consome bebida alcoólica ?', controller.bebida,
              (checkboxValue) {
            controller.bebida =
                controller.bebida == null ? checkboxValue : !controller.bebida;
          })),
      const SizedBox(height: 15),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text.rich(TextSpan(
                  text: '9. ',
                  style: KTextStyle.textStyleBold,
                  children: [
                    TextSpan(
                        text: 'Com que frequência pratica atividades físicas ?',
                        style: KTextStyle.textStyle)
                  ])),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Obx(() => DropdownButton<String>(
                    isExpanded: true,
                    value: controller.atividadeFisica,
                    items: HabitosController.atividadeFisicaOpcoes
                        .map((e) => DropdownMenuItem<String>(
                            child: Text(
                              e,
                              style: KTextStyle.textStyle,
                            ),
                            value: e))
                        .toList(),
                    onChanged: (val) {
                      controller.atividadeFisica = val;
                    })),
              )
            ],
          )),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text.rich(TextSpan(
                  text: '10. ',
                  style: KTextStyle.textStyleBold,
                  children: [
                    TextSpan(
                        text: 'Demais observações', style: KTextStyle.textStyle)
                  ])),
              const SizedBox(height: 15),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 5))),
                  textInputAction: TextInputAction.done,
                  maxLines: 3,
                  controller: controller.observacoesController)
            ],
          )),
    ]);
  }

  TextField _buildTextField(TextEditingController controller, String question,
      {TextInputType keyboard = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        isDense: true,
        hintText: question,
        hintStyle: KTextStyle.textFieldHintStyle,
      ),
    );
  }

  Padding _buildTextQuestion(String num, String question,
      TextEditingController controller, String hint) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: '$num. ',
                style: KTextStyle.textStyleBold,
                children: [
                  TextSpan(text: question, style: KTextStyle.textStyle)
                ])),
            _buildTextField(controller, question,
                keyboard: TextInputType.number)
          ],
        ));
  }
}

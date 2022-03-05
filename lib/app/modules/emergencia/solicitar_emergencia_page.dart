import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/widgets/custom_button.dart';
import 'package:hmv_care_app/core/theme/app_text_styles.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_yesno_checkbox.dart';
import 'solicitar_emergencia_controller.dart';
import 'perguntas.dart';

class SolicitarEmergenciaPage extends GetView<SolicitarEmergenciaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Questionário de Emergência')),
        body: SafeArea(
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
                          Text(
                              'Estamos registrando sua solicitação de emergência...',
                              textAlign: TextAlign.center,
                              style: KTextStyle.titleTextStyle)
                        ],
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: SizedBox(
                          height: 80.h,
                          width: 100.w,
                          child: SingleChildScrollView(
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Obx(() => controller.complete
                                    ? buildComplete()
                                    : buildQuestions())),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Obx(() => controller.complete
                              ? const SizedBox.shrink()
                              : Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: CustomButton(
                                      onTap: () async {
                                        controller.confirmarEmergencia();
                                      },
                                      text: 'CONFIRMAR'))))
                    ],
                  ))));
  }

  Column buildComplete() {
    return Column(
      children: [const Text('COMPLETO')],
    );
  }

  Column buildQuestions() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Obx(() => YesNoQuestion(
            1,
            perguntas[1]!,
            controller.dorPeito,
            (checkboxValue) {
              controller.dorPeito = controller.dorPeito == null
                  ? checkboxValue
                  : !controller.dorPeito;
            },
          )),
      const SizedBox(
        height: 10,
      ),
      Obx(() => YesNoQuestion(
            2,
            perguntas[2]!,
            controller.difRespirar,
            (checkboxValue) {
              controller.difRespirar = controller.difRespirar == null
                  ? checkboxValue
                  : !controller.difRespirar;
            },
          )),
      const SizedBox(
        height: 10,
      ),
      Obx(() => YesNoQuestion(
            3,
            perguntas[3]!,
            controller.dorCabeca,
            (checkboxValue) {
              controller.dorCabeca = controller.dorCabeca == null
                  ? checkboxValue
                  : !controller.dorCabeca;
            },
          )),
      const SizedBox(
        height: 10,
      ),
      Obx(() => YesNoQuestion(
            4,
            perguntas[4]!,
            controller.dorAbdominal,
            (checkboxValue) {
              controller.dorAbdominal = controller.dorAbdominal == null
                  ? checkboxValue
                  : !controller.dorAbdominal;
            },
          )),
      const SizedBox(
        height: 10,
      ),
      Obx(() => YesNoQuestion(
            5,
            perguntas[5]!,
            controller.senteNausea,
            (checkboxValue) {
              controller.senteNausea = controller.senteNausea == null
                  ? checkboxValue
                  : !controller.senteNausea;
            },
          )),
      const SizedBox(
        height: 10,
      ),
      Obx(() => YesNoQuestion(
            6,
            perguntas[6]!,
            controller.alteracaoCardiaca,
            (checkboxValue) {
              controller.alteracaoCardiaca =
                  controller.alteracaoCardiaca == null
                      ? checkboxValue
                      : !controller.alteracaoCardiaca;
            },
          )),
    ]);
  }
}

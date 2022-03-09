import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/models/emergencia.dart';
import 'package:hmv_care_app/app/modules/home/home_controller.dart';
import 'package:hmv_care_app/core/theme/app_colors.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../data/models/paciente.dart';
import '../widgets/topbar.dart';

class HospitalTab extends GetView<HomeController> {
  TextEditingController _searchBarController = TextEditingController();

  HospitalTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _builLabel(String label, String value,
        {Axis direction = Axis.vertical}) {
      return Wrap(
          alignment: WrapAlignment.start,
          spacing: 5,
          direction: direction,
          children: [
            Text(
              label,
              style: KTextStyle.labelTextStyle,
            ),
            Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: KTextStyle.textFieldHeading,
            )
          ]);
    }

    Widget buildBody() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Emergências', style: KTextStyle.headerTextStyle),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 75.h,
                      child: Obx(() => ListView(
                              children: controller.emergencias.map((t) {
                            var emergencia = t as Emergencia;
                            var isSelected = emergencia.id ==
                                controller.selectedEmergencia.id;
                            var color = emergencia.severidade == "Grave"
                                ? Colors.red
                                : Colors.blue;
                            return InkWell(
                              onTap: () {
                                controller.selectedEmergenciaIdx =
                                    controller.emergencias.indexOf(t);
                              },
                              child: Card(
                                  elevation: 5,
                                  shadowColor: color,
                                  child: Container(
                                      padding: const EdgeInsets.only(left: 7),
                                      color: color,
                                      child: Obx(() => Container(
                                            color: controller
                                                            .selectedEmergenciaIdx >=
                                                        0 &&
                                                    emergencia.id ==
                                                        controller
                                                            .selectedEmergencia
                                                            .id
                                                ? Colors.blue[50]
                                                : Colors.white,
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Severidade',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      KTextStyle.labelTextStyle,
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  emergencia.severidade!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: KTextStyle
                                                      .textFieldHeading,
                                                ),
                                                const SizedBox(height: 15),
                                                const Text(
                                                  'Data de Solicitação',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      KTextStyle.labelTextStyle,
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  emergencia.data!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: KTextStyle
                                                      .textFieldHeading,
                                                ),
                                              ],
                                            ),
                                          )))),
                            );
                          }).toList())),
                    )),
                Expanded(
                    flex: 8,
                    child: SizedBox(
                        height: 75.h,
                        child: Obx(() => controller.selectedEmergenciaIdx >= 0
                            ? Card(
                                elevation: 5,
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: ListView(
                                      children: [
                                        const Text(
                                          'Dados do Paciente',
                                          style: KTextStyle.titleTextStyle,
                                        ),
                                        Divider(
                                            color: Colors.grey[200],
                                            thickness: .5),
                                        const SizedBox(height: 10),
                                        Wrap(
                                          spacing: 50,
                                          runSpacing: 10,
                                          children: [
                                            _builLabel(
                                                'Nome Completo',
                                                controller.selectedEmergencia
                                                    .paciente!.nomeCompleto!),
                                            _builLabel('Idade',
                                                '${controller.selectedEmergencia.paciente!.idade} anos'),
                                            _builLabel(
                                                'CPF',
                                                controller.formatCPF(controller
                                                    .selectedEmergencia
                                                    .paciente!
                                                    .cpf!)),
                                            _builLabel(
                                                'Nome da Mãe',
                                                controller.selectedEmergencia
                                                    .paciente!.nomeMae!),
                                            _builLabel(
                                                'Nascimento',
                                                controller.selectedEmergencia
                                                    .paciente!.dataNascimento!),
                                            _builLabel(
                                                'Telefone',
                                                controller.formatTelefone(
                                                    controller
                                                        .selectedEmergencia
                                                        .paciente!
                                                        .telefone!)),
                                            _builLabel(
                                                'E-mail',
                                                controller.selectedEmergencia
                                                    .paciente!.email!),
                                            _builLabel(
                                                'Endereço',
                                                controller.selectedEmergencia
                                                    .paciente!.endereco!),
                                            _builLabel(
                                                'Convênio',
                                                controller.selectedEmergencia
                                                    .paciente!.convenio!),
                                          ],
                                        ),
                                        const SizedBox(height: 30),
                                        Text(
                                          'Dados Médicos',
                                          style: KTextStyle.titleTextStyle
                                              .copyWith(fontSize: 15),
                                        ),
                                        Divider(
                                            color: Colors.grey[200],
                                            thickness: .5),
                                        const SizedBox(height: 10),
                                        Wrap(
                                            spacing: 50,
                                            runSpacing: 10,
                                            children: [
                                              _builLabel(
                                                  'Peso',
                                                  controller.selectedEmergencia
                                                          .paciente?.peso ??
                                                      'Não Informado'),
                                              _builLabel(
                                                  'Altura',
                                                  controller.selectedEmergencia
                                                          .paciente?.altura ??
                                                      'Não Informado'),
                                              _builLabel(
                                                  'Fumante',
                                                  controller
                                                              .selectedEmergencia
                                                              .paciente
                                                              ?.fumante !=
                                                          null
                                                      ? controller
                                                              .selectedEmergencia
                                                              .paciente!
                                                              .fumante!
                                                          ? 'Sim'
                                                          : 'Não'
                                                      : 'Não Informado'),
                                              _builLabel(
                                                  'Consome bebida alcoólica',
                                                  controller
                                                              .selectedEmergencia
                                                              .paciente
                                                              ?.bebidaAlcoolica !=
                                                          null
                                                      ? controller
                                                              .selectedEmergencia
                                                              .paciente!
                                                              .bebidaAlcoolica!
                                                          ? 'Sim'
                                                          : 'Não'
                                                      : 'Não Informado'),
                                              _builLabel(
                                                  'Possui familiares cardíacos',
                                                  controller
                                                              .selectedEmergencia
                                                              .paciente
                                                              ?.possuiHistoricoCardiaco !=
                                                          null
                                                      ? controller
                                                              .selectedEmergencia
                                                              .paciente!
                                                              .possuiHistoricoCardiaco!
                                                          ? 'Sim'
                                                          : 'Não'
                                                      : 'Não Informado'),
                                              _builLabel(
                                                  'Alergia aos Remédios',
                                                  controller
                                                              .selectedEmergencia
                                                              .paciente!
                                                              .remediosAlergia ==
                                                          ''
                                                      ? 'Nenhum'
                                                      : controller
                                                          .selectedEmergencia
                                                          .paciente!
                                                          .remediosAlergia!),
                                              _builLabel(
                                                  'Remédios Controlados',
                                                  controller
                                                              .selectedEmergencia
                                                              .paciente!
                                                              .remediosControlados ==
                                                          ''
                                                      ? 'Nenhum'
                                                      : controller
                                                          .selectedEmergencia
                                                          .paciente!
                                                          .remediosControlados!),
                                              if (controller.selectedEmergencia
                                                      .paciente!.observacoes! !=
                                                  '')
                                                _builLabel(
                                                    'Observações',
                                                    controller
                                                        .selectedEmergencia
                                                        .paciente!
                                                        .observacoes!),
                                            ]),
                                        const SizedBox(height: 30),
                                        const Text(
                                          'Questionário da Emêrgencia',
                                          style: KTextStyle.titleTextStyle,
                                        ),
                                        Divider(
                                            color: Colors.grey[200],
                                            thickness: .5),
                                        const SizedBox(height: 10),
                                        Wrap(
                                            alignment: WrapAlignment.start,
                                            direction: Axis.vertical,
                                            spacing: 10,
                                            children: controller
                                                .selectedEmergencia
                                                .questionario!
                                                .entries
                                                .map((e) => _builLabel(
                                                    e.key, e.value,
                                                    direction: Axis.horizontal))
                                                .toList())
                                      ],
                                    )),
                              )
                            : Container())))
              ],
            )
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      child: buildBody(),
    );
  }
}

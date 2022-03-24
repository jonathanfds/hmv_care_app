import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/modules/home/home_controller.dart';
import 'package:hmv_care_app/core/theme/app_colors.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'package:hmv_care_app/app/data/models/ModelProvider.dart';

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
          child: Obx(() => controller.loading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 2),
                          child: IconButton(
                              onPressed: () async {
                                await controller.loadEmergencias();
                              },
                              icon: const Icon(
                                Icons.refresh,
                                color: AppColors.blue,
                              )),
                        ),
                        const SizedBox(width: 10),
                        const Text('Emergências',
                            style: KTextStyle.headerTextStyle),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 65.h,
                              child: Obx(() => ListView(
                                  controller: ScrollController(),
                                  children: controller.emergencias.map((t) {
                                    var emergencia = t as Emergencia;
                                    var isSelected = emergencia.id ==
                                        controller.selectedEmergencia.id;
                                    var color = emergencia.severidade ==
                                            EmergenciaSeveridadeEnum.GRAVE
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
                                              padding: const EdgeInsets.only(
                                                  left: 7),
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
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Risco',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: KTextStyle
                                                              .labelTextStyle,
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        Text(
                                                          emergencia.severidade
                                                              .toString()
                                                              .replaceAll(
                                                                  "EmergenciaSeveridadeEnum.",
                                                                  ""),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: KTextStyle
                                                              .textFieldHeading,
                                                        ),
                                                        const SizedBox(
                                                            height: 15),
                                                        const Text(
                                                          'Data de Solicitação',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: KTextStyle
                                                              .labelTextStyle,
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        Text(
                                                          emergencia.data!,
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                height: 65.h,
                                child: Obx(() {
                                  if (controller.emergencias.isEmpty) {
                                    return Container();
                                  }
                                  var paciente =
                                      controller.selectedEmergencia.paciente!;
                                  return controller.selectedEmergenciaIdx >= 0
                                      ? Card(
                                          elevation: 5,
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 15),
                                              child: ListView(
                                                children: [
                                                  const Text(
                                                    'Dados do Paciente',
                                                    style: KTextStyle
                                                        .titleTextStyle,
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
                                                          paciente
                                                              .nome_completo!),
                                                      _builLabel('Idade',
                                                          '${controller.calcularIdade(controller.selectedEmergencia.paciente!.data_nascimento!)} anos'),
                                                      _builLabel(
                                                          'CPF',
                                                          controller.formatCPF(
                                                              paciente.cpf!)),
                                                      _builLabel(
                                                          'Nome da Mãe',
                                                          paciente.nome_mae ??
                                                              ''),
                                                      _builLabel(
                                                          'Nascimento',
                                                          paciente
                                                              .data_nascimento!),
                                                      _builLabel(
                                                          'Telefone',
                                                          controller
                                                              .formatTelefone(
                                                                  paciente
                                                                      .telefone!)),
                                                      _builLabel('E-mail',
                                                          paciente.email!),
                                                      _builLabel('Endereço',
                                                          paciente.endereco!),
                                                      _builLabel(
                                                          'Convênio',
                                                          paciente.convenio ??
                                                              'Não Informado'),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 30),
                                                  Text(
                                                    'Dados Médicos',
                                                    style: KTextStyle
                                                        .titleTextStyle
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
                                                            paciente.peso ==
                                                                    null
                                                                ? 'Não Informado'
                                                                : '${paciente.peso!} Kg'),
                                                        _builLabel(
                                                            'Altura',
                                                            paciente.altura ==
                                                                    null
                                                                ? 'Não Informado'
                                                                : '${paciente.altura} m'),
                                                        _builLabel(
                                                            'Fumante',
                                                            paciente.fumante !=
                                                                    null
                                                                ? paciente
                                                                        .fumante!
                                                                    ? 'Sim'
                                                                    : 'Não'
                                                                : 'Não Informado'),
                                                        _builLabel(
                                                            'Consome bebida alcoólica',
                                                            paciente.bebida_alcoolica !=
                                                                    null
                                                                ? paciente
                                                                        .bebida_alcoolica!
                                                                    ? 'Sim'
                                                                    : 'Não'
                                                                : 'Não Informado'),
                                                        _builLabel(
                                                            'Possui familiares cardíacos',
                                                            paciente.possui_historico_cardiaco !=
                                                                    null
                                                                ? paciente
                                                                        .possui_historico_cardiaco!
                                                                    ? 'Sim'
                                                                    : 'Não'
                                                                : 'Não Informado'),
                                                        _builLabel(
                                                            'Alergia aos Remédios',
                                                            (paciente.remedios_alergia ==
                                                                        null ||
                                                                    paciente.remedios_alergia! ==
                                                                        '')
                                                                ? 'Nenhum'
                                                                : paciente
                                                                    .remedios_alergia!),
                                                        _builLabel(
                                                            'Remédios Controlados',
                                                            (paciente.remedios_controlados ==
                                                                        null ||
                                                                    paciente.remedios_controlados! ==
                                                                        '')
                                                                ? 'Nenhum'
                                                                : paciente
                                                                    .remedios_controlados!),
                                                        if (paciente.observacoes !=
                                                                null &&
                                                            paciente.observacoes! !=
                                                                '')
                                                          _builLabel(
                                                              'Observações',
                                                              paciente
                                                                  .observacoes!),
                                                      ]),
                                                  const SizedBox(height: 30),
                                                  const Text(
                                                    'Questionário da Emergência',
                                                    style: KTextStyle
                                                        .titleTextStyle,
                                                  ),
                                                  Divider(
                                                      color: Colors.grey[200],
                                                      thickness: .5),
                                                  const SizedBox(height: 10),
                                                  Wrap(
                                                      alignment:
                                                          WrapAlignment.start,
                                                      direction: Axis.vertical,
                                                      spacing: 10,
                                                      children: controller
                                                          .selectedEmergencia
                                                          .questionario!
                                                          .map((e) => _builLabel(
                                                              e.pergunta!,
                                                              e.resposta!,
                                                              direction: Axis
                                                                  .horizontal))
                                                          .toList())
                                                ],
                                              )),
                                        )
                                      : Container();
                                })))
                      ],
                    )
                  ],
                )));
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

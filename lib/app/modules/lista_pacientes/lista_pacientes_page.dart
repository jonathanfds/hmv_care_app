import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/modules/home/home_controller.dart';
import 'package:hmv_care_app/app/widgets/custom_formfield.dart';
import 'package:hmv_care_app/core/theme/app_colors.dart';
import 'package:hmv_care_app/core/utils/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/paciente.dart';
import '../home/widgets/topbar.dart';
import 'lista_pacientes_controller.dart';

class ListaPacientesPage extends GetView<ListaPacientesController> {
  TextEditingController _searchBarController = TextEditingController();

  ListaPacientesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildBody() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Lista de Pacientes', style: KTextStyle.headerTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomFormField(
                    headingText: '',
                    onSubmitt: (text) {
                      var list = controller.allPacientes
                          .where((t) =>
                              t.cpf!.toLowerCase().startsWith(text
                                  .toLowerCase()
                                  .replaceAll('-', '')
                                  .replaceAll('.', '')) ||
                              t.email!
                                  .toLowerCase()
                                  .startsWith(text.toLowerCase()))
                          .toList();
                      controller.pacientes.value = list;
                    },
                    hintText: 'Buscar por CPF ou Email',
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.search,
                    controller: _searchBarController,
                    maxLines: 1),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () async {
                        await controller.openCadastroPaciente();
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.person_add),
                          SizedBox(width: 5),
                          Text(
                            'Cadastrar Paciente',
                            style: KTextStyle.textFieldHeading,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
                child: Obx(
              () => DataTable(
                  dataRowHeight: 60,
                  columns: const [
                    DataColumn(label: Text('')),
                    DataColumn(label: Text('Nome')),
                    DataColumn(label: Text('CPF')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Nascimento')),
                    DataColumn(label: Text('Telefone')),
                  ],
                  rows: controller.pacientes.map((t) {
                    var paciente = t as Paciente;
                    return DataRow(cells: [
                      DataCell(Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              paciente.foto ?? Constants.DEFAULT_PROFILE_PIC),
                          radius: 30,
                        ),
                      )),
                      DataCell(Text(paciente.nomeCompleto!)),
                      DataCell(Text(controller.formatCPF(paciente.cpf!))),
                      DataCell(Text(paciente.email!)),
                      DataCell(Text(paciente.dataNascimento!)),
                      DataCell(Text(controller.formatTelefone(
                          paciente.telefone!.replaceAll('+55', '')))),
                    ]);
                  }).toList()),
            ))
          ],
        ),
      );
    }

    return Container(
      height: 90.h,
      width: 100.w,
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

class MyData extends DataTableSource {
  // Generate some made-up data
  List<Paciente> pacientes;
  MyData(this.pacientes);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => pacientes.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    var paciente = pacientes[index];
    return DataRow(cells: [
      DataCell(Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: CircleAvatar(
          backgroundImage: NetworkImage(Get.find<HomeController>().user.foto ??
              Constants.DEFAULT_PROFILE_PIC),
          radius: 30,
        ),
      )),
      DataCell(Text(paciente.nomeCompleto!)),
      DataCell(Text((paciente.cpf!))),
      DataCell(Text(paciente.email!)),
      DataCell(Text(paciente.dataNascimento!)),
      DataCell(Text((paciente.telefone!))),
      DataCell(IconButton(
          onPressed: () {}, icon: const Icon(Icons.medical_services_rounded)))
    ]);
  }
}

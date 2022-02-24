import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/modules/home/home_controller.dart';
import 'package:hmv_care_app/app/widgets/custom_formfield.dart';
import 'package:hmv_care_app/core/theme/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../data/models/paciente.dart';
import '../widgets/menu_item.dart';
import '../widgets/paciente_tile.dart';
import '../widgets/topbar.dart';

class HospitalTab extends GetView<HomeController> {
  TextEditingController _searchBarController = TextEditingController();

  HospitalTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildBody() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Lista de Pacientes', style: KTextStyle.headerTextStyle),
            CustomFormField(
                headingText: '',
                onSubmitt: (text) {
                  var list = controller.allPacientes
                      .where((t) =>
                          t.cpf!.toLowerCase().startsWith(text
                              .toLowerCase()
                              .replaceAll('-', '')
                              .replaceAll('.', '')) ||
                          t.email!.toLowerCase().startsWith(text.toLowerCase()))
                      .toList();
                  controller.pacientes.value = list;
                },
                hintText: 'Buscar por CPF ou Email',
                obsecureText: false,
                suffixIcon: SizedBox(),
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.search,
                controller: _searchBarController,
                maxLines: 1),
            SizedBox(height: 20),
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
                    DataColumn(label: Text('')),
                    DataColumn(label: Text(''))
                  ],
                  rows: controller.pacientes.map((t) {
                    var paciente = t as Paciente;
                    return DataRow(cells: [
                      DataCell(Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://100k-faces.glitch.me/random-image'),
                          radius: 30,
                        ),
                      )),
                      DataCell(Text(paciente.nomeCompleto!)),
                      DataCell(Text(controller.formatCPF(paciente.cpf!))),
                      DataCell(Text(paciente.email!)),
                      DataCell(Text(paciente.dataNascimento!)),
                      DataCell(Text(controller.formatTelefone(
                          paciente.telefone!.replaceAll('+55', '')))),
                      DataCell(IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.medical_services_rounded))),
                      DataCell(IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.medical_services_rounded)))
                    ]);
                  }).toList()),
            ))
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        color: AppColors.blue,
        height: Get.height,
        child: SafeArea(
            child: Stack(
          children: [
            Positioned(
              child: HMVTopbar(),
              top: 10,
              left: 10,
              right: 10,
            ),
            Positioned(
              top: 10.h,
              child: Container(
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
              ),
            )
          ],
        )),
      ),
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
        child: const CircleAvatar(
          backgroundImage:
              NetworkImage('https://100k-faces.glitch.me/random-image'),
          radius: 30,
        ),
      )),
      DataCell(Text(paciente.nomeCompleto!)),
      DataCell(Text((paciente.cpf!))),
      DataCell(Text(paciente.email!)),
      DataCell(Text(paciente.dataNascimento!)),
      DataCell(Text((paciente.telefone!))),
      DataCell(IconButton(
          onPressed: () {}, icon: Icon(Icons.medical_services_rounded)))
    ]);
  }
}

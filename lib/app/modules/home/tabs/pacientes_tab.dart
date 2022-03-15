import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/modules/home/home_controller.dart';
import 'package:hmv_care_app/core/utils/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/menu_item.dart';
import '../widgets/topbar.dart';

class PacientesTab extends GetView<HomeController> {
  const PacientesTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: 100.0.w,
            child: Column(
              children: [
                const SizedBox(height: 15),
                _buildHeader(),
                const SizedBox(height: 15),
                Expanded(
                  child: SizedBox(
                    width: 100.0.w,
                    child: SingleChildScrollView(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 30,
                        runSpacing: 10,
                        verticalDirection: VerticalDirection.down,
                        children: [
                          HomeMenuItem('Solicitar Emergência', () async {
                            await controller.openEmergencia();
                          }, 'https://img.icons8.com/cotton/344/medical-mobile-app-2.png'),
                          HomeMenuItem('Histórico de Atendimento', () {},
                              'https://img.icons8.com/cotton/344/medical-history.png'),
                          HomeMenuItem('Exames Realizados', () {},
                              'https://img.icons8.com/cotton/344/folder-invoices--v2.png'),
                          HomeMenuItem('Hospitais Próximos', () {},
                              'https://img.icons8.com/cotton/344/clinic.png'),
                          HomeMenuItem('Hábitos & Saúde', () async {
                            await controller.openHabitos();
                          }, 'https://img.icons8.com/cotton/344/heart-monitor.png'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ),
        ),
      ],
    );
  }

  Column _buildHeader() {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[600]!,
                    blurRadius: 5,
                    offset: const Offset(-2, 3))
              ]),
          child: ClipOval(child: Image.asset(Constants.DEFAULT_PROFILE_PIC)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.user.name!,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: KTextStyle.titleTextStyle),
            Text(controller.user.email!,
                style:
                    KTextStyle.textFieldHeading.copyWith(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

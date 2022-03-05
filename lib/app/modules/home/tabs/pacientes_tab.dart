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
    return Stack(
      children: [
        const Positioned(
          child: HMVTopbar(),
          top: 10,
          left: 10,
          right: 10,
        ),
        Positioned(
            bottom: 0,
            top: 10.h,
            child: Container(
              height: 70.h,
              width: 100.w,
              child: Container(
                margin: const EdgeInsets.only(top: 90),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(controller.user.name!,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: KTextStyle.titleTextStyle),
                        Text(controller.user.email!,
                            style: KTextStyle.textFieldHeading
                                .copyWith(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Wrap(
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
                    )
                  ],
                ),
              ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
            )),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[600]!,
                      blurRadius: 5,
                      offset: const Offset(-2, 3))
                ]),
            child: ClipOval(
                child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: controller.user.foto ?? Constants.DEFAULT_PROFILE_PIC,
              fit: BoxFit.cover,
            )),
          ),
          top: 50,
          left: 50.w - 60,
          width: 120,
          height: 120,
        )
      ],
    );
  }
}

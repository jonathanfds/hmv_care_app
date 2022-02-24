import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/core/theme/app_colors.dart';
import 'package:hmv_care_app/core/theme/app_text_styles.dart';
import 'package:sizer/sizer.dart';
import '../widgets/topbar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  _buildLabelText(String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7.5),
      child: Text.rich(TextSpan(
          text: '$label: ',
          style: KTextStyle.textFieldHeading,
          children: [TextSpan(text: value, style: KTextStyle.normalText)])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Positioned(
        child: HMVTopbar(),
        top: 10,
        left: 10,
        right: 10,
      ),
      Positioned(
        child: Container(
          height: 90.h,
          width: 100.w,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[600]!,
                                blurRadius: 5,
                                offset: const Offset(-2, 2))
                          ],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black54, width: 1)),
                      child: QrImage(
                        data: 'https://100k-faces.glitch.me/random-image',
                        version: QrVersions.auto,
                        size: 220,
                        gapless: false,
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          color: AppColors.blue,
                          size: const Size(30, 32),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      width: 800,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Dados Pessoais',
                                  style: KTextStyle.titleTextStyle),
                              InkWell(
                                onTap: (() {}),
                                child: Container(
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey, blurRadius: 2)
                                        ],
                                        borderRadius: BorderRadius.circular(40),
                                        border: Border.all(
                                            color: AppColors.blue, width: 2)),
                                    child: const Icon(Icons.edit,
                                        color: AppColors.blue)),
                              )
                            ],
                          ),
                          _buildLabelText('Nome', 'Gabriele Guedes'),
                          _buildLabelText('Data Nascimento', '04/12/1990'),
                          Wrap(
                            spacing: 10,
                            children: [
                              _buildLabelText('CPF', '482.555.896-52'),
                              _buildLabelText('RG', '38.159.741-5'),
                            ],
                          ),
                          const Divider(
                              thickness: 0.5,
                              endIndent: 0,
                              color: AppColors.blue),
                          _buildLabelText('Endereço',
                              'R. Ramiro Barcelos, 910 - Moinhos de Vento'),
                          Wrap(
                            spacing: 10,
                            children: [
                              _buildLabelText('Cidade', 'Porto Alegre'),
                              _buildLabelText('Estado', 'RS'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        ),
        top: 10.h,
        bottom: 0,
      )
    ]);
  }
}

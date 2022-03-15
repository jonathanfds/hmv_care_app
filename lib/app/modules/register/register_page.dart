import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/core/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_formfield.dart';
import '../../widgets/custom_richtext.dart';
import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({Key? key}) : super(key: key);

  Widget _buildSexoCheckboxes(bool? value, Function(bool?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          child: const Text(
            'Sexo',
            style: KTextStyle.textFieldHeading,
          ),
        ),
        Container(
          width: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IgnorePointer(
                ignoring: value ?? false,
                child: Checkbox(value: value ?? false, onChanged: onChanged),
              ),
              const Text(
                'Masculino',
                style: KTextStyle.textStyle,
              ),
              const SizedBox(
                width: 10,
              ),
              IgnorePointer(
                ignoring: value == null ? false : !value,
                child: Checkbox(
                    value: value == null ? false : !value,
                    onChanged: (val) {
                      onChanged(!(val!));
                    }),
              ),
              const Text(
                'Feminino',
                style: KTextStyle.textStyle,
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SingleChildScrollView buildBody() {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: 90.w,
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.blue,
                        size: 24,
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('Cadastro', style: KTextStyle.headerTextStyle),
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            CustomFormField(
              headingText: "Nome",
              hintText: "Nome Completo",
              obsecureText: false,
              suffixIcon: const SizedBox(),
              controller: controller.nameController,
              maxLines: 1,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.name,
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(() => _buildSexoCheckboxes(controller.sexoMasc, (isMasc) {
                  controller.sexoMasc = controller.sexoMasc == null
                      ? isMasc
                      : !controller.sexoMasc;
                })),
            const SizedBox(
              height: 15,
            ),
            CustomFormField(
              headingText: "Email",
              hintText: "E-mail",
              obsecureText: false,
              suffixIcon: const SizedBox(),
              controller: controller.emailController,
              maxLines: 1,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomFormField(
              headingText: "Data de Nascimento",
              hintText: "Data de Nascimento",
              obsecureText: false,
              suffixIcon: const SizedBox(),
              controller: controller.dtNascController,
              maxLines: 1,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.datetime,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomFormField(
              headingText: "CPF",
              hintText: "CPF",
              obsecureText: false,
              suffixIcon: const SizedBox(),
              controller: controller.cpfController,
              maxLines: 1,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.number,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomFormField(
              headingText: "Nome da Mãe",
              hintText: "Nome da Mãe",
              obsecureText: false,
              suffixIcon: const SizedBox(),
              controller: controller.nomeMaeController,
              maxLines: 1,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.name,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomFormField(
              headingText: "Telefone",
              hintText: "Telefone",
              obsecureText: false,
              suffixIcon: const SizedBox(),
              controller: controller.telefoneController,
              maxLines: 1,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.phone,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomFormField(
              headingText: "Endereco",
              hintText: "Endereco",
              obsecureText: false,
              suffixIcon: const SizedBox(),
              controller: controller.enderecoController,
              maxLines: 1,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.streetAddress,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              text: 'Cadastrar',
              onTap: () {
                controller.register();
              },
            ),
            const SizedBox(
              height: 15,
            )
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
              top: 5.h,
              child: Container(
                height: 95.h,
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

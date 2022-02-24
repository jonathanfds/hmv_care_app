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
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _cpfController = TextEditingController();
    TextEditingController _dtNascController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();
    TextEditingController _nameController = TextEditingController();

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
              controller: _nameController,
              maxLines: 1,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.name,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomFormField(
              headingText: "Email",
              hintText: "E-mail",
              obsecureText: false,
              suffixIcon: const SizedBox(),
              controller: _emailController,
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
              controller: _dtNascController,
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
              controller: _cpfController,
              maxLines: 1,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.number,
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(() => CustomFormField(
                  headingText: "Senha",
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  hintText: "Senha",
                  obsecureText: controller.hidePassword,
                  suffixIcon: IconButton(
                      icon: controller.hidePassword
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        controller.hidePassword = !controller.hidePassword;
                      }),
                  controller: _passwordController,
                )),
            const SizedBox(
              height: 15,
            ),
            Obx(() => CustomFormField(
                  headingText: "Confirmar Senha",
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  hintText: "Confirmar Senha",
                  obsecureText: controller.hideConfirmPassword,
                  suffixIcon: IconButton(
                      icon: controller.hideConfirmPassword
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        controller.hideConfirmPassword =
                            !controller.hideConfirmPassword;
                      }),
                  controller: _confirmPasswordController,
                )),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              text: 'Cadastrar',
              onTap: () {},
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

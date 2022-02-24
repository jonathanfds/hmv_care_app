import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/core/theme/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_formfield.dart';
import '../../widgets/custom_richtext.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _usernameController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        color: AppColors.blue,
        height: 100.h,
        width: 100.w,
        child: SafeArea(
            child: Stack(
          children: [
            Positioned(
              top: 5.h,
              child: Container(
                height: 95.h,
                width: 100.w,
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: 100.w,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: FadeInImage(
                              placeholder: MemoryImage(kTransparentImage),
                              image: const AssetImage(
                                  'assets/images/hmv_logo.png')),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          headingText: "E-mail",
                          hintText: "E-mail",
                          obsecureText: false,
                          suffixIcon: const SizedBox(),
                          controller: _usernameController,
                          maxLines: 1,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(() => CustomFormField(
                              key: UniqueKey(),
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
                                    controller.hidePassword =
                                        !controller.hidePassword;
                                  }),
                              controller: _passwordController,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() => controller.loading
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                    color: AppColors.blue, strokeWidth: 2))
                            : CustomButton(
                                text: 'Entrar',
                                onTap: () async {
                                  await controller.login(
                                      _usernameController.text,
                                      _passwordController.text);
                                },
                              )),
                        const SizedBox(
                          height: 15,
                        ),
                        /*CustomRichText(
                          discription: "Não tem cadastro? ",
                          text: "Registre-se",
                          onTap: () async =>
                              await controller.openRegisterPage(),
                        )*/
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

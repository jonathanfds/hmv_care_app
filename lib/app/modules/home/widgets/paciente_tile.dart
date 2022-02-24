import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:hmv_care_app/app/data/models/paciente.dart';
import 'package:hmv_care_app/app/widgets/custom_richtext.dart';
import 'package:hmv_care_app/core/theme/app_text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';

class PacienteTile extends StatelessWidget {
  final Paciente paciente;
  const PacienteTile({Key? key, required this.paciente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formatCPF(String cpf) {
      try {
        return UtilBrasilFields.obterCpf(
          cpf,
        );
      } catch (e) {}
      return cpf;
    }

    String formatTelefone(String tel) {
      try {
        return UtilBrasilFields.obterTelefone(tel.replaceAll('+55', ''));
      } catch (e) {}
      return tel;
    }

    return Container(
      width: 200,
      height: 160,
      margin: EdgeInsets.only(bottom: 10),
      child: SizedBox(
        child: Card(
          elevation: 4,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                ClipOval(
                    child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://100k-faces.glitch.me/random-image',
                  fit: BoxFit.cover,
                )),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paciente.nomeCompleto!,
                      style: KTextStyle.titleTextStyle,
                    ),
                    Text(
                      'CPF: ${formatCPF(paciente.cpf!)}',
                      style: KTextStyle.textStyle,
                    ),
                    Text(
                      'Nascimento: ${paciente.dataNascimento!}',
                      style: KTextStyle.textStyle,
                    ),
                    CustomRichText(
                        discription: 'Email: ',
                        text: paciente.email!,
                        onTap: () {}),
                    CustomRichText(
                        discription: 'Telefone: ',
                        text: formatTelefone(paciente.telefone!),
                        onTap: () {})
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/theme/app_text_styles.dart';

class YesNoQuestion extends StatelessWidget {
  YesNoQuestion(this.num, this.pergunta, this.value, this.onChanged, {Key? key})
      : super(key: key);

  int num;
  String pergunta;
  bool? value;
  Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text.rich(TextSpan(
                text: '$num. ',
                style: KTextStyle.textStyleBold,
                children: [
                  TextSpan(text: pergunta, style: KTextStyle.textStyle)
                ]))),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IgnorePointer(
              ignoring: value ?? false,
              child: Checkbox(value: value ?? false, onChanged: onChanged),
            ),
            const Text(
              'SIM',
              style: KTextStyle.textStyle,
            ),
            const SizedBox(
              width: 10,
            ),
            IgnorePointer(
              ignoring: value == null ? false : !value!,
              child: Checkbox(
                  value: value == null ? false : !value!,
                  onChanged: (val) {
                    onChanged(!(val!));
                  }),
            ),
            const Text(
              'NÃO',
              style: KTextStyle.textStyle,
            )
          ],
        )
      ],
    );
  }
}

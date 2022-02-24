import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class CustomRichText extends StatelessWidget {
  final String discription;
  final String text;
  final Function() onTap;
  const CustomRichText(
      {Key? key,
      required this.discription,
      required this.text,
      required this.onTap})
      : super(key: key);
// "Don't already Have an account? "
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text.rich(
        TextSpan(
            text: discription,
            style: const TextStyle(color: Colors.black87, fontSize: 14),
            children: [
              TextSpan(
                  text: text,
                  style: const TextStyle(color: AppColors.blue, fontSize: 14),
                  recognizer: TapGestureRecognizer()..onTap = onTap),
            ]),
      ),
    );
  }
}

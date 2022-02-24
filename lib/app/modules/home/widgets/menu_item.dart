import 'package:flutter/material.dart';
import 'package:hmv_care_app/core/theme/app_text_styles.dart';

class HomeMenuItem extends StatelessWidget {
  String text;
  String image;
  final Function() onTap;
  HomeMenuItem(this.text, this.onTap, this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black26, width: 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[600]!,
                  blurRadius: 2,
                  offset: const Offset(-1, 1))
            ]),
        margin: const EdgeInsets.all(10),
        height: 120,
        width: 120,
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              image,
              height: 62,
              width: 62,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

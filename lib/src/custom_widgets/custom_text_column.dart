import 'package:flutter/material.dart';
import 'package:mi_credencial/src/utils/my_style.dart';

class CustomTextColumn extends StatelessWidget {
  final String? title;
  final String? text;
  const CustomTextColumn({Key? key, this.title, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: MyStyles.black15Light,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          text!,
          style: MyStyles.black18Regular.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

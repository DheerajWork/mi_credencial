import 'package:flutter/material.dart';
import 'package:mi_credencial/src/utils/my_images.dart';
import 'package:mi_credencial/src/utils/my_style.dart';

class NotiRow extends StatelessWidget {
  final String? text;
  final String? lastText;
  const NotiRow({super.key, this.text, this.lastText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(MyImages.bellIcon),
            const SizedBox(
              width: 10,
            ),
            Text(text!,style: MyStyles.black15Regular,),
            const Spacer(),
            Text(lastText!,style: MyStyles.gray15Light,)
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

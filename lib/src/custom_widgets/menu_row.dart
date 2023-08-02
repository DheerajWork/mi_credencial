import 'package:flutter/material.dart';
import 'package:mi_credencial/src/utils/my_style.dart';

class MenuRow extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;

  const MenuRow({Key? key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Text(text!, style: MyStyles.black18Regular),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mi_credencial/src/utils/my_style.dart';

class ProfileCol extends StatelessWidget {
  final String? title;
  final String? text;

  const ProfileCol({Key? key, this.title, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title!,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).canvasColor,
                fontSize: 15)),
        const SizedBox(
          height: 3,
        ),
        Text(
          text!,
          style: MyStyles.black20Regular.copyWith(
            color: Theme.of(context).hintColor
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

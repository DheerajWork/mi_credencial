import 'package:flutter/material.dart';
import 'package:mi_credencial/src/utils/my_colors.dart';
import 'package:mi_credencial/src/utils/my_images.dart';
import 'package:mi_credencial/src/utils/my_style.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final bool? icon;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;

  const CustomTextField({super.key, this.title, this.hint, this.icon, this.controller, this.validator, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title!, style: MyStyles.black15Light),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: keyboardType??TextInputType.text,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.hintClr, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.hintClr, width: 1.0),
              ),
              suffixIcon: icon == true
                  ? Image.asset(MyImages.calendar)
                  : const SizedBox(),
              hintText: hint,
              hintStyle: MyStyles.gray15Light),
        ),
      ],
    );
  }
}

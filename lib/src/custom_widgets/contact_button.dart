import 'package:flutter/material.dart';
import 'package:mi_credencial/src/utils/my_images.dart';
import 'package:mi_credencial/src/utils/my_style.dart';

class ContactButton extends StatelessWidget {

  final String? text;
  final Color? borderClr;
  final Color? bgClr;
  final Color? textClr;
  final Color? iconClr;
  final String? img;
  final VoidCallback? onTap;

  const ContactButton({super.key, this.text, this.borderClr, this.bgClr, this.img, this.onTap, this.textClr, this.iconClr});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: bgClr ?? Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderClr!
          )
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Image.asset(img!,height: 35,color: iconClr),
            const SizedBox(
              width: 20,
            ),
            Text(text!,style: MyStyles.black15Regular.copyWith(
              color: textClr
            ),)
          ],
        ),
      ),
    );
  }
}

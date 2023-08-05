import 'package:flutter/material.dart';
import 'package:mi_credencial/src/utils/my_colors.dart';
import 'package:mi_credencial/src/utils/my_style.dart';

class NewsContentCard extends StatelessWidget {
  final String img;
  final String title;
  final String subject;
  final VoidCallback onTap;

  const NewsContentCard(
      {Key? key,
      required this.img,
      required this.title,
      required this.subject,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 158,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(img), fit: BoxFit.fill)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    title,
                    style: MyStyles.black22Normal.copyWith(
                      color: Theme.of(context).hintColor
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    subject,
                    style: MyStyles.black18Regular.copyWith(
                      color: Theme.of(context).hintColor
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "ver más",
                        style: MyStyles.blue15Light,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: MyColors.themeClr,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

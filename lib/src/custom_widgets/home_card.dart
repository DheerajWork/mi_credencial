import 'package:flutter/material.dart';
import 'package:mi_credencial/src/custom_widgets/custom_text_column.dart';
import 'package:mi_credencial/src/utils/my_colors.dart';
import 'package:mi_credencial/src/utils/my_images.dart';
import 'package:mi_credencial/src/utils/my_style.dart';

class HomeCard extends StatelessWidget {
  final String? name;
  final String? docNo;
  final String? cuil;
  final String? company;
  final String? date;
  final String? type;
  final String? afilNo;

  const HomeCard(
      {Key? key,
      this.name,
      this.docNo,
      this.cuil,
      this.company,
      this.date,
      this.type,
      this.afilNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .83,
      decoration: BoxDecoration(
          color: MyColors.bgClr, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 136,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.themeClr),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 150,
                      height: 62,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MyColors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name!, style: MyStyles.black22Normal),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextColumn(
                      title: "Número de documento",
                      text: docNo,
                    ),
                    CustomTextColumn(
                      title: "CUIL",
                      text: cuil,
                    ),
                    CustomTextColumn(
                      title: "Empresa",
                      text: company,
                    ),
                    CustomTextColumn(
                      title: "Fecha de afiliación",
                      text: date,
                    ),
                    Row(
                      children: [
                        CustomTextColumn(
                          title: "Tipo de afiliado",
                          text: type,
                        ),
                        const Spacer(),
                        Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: MyColors.themeClr)),
                            child: Image.asset(MyImages.minQr))
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(MyImages.rectangle2),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              const Spacer(),
              Container(
                width: 211,
                height: 61,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage(MyImages.rectangle))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AFILIADO Nº",
                        style: MyStyles.black15Light
                            .copyWith(color: MyColors.white),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        afilNo!,
                        style: MyStyles.black18Regular.copyWith(
                            color: MyColors.white, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

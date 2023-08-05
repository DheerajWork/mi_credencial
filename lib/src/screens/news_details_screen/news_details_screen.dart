import 'package:flutter/material.dart';
import 'package:mi_credencial/src/utils/my_colors.dart';
import 'package:mi_credencial/src/utils/my_style.dart';

class NewsDetailsScreen extends StatelessWidget {
  final String? img;
  final String? title;
  final String? sub;
  final String? details;
  final String? dsFile;

  const NewsDetailsScreen(
      {Key? key, this.img, this.title, this.sub, this.details, this.dsFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Theme.of(context).hintColor)),
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text("Novedad",style: TextStyle(color: Theme.of(context).hintColor)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Theme.of(context).cardColor),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 158,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(img!), fit: BoxFit.fill)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        title!,
                        style: MyStyles.black22Normal.copyWith(
                          color: Theme.of(context).hintColor
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        sub!,
                        style: MyStyles.black18Regular.copyWith(
                          color: Theme.of(context).hintColor
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        details!,
                        style: MyStyles.black15Light.copyWith(
                          color: Theme.of(context).hintColor
                        ),
                      )
                    ],
                  ),
                ),
              ),
              dsFile!.isNotEmpty
                  ? Container(
                      width: double.infinity,
                      height: 72,
                      decoration: const BoxDecoration(
                          color: Color(0xffE9DAFF),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_download_outlined,
                            color: MyColors.themeClr,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Descargar  Archivo",
                            style: MyStyles.blue18Light,
                          )
                        ],
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

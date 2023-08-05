import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mi_credencial/src/custom_widgets/home_card.dart';
import 'package:mi_credencial/src/model_class/home_card_model.dart';
import 'package:mi_credencial/src/screens/menu_screen/menu_screen.dart';
import 'package:mi_credencial/src/screens/profile_screen/profile_screen.dart';
import 'package:mi_credencial/src/utils/my_images.dart';
import 'package:mi_credencial/src/utils/my_style.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeCardModel> cardList = [];
  PageController controller = PageController();

  getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.micredencial.com.ar/card/C9950BEA9012437494FDDD3EE8DC601A"));

    var data = jsonDecode(response.body);

    cardList = (data as List).map((e) => HomeCardModel.fromJson(e)).toList();
    // if (response.statusCode == 200) {
    //
    //
    //   print("+++++++++++++++++++++++++ ${cardList[0].dsName}");
    //
    //   print("--------------------------up to date");
    // } else {
    //   const CircularProgressIndicator();
    //   print("Something Went Wrong");
    // }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: cardList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Image.asset(MyImages.logo2, width: 223, height: 32,color: Theme.of(context).canvasColor),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const ProfileScreen()));
                            },
                            child: Image.asset(MyImages.user, height: 25,color: Theme.of(context).canvasColor)),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const MenuScreen()));
                            },
                            child: Image.asset(
                              MyImages.menuIcon,
                              height: 18,
                                color: Theme.of(context).canvasColor
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: controller,
                      padEnds: false,
                      itemCount: cardList.length,
                      itemBuilder: (c, i) {
                        var myData = cardList[i];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: HomeCard(
                            name: myData.dsName,
                            docNo: myData.dsDocument,
                            cuil: myData.dsCuil,
                            company: myData.dsCompany,
                            date: myData.dtCreate,
                            type: myData.dsAffiliateType,
                            afilNo: myData.dsAffiliate,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "El uso de esta credencial es válido  únicamente con la presentación de  su DNI",
                      textAlign: TextAlign.center,
                      style: MyStyles.gray15Small.copyWith(
                          height: 1.2, color: Theme.of(context).hintColor),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
    );
  }
}

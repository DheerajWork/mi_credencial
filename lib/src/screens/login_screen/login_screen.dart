import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:mi_credencial/src/custom_widgets/custom_textfield.dart';
import 'package:mi_credencial/src/global/global.dart';
import 'package:mi_credencial/src/screens/home_screen/home_screen.dart';
import 'package:mi_credencial/src/utils/my_colors.dart';
import 'package:mi_credencial/src/utils/my_images.dart';
import 'package:mi_credencial/src/utils/my_style.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController numCont = TextEditingController(text: "18123000");
  TextEditingController dateCont = TextEditingController(text: "1967-07-03");

  // ignore: prefer_typing_uninitialized_variables

  String? fixDate = "1967-07-03";

  userLogin() async {
    print(
        "https://api.micredencial.com.ar/login/${numCont.text}/${dateCont.text}");
    http.Response response = await http.get(Uri.parse(
        'https://api.micredencial.com.ar/login/${numCont.text}/${date == null ? fixDate : "${date!.year}-${date!.month}-${date!.day}"}'));

    var data = jsonDecode(response.body);
    GlobalClass.phone1 = data[0]['ds_phone1'];
    GlobalClass.phone2 = data[0]['ds_phone2'];
    GlobalClass.whatsApp = data[0]['ds_whatsapp'];

    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('doc_number', numCont.text);
      sharedPreferences.setString('birth_date', '${date == null ? fixDate : "${date!.year}-${date!.month}-${date!.day}"}');
      print(sharedPreferences.get('doc_number'));
      print(sharedPreferences.get('birth_date'));
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      print("ERROR");
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  DateTime? date;

  myDatePicker(context) async {
    CupertinoRoundedDatePicker.show(
      context,
      maximumYear: 2023,
      minimumYear: 1900,
      textColor: Colors.white,
      background: Colors.red,
      borderRadius: 16,
      initialDatePickerMode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (val) {
        setState(() {
          date = val;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgClr,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Image.asset(MyImages.logo, width: 234, height: 100),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ingrese sus datos para acceder",
                    style: MyStyles.black18Light,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    title: "Número de documento",
                    hint: "Ingrese su documento",
                    controller: numCont,
                    icon: false,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text("Fecha de nacimiento",
                          style: MyStyles.black15Light
                              .copyWith(color: Theme.of(context).hintColor)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      myDatePicker(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: MyColors.hintClr, width: 1.0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                date == null
                                    ? "$fixDate"
                                    : "${date!.year}-${date!.month}-${date!.day}",
                                style: MyStyles.black15Light),
                            Image.asset(MyImages.calendar)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    width: 240,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        userLogin();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.themeClr,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text("Ingresar", style: MyStyles.white20Normal),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

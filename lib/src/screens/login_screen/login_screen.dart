import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mi_credencial/src/custom_widgets/custom_textfield.dart';
import 'package:mi_credencial/src/screens/home_screen/home_screen.dart';
import 'package:mi_credencial/src/utils/my_colors.dart';
import 'package:mi_credencial/src/utils/my_images.dart';
import 'package:mi_credencial/src/utils/my_style.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController numCont = TextEditingController(text: "18123000");
  TextEditingController dateCont = TextEditingController(text: "1967-07-03");

  userLogin() async {
    print(
        "https://api.micredencial.com.ar/login/${numCont.text}/${dateCont.text}");
    http.Response response = await http.get(Uri.parse(
        'https://api.micredencial.com.ar/login/${numCont.text}/${dateCont.text}'));

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgClr,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(MyImages.logo, width: 234, height: 100),
            SizedBox(
              height: MediaQuery.of(context).size.height*.1,
            ),
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
                    CustomTextField(
                      title: "Fecha de nacimiento",
                      hint: "Seleccione la fecha de su nacimiento",
                      controller: dateCont,
                      icon: true,
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
      ),
    );
  }
}

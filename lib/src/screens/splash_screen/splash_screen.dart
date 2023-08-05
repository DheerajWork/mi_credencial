import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mi_credencial/src/screens/home_screen/home_screen.dart';
import 'package:mi_credencial/src/screens/login_screen/login_screen.dart';
import 'package:mi_credencial/src/utils/my_colors.dart';
import 'package:mi_credencial/src/utils/my_images.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalDocNum;
String? finalBirthDate;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getValidationData().whenComplete(() async {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => finalDocNum != null
                      ? const LoginScreen()
                      : const HomeScreen())));
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedDocNum = sharedPreferences.get('doc_number');
    var obtainedBirthDate = sharedPreferences.get('birth_date');
    setState(() {
      finalDocNum = "$obtainedDocNum";
      finalBirthDate = "$obtainedBirthDate";
    });
    print("finalDocNum =>>>>>> $finalDocNum");
    print("finalBirthDate =>>>>>>$finalBirthDate");
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgClr,
      body: Center(
        child: Image.asset(MyImages.logo),
      ),
    );
  }
}

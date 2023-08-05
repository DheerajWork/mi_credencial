import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:mi_credencial/src/screens/about_us/about_us.dart';
import 'package:mi_credencial/src/screens/configuration_screen/configuration%20_screen.dart';
import 'package:mi_credencial/src/screens/home_screen/home_screen.dart';
import 'package:mi_credencial/src/screens/login_screen/login_screen.dart';
import 'package:mi_credencial/src/screens/menu_screen/menu_screen.dart';
import 'package:mi_credencial/src/screens/news_contents/news_contents.dart';
import 'package:mi_credencial/src/screens/notification_screen/notification_screen.dart';
import 'package:mi_credencial/src/screens/profile_screen/profile_screen.dart';
import 'package:mi_credencial/src/screens/splash_screen/splash_screen.dart';
import 'package:mi_credencial/src/utils/my_provider.dart';
import 'package:mi_credencial/src/utils/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          theme: MyThemes.lightTheme,
          themeMode: themeProvider.themeMode,
          darkTheme: MyThemes.darkTheme,
          title: 'MI Credencial',
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                myDatePicker(context);
              },
              child: const Text("Pick Date")),
          const SizedBox(
            height: 20,
          ),
          date == null
              ? const SizedBox()
              : Text("${date!.year}-${date!.month}-${date!.day}")
        ],
      ),
    );
  }
}



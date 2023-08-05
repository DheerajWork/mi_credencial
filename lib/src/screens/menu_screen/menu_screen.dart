import 'package:flutter/material.dart';
import 'package:mi_credencial/src/custom_widgets/contact_button.dart';
import 'package:mi_credencial/src/custom_widgets/menu_row.dart';
import 'package:mi_credencial/src/global/global.dart';
import 'package:mi_credencial/src/screens/about_us/about_us.dart';
import 'package:mi_credencial/src/screens/configuration_screen/configuration%20_screen.dart';
import 'package:mi_credencial/src/screens/home_screen/home_screen.dart';
import 'package:mi_credencial/src/screens/news_contents/news_contents.dart';
import 'package:mi_credencial/src/screens/notification_screen/notification_screen.dart';
import 'package:mi_credencial/src/screens/profile_screen/profile_screen.dart';
import 'package:mi_credencial/src/utils/my_colors.dart';
import 'package:mi_credencial/src/utils/my_images.dart';
import 'package:mi_credencial/src/utils/my_style.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  _bottomSheet(context) {
    final Uri phoneNum1 = Uri(scheme: 'tel',path: GlobalClass.phone1);
    final Uri phoneNum2 = Uri(scheme: 'tel',path: GlobalClass.phone2);
    final Uri whatsApp = Uri.parse("whatsapp://send?phone=${GlobalClass.whatsApp}&text=");
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (c) {
          return Container(
            width: double.infinity,
            height: 380,
            decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Theme.of(context).bottomAppBarColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 15, left: 15, bottom: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close)),
                    ],
                  ),
                  Center(
                    child: Text(
                      "Contacto",
                      style: MyStyles.black20Regular
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Teléfonos de contacto",
                    style: MyStyles.black18Light
                        .copyWith(color: Theme.of(context).hintColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ContactButton(
                    onTap: () {
                      launchUrl(whatsApp);
                      print("-------------------------$whatsApp");
                    },
                    text: "Escribinos por WhatsApp",
                    bgClr: Colors.green.withOpacity(0.2),
                    borderClr: Colors.green,
                    img: MyImages.whatsappIcon,
                    textClr: Colors.green,
                    iconClr: Colors.green,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ContactButton(
                    onTap: () {
                      launchUrl(phoneNum1);
                      print(phoneNum1);
                    },
                    text: GlobalClass.phone1,
                    borderClr: Theme.of(context).primaryColor,
                    img: MyImages.phoneIcon,
                    textClr: Theme.of(context).primaryColor,
                    iconClr: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ContactButton(
                    onTap: () {
                      launchUrl(phoneNum2);
                      print(phoneNum2);
                    },
                    text: GlobalClass.phone2,
                    borderClr: Theme.of(context).primaryColor,
                    img: MyImages.phoneIcon,
                    textClr: Theme.of(context).primaryColor,
                    iconClr: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child:
                Icon(Icons.arrow_back_ios, color: Theme.of(context).hintColor)),
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title:
            Text("Menú", style: TextStyle(color: Theme.of(context).hintColor)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 84,
                  height: 81,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: MyColors.themeClr, width: 3)),
                  child: GlobalClass.selectImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            GlobalClass.selectImage!,
                            fit: BoxFit.cover,
                          ))
                      : const SizedBox(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "John Washington\nDoe Perez",
                  style: MyStyles.black20Regular.copyWith(
                      height: 1.2, color: Theme.of(context).hintColor),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Divider(),
            const SizedBox(
              height: 10,
            ),
            MenuRow(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
              text: "Mis credenciales",
            ),
            MenuRow(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()));
              },
              text: "Mi perfil",
            ),
            MenuRow(
              onTap: () {},
              text: "Mi QR",
            ),
            MenuRow(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const NewsContents()));
              },
              text: "Novedades",
            ),
            MenuRow(
              onTap: () {
                _bottomSheet(context);
              },
              text: "Contacto",
            ),
            MenuRow(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const NotificationScreen()));
              },
              text: "Notificaciones",
            ),
            MenuRow(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ConfigurationScreen()));
              },
              text: "configuración",
            ),
            MenuRow(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AboutUs()));
              },
              text: "Acerca de",
            ),
          ],
        ),
      ),
    );
  }
}

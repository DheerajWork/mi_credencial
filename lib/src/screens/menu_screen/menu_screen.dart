import 'package:flutter/material.dart';
import 'package:mi_credencial/src/custom_widgets/menu_row.dart';
import 'package:mi_credencial/src/screens/about_us/about_us.dart';
import 'package:mi_credencial/src/screens/news_contents/news_contents.dart';
import 'package:mi_credencial/src/screens/notification_screen/notification_screen.dart';
import 'package:mi_credencial/src/screens/profile_screen/profile_screen.dart';
import 'package:mi_credencial/src/utils/my_colors.dart';
import 'package:mi_credencial/src/utils/my_style.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menú"),
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
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "John Washington\nDoe Perez",
                  style: MyStyles.black20Regular.copyWith(height: 1.2),
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
              onTap: () {},
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const NewsContents()));
              },
              text: "Novedades",
            ),
            MenuRow(
              onTap: () {},
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
            const SizedBox(
              height: 35,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
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

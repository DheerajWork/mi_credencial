import 'package:flutter/material.dart';
import 'package:mi_credencial/src/custom_widgets/menu_row.dart';
import 'package:mi_credencial/src/utils/my_style.dart';
import 'package:mi_credencial/src/utils/theme_provider.dart';
import 'package:provider/provider.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  bool switchVal = false;

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
        title: Text("configuración",style: TextStyle(color: Theme.of(context).hintColor)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Modo oscuro", style: MyStyles.black18Regular.copyWith(
                  color: Theme.of(context).hintColor
                )),
                const Spacer(),
                Switch(
                    value: Provider.of<ThemeProvider>(context).isDarkMode,
                    onChanged: (v) {
                      final provider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      provider.toggleTheme(v);
                    })
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            MenuRow(
              text: "Términos y condiciones",
              onTap: () {},
            ),
            MenuRow(
              text: "Política de privacidad",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

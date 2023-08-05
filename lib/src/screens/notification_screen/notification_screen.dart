import 'package:flutter/material.dart';
import 'package:mi_credencial/src/custom_widgets/noti_row.dart';
import 'package:mi_credencial/src/utils/my_style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
        title: Text("Notificaciones",style: TextStyle(color: Theme.of(context).hintColor)),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            NotiRow(
              text: "Your card is updated",
              lastText: "1 dia",
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            NotiRow(
              text: "Your card is updated",
              lastText: "3 dias",
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            NotiRow(
              text: "Your card is updated",
              lastText: "1 mes",
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            NotiRow(
              text: "Your card is updated",
              lastText: "1 año",
            ),
          ],
        ),
      ),
    );
  }
}

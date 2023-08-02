import 'package:flutter/material.dart';
import 'package:mi_credencial/src/custom_widgets/noti_row.dart';
import 'package:mi_credencial/src/utils/my_style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notificaciones",style: MyStyles.black20Regular),
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

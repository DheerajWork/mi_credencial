import 'package:flutter/material.dart';
import 'package:mi_credencial/src/utils/my_style.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
        title: Text("Acerca de",style: TextStyle(color: Theme.of(context).hintColor)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Notas",
                style: MyStyles.black18Light.copyWith(
                  color: Theme.of(context).hintColor
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  style: MyStyles.gray15Small.copyWith(
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).hintColor)),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Políticas de privacidad",
                style: MyStyles.black18Light.copyWith(
                  color: Theme.of(context).hintColor
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.""",
                  style: MyStyles.gray15Small.copyWith(
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).hintColor)),
            ],
          ),
        ),
      ),
    );
  }
}

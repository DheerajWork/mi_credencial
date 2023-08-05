import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  final String? title;

  const CustomAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Text(title!,style: TextStyle(color: Theme.of(context).hintColor)),
      centerTitle: true,
    );
  }
}

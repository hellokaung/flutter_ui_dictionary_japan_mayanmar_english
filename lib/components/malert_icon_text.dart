import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

// ignore: must_be_immutable, camel_case_types
class mAlertIconandText extends StatelessWidget {
  String title;
  mAlertIconandText(this.title, {super.key});
  @override
  Widget build(Object context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.info,
          color: MyColors.primaryItemColor,
          size: 50,
        ),
        Text(
          title,
          style: const TextStyle(color: MyColors.primaryItemColor),
        ),
      ],
    ));
  }
}

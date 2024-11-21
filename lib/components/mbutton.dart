import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

// ignore: must_be_immutable, camel_case_types
class mButton extends StatelessWidget {
  Function onpress;
  String data;
  bool activeButton;
  mButton(this.onpress, this.data, this.activeButton, {super.key});
  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: ElevatedButton(
        onPressed: () => onpress(),
        style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll(
                MyColors.primaryItemForgregoundColor),
            backgroundColor: activeButton
                ? const WidgetStatePropertyAll(MyColors.primaryItemColor)
                : const WidgetStatePropertyAll(
                    MyColors.primaryItemBackgroundgoundColor)),
        child: Text(data),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_ui/colors/app_colors.dart';

class mLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: double.infinity,
      height: 1,
      color: MyColors().primaryLineColor,
    );
  }
}

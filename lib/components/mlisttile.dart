import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
// ignore: must_be_immutable, camel_case_types
class mListTile extends StatelessWidget {
  String title;
  String subtitle;

  Function onTap;
  mListTile(this.title, this.subtitle, this.onTap, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors().primaryItemCardColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: ListTile(
        onTap: () => onTap(),
        title: Text(
          title,
          style: TextStyle(
              color: MyColors().primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
        subtitle: Text(subtitle),
        trailing:
            IconButton(onPressed: () {}, icon: const Icon(Icons.volume_up)),
      ),
    );
  }
}
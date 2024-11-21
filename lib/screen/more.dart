import 'package:flutter/material.dart';
import 'package:flutter_dictionary_ui/colors/app_colors.dart';
import 'package:flutter_dictionary_ui/string/app_string.dart';

import '../components/mline.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => {},
          leading: const Icon(
            Icons.keyboard,
            color: MyColors.primaryItemColor,
          ),
          title: const Text(myString.choose_keyboard),
          subtitle: const Text(myString.selcted_keyboard),
        ),
        mLine(),
        ListTile(
          onTap: () => {},
          leading: const Icon(
            Icons.star,
            color: MyColors.primaryItemColor,
          ),
          title: const Text(myString.give_star),
        ),
        ListTile(
          onTap: () => {},
          leading: const Icon(
            Icons.share,
            color: MyColors.primaryItemColor,
          ),
          title: const Text(myString.share_with_friend),
        ),
        ListTile(
          onTap: () => {},
          leading: const Icon(
            Icons.more_horiz,
            color: MyColors.primaryItemColor,
          ),
          title: const Text(myString.more_apps),
        ),
        mLine(),
        const ListTile(
          title: Center(child: Text(myString.app_version)),
        )
      ],
    );
  }
}

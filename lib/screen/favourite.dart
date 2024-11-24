import 'package:flutter/material.dart';
import 'package:flutter_dictionary_ui/components/malert_icon_text.dart';
import 'package:flutter_dictionary_ui/components/mlisttile.dart';
import 'package:flutter_dictionary_ui/string/app_string.dart';
import '../colors/app_colors.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => FavouritePageState();
}

class FavouritePageState extends State<FavouritePage> {
  List<String> list = List.generate(3, (index) => 'Fav$index');
  void clearHistory() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              icon: const Icon(Icons.delete_forever),
              title: const Text(myString.delete_title),
              content: const Text(myString.delete_content),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(myString.cancel)),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);

                      setState(() {
                        list.clear();
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: MyColors.delete)),
                    child: Text(
                      myString.delete,
                      style: TextStyle(color: MyColors().delete_text),
                    ))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: list.isEmpty
            ? mAlertIconandText(myString.no_favorite)
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return mListTile(list[index], 'Sub${list[index]}', () {});
                },
              ),
      ),
    );
  }
}

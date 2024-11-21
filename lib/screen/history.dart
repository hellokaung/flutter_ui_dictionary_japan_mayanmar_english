import 'package:flutter/material.dart';
import 'package:flutter_dictionary_ui/components/malert_icon_text.dart';
import 'package:flutter_dictionary_ui/components/mlisttile.dart';
import 'package:flutter_dictionary_ui/string/app_string.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  List<String> list = List.generate(5, (index) => 'History$index');
  void clearHistory() {
    setState(() {
      list.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: list.isEmpty
            ? mAlertIconandText(myString.no_history)
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

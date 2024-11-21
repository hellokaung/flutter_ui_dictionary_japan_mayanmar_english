import 'package:flutter/material.dart';
import 'package:flutter_dictionary_ui/colors/app_colors.dart';
import 'package:flutter_dictionary_ui/components/malert_icon_text.dart';
import 'package:flutter_dictionary_ui/string/app_string.dart';

import '../components/mbutton.dart';
import '../components/mlisttile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  List<String> languages = ['english', 'myanmar', 'japanese'];
  // ignore: non_constant_identifier_names
  List<String> search_words = [];
  int ch = 0;
  void _search(val) {
    setState(() {
      search_words = List.generate(10, (index) => '$val$index');
    });
  }

  void changeCh(int newCh) {
    setState(() {
      ch = newCh;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            onChanged: (value) => _search(value),
            decoration: InputDecoration(
                hintText: myString().search_hint,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors().primaryColor)),
                focusColor: MyColors().primaryColor,
                hoverColor: MyColors().primaryColor,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _controller.clear();
                      });
                    },
                    icon: Icon(
                      Icons.close,
                      color: _controller.value.text.isNotEmpty
                          ? MyColors().primaryColor
                          : MyColors().primaryItemWhiteColor,
                    ))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mButton(() {
                changeCh(0);
              }, myString().bt_english, ch == 0),
              mButton(() {
                changeCh(1);
              }, myString().bt_myanmar, ch == 1),
              mButton(() {
                changeCh(2);
              }, myString().bt_japanese, ch == 2)
            ],
          ),
          Expanded(
            child: _controller.value.text.isEmpty
                ? mAlertIconandText('Enter ${languages[ch]}!')
                : ListView.builder(
                    itemCount: search_words.length,
                    itemBuilder: (BuildContext context, int index) {
                      return mListTile(
                          search_words[index], 'Subtitle : $index', () {});
                    },
                  ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dictionary_ui/colors/app_colors.dart';
import 'package:flutter_dictionary_ui/screen/favourite.dart';
import 'package:flutter_dictionary_ui/screen/history.dart';
import 'package:flutter_dictionary_ui/screen/home.dart';
import 'package:flutter_dictionary_ui/screen/more.dart';
import 'package:flutter_dictionary_ui/string/app_string.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: MyColors().backgroundColor,
        primaryColor: MyColors().primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

GlobalKey<HistoryPageState> history_key = GlobalKey();
GlobalKey<FavouritePageState> fav_key = GlobalKey();

class _HomeState extends State<Home> {
  late List<Widget> screen;
  final List<String> _pages = ['Search', 'History', 'Favourite', 'More'];
  int currentIndex = 0;
  void changeScreen(int i) {
    setState(() {
      currentIndex = i;
    });
  }

  @override
  void initState() {
    super.initState();
    screen = [
      const HomeScreen(),
      HistoryPage(
        key: history_key,
      ),
      FavouritePage(
        key: fav_key,
      ),
      const MorePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: currentIndex == 0 ? 0 : kToolbarHeight,
        title: Text(_pages[currentIndex]),
        backgroundColor: MyColors().appBarBackgroundColor,
        actions: currentIndex == _pages.length - 1
            ? []
            : [
                IconButton(
                    onPressed: () {
                      currentIndex == 1
                          ? history_key.currentState?.clearHistory()
                          : fav_key.currentState?.clearHistory();
                    },
                    icon: const Icon(Icons.delete_forever))
              ],
      ),
      body: SafeArea(child: screen[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (i) => changeScreen(i),
          currentIndex: currentIndex,
          backgroundColor: MyColors().navBackgroundColor,
          selectedItemColor: MyColors().navActiveColor,
          unselectedItemColor: Colors.grey.shade500,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.search), label: myString().nav_search),
            BottomNavigationBarItem(
                icon: const Icon(Icons.history), label: myString().nav_history),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite), label: myString().nav_fav),
            BottomNavigationBarItem(
                icon: const Icon(Icons.more_horiz), label: myString().nav_more),
          ]),
    );
  }
}

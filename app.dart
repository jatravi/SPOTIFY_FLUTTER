import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/screens/home.dart';
import 'package:spotify_app/screens/search.dart';
import 'package:spotify_app/screens/yourlibrary.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Tabs = [Home(), Search(), YourLibrary()];
  int currentTabIndex = 0;

  //UI Design Code goes inside build ....

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Tabs[currentTabIndex],
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTabIndex,
          onTap: (currentIndex) {
            //print("Current tab index is $currentIndex");
            currentTabIndex = currentIndex;
            setState(() {});
          },
          selectedLabelStyle: TextStyle(color: Colors.white),
          selectedItemColor: Colors.white,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.white), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.my_library_music_rounded, color: Colors.white),
                label: 'Your Library')
          ],
        ));
  }
}

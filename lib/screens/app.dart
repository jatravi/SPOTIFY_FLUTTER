import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/Models/Music.dart';
import 'package:spotify_app/main.dart';
import 'package:spotify_app/screens/home.dart';
import 'package:spotify_app/screens/search.dart';
import 'package:spotify_app/screens/yourlibrary.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var Tabs = [];
  int currentTabIndex = 0;
  Music? music;
  Widget MiniPlayer(Music? music) {
    setState(() {});
    if (music == null) {
      return SizedBox();
    }
    Size device_size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 550),
      color: Colors.blueGrey,
      width: device_size.width,
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.network(music.image, fit: BoxFit.cover),
        Text(music.name, style: TextStyle(color: Colors.white, fontSize: 20)),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.play_arrow),
          color: Colors.white,
        )
      ]),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tabs = [Home(MiniPlayer), Search(), YourLibrary()];
  }
  //UI Design Code goes inside build ....

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Tabs[currentTabIndex],
        backgroundColor: Colors.black,
        bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
          MiniPlayer(music),
          BottomNavigationBar(
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
                  icon: Icon(Icons.search, color: Colors.white),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon:
                      Icon(Icons.my_library_music_rounded, color: Colors.white),
                  label: 'Your Library')
            ],
          ),
        ]));
  }
}

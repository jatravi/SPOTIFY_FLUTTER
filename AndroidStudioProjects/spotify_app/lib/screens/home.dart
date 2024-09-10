import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/Models/Category.dart';
import 'package:spotify_app/Services/Category_operations.dart';
import 'package:spotify_app/Services/Music_Operations.dart';

import '../Models/Music.dart';

class Home extends StatelessWidget {
  Function _miniPlayer;
  Home(this._miniPlayer);   // Dart Constructor ShortHand
 // const Home({super.key});

  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(message),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 14), child: Icon(Icons.settings))
      ],
    );
  }

  Widget createCategory(Category category) {
    return Container(
        color: Colors.grey.shade800,
        child: Row(children: [
          Image.network(
            category.imageURL,
            fit: BoxFit.cover,
          ),
          Padding(padding: EdgeInsets.only(left: 14)),
          Text(category.name, style: TextStyle(color: Colors.white))
        ]));
  }

  createlistOfCategories() {
    List<Category> categoryList =
        CategoryOperation.getCategories(); // recives data
    // Convert data into Widgets using map function.
    List<Widget> Categories = categoryList
        .map((Category category) => createCategory(category))
        .toList();
    return Categories;
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Container(
          height: 200,
          width: 200,
          child: InkWell(
            onTap: () {
              _miniPlayer(music);
            },
            child: Image.network(
              music.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          music.name,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          music.discription,
          style: TextStyle(color: Color.fromARGB(255, 165, 104, 104)),
        )
      ]),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOperations.getMusic();
    return Padding(padding: EdgeInsets.only(left : 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(label, style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold),),
        Container(
          height: 303,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(5),
            itemBuilder: (context, index) {
              return createMusic(musicList[index]);
            },
            itemCount: musicList.length,
          ),
        ),
      ]),
    );
  }

  Widget createGrid() {
    return Container(
      height: 180,
      child: GridView.count(
        childAspectRatio: 6 / 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 8,
        padding: EdgeInsets.all(14),
        children: createlistOfCategories(),
        crossAxisCount: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
        child: Column(children: [
          createAppBar('Good Morning'),
          SizedBox(height: 5),
          createGrid(),
          createMusicList(' Made For You'),
          createMusicList(' Popular PlayList')
        ]),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.blueGrey.shade300,
          Colors.black,
          Colors.black,
          Colors.black
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      )),
    );
  }
}

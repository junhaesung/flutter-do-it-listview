import 'package:flutter/material.dart';
import 'package:listview_example/sub/firstPage.dart';
import 'package:listview_example/sub/secondPage.dart';

import 'animalItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  List<Animal> animalList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(Animal(
      animalName: '벌',
      kind: '곤충',
      imagePath: 'images/bee.png',
    ));
    animalList.add(Animal(
      animalName: '고양이',
      kind: '포유류',
      imagePath: 'images/cat.png',
    ));
    animalList.add(Animal(
      animalName: '젖소',
      kind: '포유류',
      imagePath: 'images/cow.png',
    ));
    animalList.add(Animal(
      animalName: '강아지',
      kind: '포유류',
      imagePath: 'images/dog.png',
    ));
    animalList.add(Animal(
      animalName: '여우',
      kind: '포유류',
      imagePath: 'images/fox.png',
    ));
    animalList.add(Animal(
      animalName: '원숭이',
      kind: '영장류',
      imagePath: 'images/monkey.png',
    ));
    animalList.add(Animal(
      animalName: '돼지',
      kind: '포유류',
      imagePath: 'images/pig.png',
    ));
    animalList.add(Animal(
      animalName: '늑대',
      kind: '포유류',
      imagePath: 'images/wolf.png',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: TabBarView(
        children: [
          FirstApp(list: animalList),
          SecondApp(list: animalList),
        ],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.looks_one, color: Colors.blue),
          ),
          Tab(
            icon: Icon(Icons.looks_two, color: Colors.blue),
          )
        ],
        controller: controller,
      ),
    );
  }
}

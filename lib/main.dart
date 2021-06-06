import 'package:flutter/material.dart';

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(),
    );
  }
}

import 'package:flutter/material.dart';

import '../animalItem.dart';

class FirstApp extends StatelessWidget {
  final List<Animal> list;

  FirstApp({required this.list}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView.builder(
      itemBuilder: (context, position) {
        var card = Card(
          child: Row(
            children: [
              Image.asset(
                list[position].imagePath,
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
              Text(list[position].animalName)
            ],
          ),
        );
        return GestureDetector(
            child: card,
            onTap: () {
              AlertDialog dialog = AlertDialog(
                content: Text('이 동물은 ${list[position].kind} 입니다'),
                contentTextStyle:
                    TextStyle(fontSize: 30.0, color: Colors.black),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) => dialog,
              );
            });
      },
      itemCount: list.length,
    )));
  }
}

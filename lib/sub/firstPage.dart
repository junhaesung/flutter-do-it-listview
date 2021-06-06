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
        return Card(
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
      },
      itemCount: list.length,
    )));
  }
}

import 'package:flutter/material.dart';

import '../animalItem.dart';

class FirstApp extends StatelessWidget {
  final List<Animal> list;

  FirstApp({required this.list}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: ListView.builder(itemBuilder: (context, position) {
      return Card();
    })));
  }
}

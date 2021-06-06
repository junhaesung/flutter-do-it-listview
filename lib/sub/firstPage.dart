import 'package:flutter/material.dart';

import '../animalItem.dart';

class FirstApp extends StatelessWidget {
  final List<Animal> list;

  FirstApp({required this.list}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('첫 번째 페이지')));
  }
}

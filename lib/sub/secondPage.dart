import 'package:flutter/material.dart';

import '../animalItem.dart';

class SecondApp extends StatelessWidget {
  final List<Animal> list;

  SecondApp({required this.list}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('두 번째 페이지')));
  }
}

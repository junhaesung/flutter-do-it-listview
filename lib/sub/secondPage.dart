import 'package:flutter/material.dart';

import '../animalItem.dart';

class SecondApp extends StatefulWidget {
  final List<Animal> list;

  SecondApp({required this.list}) : super();

  @override
  State<StatefulWidget> createState() => _SecondAppState();
}

class _SecondAppState extends State<SecondApp> {
  final nameController = TextEditingController();
  int _radioValue = 0;
  bool _flyExist = false;
  late String _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            maxLines: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Radio(value: 0, groupValue: _radioValue, onChanged: _radioChange),
              Text('양서류'),
              Radio(value: 1, groupValue: _radioValue, onChanged: _radioChange),
              Text('파충류'),
              Radio(value: 2, groupValue: _radioValue, onChanged: _radioChange),
              Text('포유류'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('날 수 있나요?'),
              Checkbox(
                  value: _flyExist,
                  onChanged: (check) {
                    setState(() {
                      _flyExist = check != null ? check : false;
                    });
                  }),
            ],
          ),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _createGestureDetector('cow'),
                _createGestureDetector('pig'),
                _createGestureDetector('bee'),
                _createGestureDetector('cat'),
                _createGestureDetector('dog'),
                _createGestureDetector('fox'),
                _createGestureDetector('monkey'),
              ],
            ),
          ),
          RaisedButton(
            child: Text('동물 추가하기'),
            onPressed: () {
              var animal = Animal(
                animalName: nameController.value.text,
                kind: _getKind(_radioValue),
                imagePath: _imagePath,
                flyExist: _flyExist,
              );
              AlertDialog dialog = AlertDialog(
                title: Text('동물 추가하기'),
                content: Text(
                  '이 동물은 ${animal.animalName} 입니다. '
                  '또 이 동물의 종류는 ${animal.kind} 입니다. \n이 동물을 추가하시겠습니까?',
                  style: TextStyle(fontSize: 30.0, color: Colors.black),
                ),
                actions: [
                  RaisedButton(
                    onPressed: () {
                      widget.list.add(animal);
                      Navigator.of(context).pop();
                    },
                    child: Text('예'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('아니오'),
                  ),
                ],
              );
              showDialog(
                context: context,
                builder: (BuildContext context) => dialog,
              );
            },
          )
        ],
      ),
    ));
  }

  GestureDetector _createGestureDetector(String animalName) {
    String imagePath = _createImagePath(animalName);
    return GestureDetector(
      child: Image.asset(
        imagePath,
        width: 80,
      ),
      onTap: () {
        _imagePath = imagePath;
      },
    );
  }

  String _createImagePath(String animalName) {
    return 'images/$animalName.png';
  }

  void _radioChange(int? value) {
    setState(() {
      _radioValue = value != null ? value : 0;
    });
  }

  String _getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return "양서류";
      case 1:
        return "파충류";
      case 2:
        return "포유류";
      default:
        throw new Exception('Undefined radioValue. radioValue: $radioValue');
    }
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _color;

  void changeColor() {
    setState(() =>
        _color = Colors.primaries[Random().nextInt(Colors.primaries.length)]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => changeColor(),
        child: Container(
          color: _color,
          child: Center(
            child: Text('Hey there', textScaleFactor: 2.5),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
    home: HomeScreen(),
  ));
}

import 'package:flutter/material.dart';
import 'package:flutter_intelij_test/screens/homeScreen/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //TODO add provider in root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZORYS',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}

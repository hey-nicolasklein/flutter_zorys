import 'package:flutter/material.dart';
import 'package:flutter_intelij_test/models/library.dart';
import 'package:flutter_intelij_test/screens/homeScreen/homeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Library(),
      child: MaterialApp(
        title: 'ZORYS',
        theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600, color: Colors.black87),
            headline3: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.black87),
            headline4: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
            headline5: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w800, color: Colors.white),
            headline6: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white),
          )
        ),
        home: HomeScreen(),
      ),
    );
  }
}

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
        ),
        home: HomeScreen(),
      ),
    );
  }
}

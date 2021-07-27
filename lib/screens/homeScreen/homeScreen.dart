import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intelij_test/screens/homeScreen/tabs/discoverTab/discoverTab.dart';
import 'package:flutter_intelij_test/screens/homeScreen/tabs/findTab/findTab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  final List<Widget> _tabs = [DiscoverTab(), FindTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ZORYS'),
      ),
      body: IndexedStack(index: _currentTab, children: _tabs,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.select_all_rounded), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
        ],
        onTap: (position){
          setState(() {
            _currentTab = position;
          });
        },
      ),
    );
  }
}

import 'package:blur_bottom_bar/blur_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intelij_test/screens/homeScreen/tabs/discoverTab/discoverTab.dart';
import 'package:flutter_intelij_test/screens/homeScreen/tabs/findTab/libraryTab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  final List<Widget> _tabs = [DiscoverTab(), LibraryTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('ZORYS'),
      ),
      body: IndexedStack(index: _currentTab, children: _tabs,),
      bottomNavigationBar: BlurBottomView(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black54,
        currentIndex: _currentTab,
        bottomNavigationBarItems: [
          BottomNavigationBarItem(icon: Icon(Icons.select_all_rounded), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
        ],
        onIndexChange: (position){
          setState(() {
            _currentTab = position;
          });
        },
      ),
    );
  }
}

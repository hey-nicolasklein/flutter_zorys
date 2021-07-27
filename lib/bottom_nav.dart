import 'package:flutter/material.dart';

class CustomNav extends StatelessWidget {
  final int _localIndex;
  final Function _onTappedCallback;

  CustomNav(this._localIndex, this._onTappedCallback);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
      currentIndex: _localIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onTappedCallback(_localIndex),
    );
  }
}

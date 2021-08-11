import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intelij_test/screens/homeScreen/tabs/discoverTab/bookGrid.dart';
import 'package:flutter_intelij_test/screens/homeScreen/tabs/discoverTab/verticalList.dart';
import 'package:flutter_intelij_test/screens/homeScreen/tabs/discoverTab/verticalShowcase.dart';

class DiscoverTab extends StatelessWidget {
  const DiscoverTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SizedBox(
        height: 5,
      ),
      BookGrid(),
      VerticalShowcase(),
      VerticalList(),
    ]);
  }
}


class ColumnBar extends StatelessWidget {
  final String headline;

  const ColumnBar(this.headline, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$headline',
            style: Theme.of(context).textTheme.headline2,
          ),
          TextButton(onPressed: () => {}, child: Text('See more'))
        ],
      ),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intelij_test/models/catalog.dart';
import 'package:flutter_intelij_test/models/library.dart';
import 'package:flutter_intelij_test/screens/homeScreen/tabs/discoverTab/bookGrid.dart';
import 'package:provider/provider.dart';

class DiscoverTab extends StatelessWidget {
  const DiscoverTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SizedBox(
        height: 100,
      ),
      BookGrid(),
      SizedBox(
        height: 20,
      ),
      VerticalList(),
    ]);
  }
}

class VerticalList extends StatelessWidget {
  const VerticalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: Column(
        children: [
          _ColumnBar('See more'),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [...CatalogModel.catalog.map((e) => _CoverListItem(e))],
            ),
          ),
        ],
      ),
    );
  }
}

class _ColumnBar extends StatelessWidget {
  final String headline;

  const _ColumnBar(this.headline, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Recommended Stories', style: Theme.of(context).textTheme.headline2,),
          TextButton(onPressed: () => {}, child: Text('See more'))
        ],
      ),
    );
  }
}

class _CoverListItem extends StatelessWidget {
  final Book book;

  const _CoverListItem(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
                height: 200,
                image: AssetImage('assets/covers/${book.coverName}.jpg')),
          ),
          SizedBox(
            height: 15,
          ),
          Text(book.title, style: Theme.of(context).textTheme.headline3,),
          Text(book.author, style: Theme.of(context).textTheme.headline4,)
        ],
      ),
    );
  }
}

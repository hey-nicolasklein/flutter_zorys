import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intelij_test/models/catalog.dart';

import 'discoverTab.dart';

class VerticalList extends StatelessWidget {
  const VerticalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: Column(
        children: [
          ColumnBar("Recommended Story's"),
          Expanded(
            child: ListView(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [...CatalogModel.catalog.map((e) => _VerticalListItem(e))],
            ),
          ),
        ],
      ),
    );
  }
}

class _VerticalListItem extends StatelessWidget {
  final Book book;

  const _VerticalListItem(this.book, {Key? key}) : super(key: key);

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
              image: AssetImage('assets/covers/${book.coverName}.jpg'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            book.title,
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            book.author,
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }
}
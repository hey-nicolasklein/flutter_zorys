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
        height: 5,
      ),
      VerticalShowcase(),
      SizedBox(
        height: 5,
      ),
      VerticalList(),
    ]);
  }
}

class VerticalShowcase extends StatelessWidget {
  const VerticalShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: double.infinity,
      child: Column(
        children: [
          _ColumnBar('Highlights'),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ShowcaseItem('Dune', 'by Jake Dennon', 'Roman', 'poster0')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShowcaseItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String tags;
  final String poster;

  const ShowcaseItem(this.title, this.subtitle, this.tags, this.poster,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Image(
                height: 150,
                width: 280,
                fit: BoxFit.cover,
                image: AssetImage('assets/posters/poster0.jpg'),
              ),
              Container(
                height: 150,
                width: 140,
                color: Colors.black54,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                            child: Text('Roman', style: Theme.of(context).textTheme.headline3,),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${this.title}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        '${this.subtitle}',
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
          _ColumnBar("Recommended Story's"),
          Expanded(
            child: ListView(
              physics: ClampingScrollPhysics(),
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

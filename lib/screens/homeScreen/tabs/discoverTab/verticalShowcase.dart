import 'package:flutter/material.dart';

import 'discoverTab.dart';

class VerticalShowcase extends StatelessWidget {
  const VerticalShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: double.infinity,
      child: Column(
        children: [
          ColumnBar('Highlights'),
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
                            child: Text(
                              'Roman',
                              style: Theme.of(context).textTheme.headline3,
                            ),
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

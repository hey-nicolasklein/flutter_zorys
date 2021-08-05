import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intelij_test/models/catalog.dart';
import 'package:flutter_intelij_test/models/library.dart';
import 'package:provider/provider.dart';

class DiscoverTab extends StatelessWidget {
  const DiscoverTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SizedBox(
        height: 100,
      ),
      _BookGrid(),
    ]);
  }
}

class _BookGrid extends StatelessWidget {
  const _BookGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: GridView.count(
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        childAspectRatio: MediaQuery.of(context).size.height / 2600,
        crossAxisSpacing: 5,
        mainAxisSpacing: 0,
        crossAxisCount: 2,
        children: [
          ...CatalogModel.catalog.map((element) => _MyListItem(element))
        ],
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final Book book;

  const _MyListItem(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        child: ListTile(
          title: Text(book.title),
          subtitle: Text(book.author),
          leading:
              Image(image: AssetImage('assets/covers/${book.coverName}.jpg')),
          trailing: AddButton(book),
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton(this.book, {Key? key}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    var isInLibrary = context
        .select<Library, bool>((library) => library.items.contains(book));

    return TextButton(
      onPressed: isInLibrary
          ? () {
              Provider.of<Library>(context, listen: false).remove(book);
            }
          : () {
              var library = context.read<Library>();
              library.add(book);
            },
      child: isInLibrary ? const Icon(Icons.check) : const Text('add'),
    );
  }
}

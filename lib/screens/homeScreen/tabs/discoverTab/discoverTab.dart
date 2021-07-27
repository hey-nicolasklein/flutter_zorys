import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intelij_test/models/catalog.dart';
import 'package:flutter_intelij_test/models/library.dart';
import 'package:provider/provider.dart';

class DiscoverTab extends StatelessWidget {
  const DiscoverTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Library>(builder: (context, library, child) {
      return ListView.builder(
        itemCount: CatalogModel.catalog.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return _MyListItem(index);
        },
      );
    });
  }

  Card generateBookCard(Book book) {
    return Card(
      child: ListTile(
        title: Text(book.title),
        subtitle: Text(book.author),
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = CatalogModel().getBookByPosition(index);

    return Card(
      child: ListTile(
        title: Text(item.title),
        subtitle: Text(item.author),
        leading: AddButton(item),
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
          ? null
          : () {
              var library = context.read<Library>();
              library.add(book);
            },
      child: isInLibrary ? const Icon(Icons.check) : const Text('add'),
    );
  }
}

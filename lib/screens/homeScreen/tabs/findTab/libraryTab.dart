import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intelij_test/models/catalog.dart';
import 'package:flutter_intelij_test/models/library.dart';
import 'package:provider/provider.dart';

class LibraryTab extends StatelessWidget {
  const LibraryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Library>(builder: (context, library, child) {
      return ListView.builder(
          itemCount:
              context.select<Library, int>((library) => library.items.length),
          itemBuilder: (context, index) {
            return _MyListItem(index);
          });
    });
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = context.select<Library, List<Book>>((library) => library.items);
    var item = list[index];
    return Card(
      child: ListTile(
        title: Text(item.title),
        subtitle: Text(item.author),
      ),
    );
  }
}

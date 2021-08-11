import 'package:flutter/material.dart';
import 'package:flutter_intelij_test/models/catalog.dart';
import 'package:flutter_intelij_test/models/library.dart';
import 'package:flutter_intelij_test/screens/homeScreen/tabs/discoverTab/discoverTab.dart';
import 'package:provider/provider.dart';

class BookGrid extends StatelessWidget {
  const BookGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColumnBar('Good morning, Nicolas'),
        Container(
          height: 180,
          width: double.infinity,
          child: GridView.count(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            childAspectRatio: MediaQuery.of(context).size.height / 2700,
            crossAxisSpacing: 0,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            children: [
              ...CatalogModel.catalog.map((element) => _MyListItem(element))
            ],
          ),
        ),
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final Book book;

  const _MyListItem(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 6),
      child: Card(
        color: Colors.red,
        child: ListTile(
          title: Text(book.title),
          subtitle: Text(book.author),
          leading: Image(
            image: AssetImage('assets/covers/${book.coverName}.jpg'),
          ),
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
      child: isInLibrary
          ? const Icon(Icons.check, color: Colors.black54,)
          : const Icon(Icons.add, color: Colors.black54),
    );
  }
}

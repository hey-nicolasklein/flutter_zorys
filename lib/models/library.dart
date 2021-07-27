import 'package:flutter/material.dart';

import 'catalog.dart';

class Library extends ChangeNotifier{

  /// whole catalog
  CatalogModel _catalog = CatalogModel();

  /// local library
  final List<int> _libraryIds = [];

  ///setup catalog when created TODO
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  ///add new book to library
  void add(Book item) {
    _libraryIds.add(item.id);
    notifyListeners();
  }

  /// The current catalog. Used to construct items from numeric ids.
  CatalogModel get catalog => _catalog;

  /// List of items in the library.
  List<Book> get library => _libraryIds.map((id) => _catalog.getBookByID(id)).toList();
}
class CatalogModel{
  static List<Book> catalog = [
    Book(0, 'Harry Potter', 'J.K. Roling', 5, 'cover0'),
    Book(1, 'Versäumnis', 'A.P. Porter', 2, 'cover1'),
    Book(2, 'Borne', 'Cameron Dias', 4, 'cover2'),
    Book(3, 'Harry Potter', 'J.K. Roling', 5, 'cover0'),
    Book(4, 'Versäumnis', 'A.P. Porter', 2, 'cover1'),
    Book(5, 'Borne', 'Cameron Dias', 4, 'cover2'),
  ];

  Book getBookByPosition(int position){
    return catalog[position];
  }

  Book getBookByID(int id){
    // simplified
    return catalog[id];
  }
}

class Book{
  int id;
  String title;
  String author;
  int rating;
  String coverName;

  Book(this.id, this.title, this.author, this.rating, this.coverName);
}
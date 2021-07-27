class CatalogModel{
  static List<Book> catalog = [
    Book(0, 'Harry Potter', 'J.K. Roling', 5),
    Book(1, 'Versäumnis', 'A.P. Porter', 2),
    Book(2, 'Borne', 'Cameron Dias', 4),
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

  Book(this.id, this.title, this.author, this.rating);
}
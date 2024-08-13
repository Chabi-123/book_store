class BookList {
  String image;
  String bookName;
  String authore;
  String publishDate;
  int price;
  int quantity;
  double rating;
  bool Bookmarked;

  BookList({
    required this.image,
    required this.bookName,
    required this.authore,
    required this.publishDate,
    required this.price,
    required this.quantity,
    required this.rating,
    this.Bookmarked = false,
});

}


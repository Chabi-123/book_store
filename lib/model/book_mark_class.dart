class Book {
  final String bookName;
  final String image;
  final double price;
  bool isBookmarked;

  Book({
    required this.bookName,
    required this.image,
    required this.price,
    this.isBookmarked = false,
  });
}

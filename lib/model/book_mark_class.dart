class Book {
  final String bookName;
  final String image;
  final double price;
  bool isBookmarked; // Add this property

  Book({
    required this.bookName,
    required this.image,
    required this.price,
    this.isBookmarked = false, // Initialize as false
  });
}

class Book {
  String image;
  double price;
  double rating; // Add this field

  Book({
    required this.image,
    required this.price,
    this.rating = 0.0, // Initialize with a default rating
  });
}

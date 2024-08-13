import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/class/class.dart';
import 'package:untitled1/data/book_list.dart';
import 'package:untitled1/goggle_fornts.dart';
import 'package:untitled1/model/book.dart';
class BookDetails extends StatefulWidget {
  BookList bookList;
  BookDetails({super.key,required this.bookList});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9d0208),
        title: Text("About Novels",style: myStyle(30,Colors.white),),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,size: 30
        ),
      ),
      body: Consumer<ManageState>(
        builder: (context,ms,_){
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("${widget.bookList.image}"),
                    ),
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBar.builder(
                            itemSize: 25,
                            initialRating: widget.bookList.rating, // Initialize with the book's rating
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              // Update the rating for the specific book
                              setState(() {
                                widget.bookList.rating = rating;
                              });
                            },
                          ),
                          Text(
                            widget.bookList.rating.toStringAsFixed(1),
                            style: myStyle(25),
                          ),
                        ],
                      ),
                      Text("Name:  ${widget.bookList.bookName}",style: myStyle(30),),
                      Text("Author: ${widget.bookList.authore}",style: myStyle(26),),
                      Text("Published Date: ${widget.bookList.publishDate}",style: myStyle(24),),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "\$ ${widget.bookList.price}",
                            style: myStyle(25),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  bool added = ms.addToBookmark(widget.bookList);
                                  String message = added
                                      ? "Book has been added"
                                      : "Book has been removed";
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 2),
                                      content: Text(message),
                                    ),
                                  );
                                },
                                icon: widget.bookList.Bookmarked ?Icon(
                                  Icons.bookmark_outline,
                                  size: 30, color: Colors.red,
                                ): Icon(
                                  Icons.bookmark_outline,
                                  size: 30, color: Colors.grey,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  bool added = ms.addToCard(widget.bookList);
                                  String message = added
                                      ? "Book has been added"
                                      : "Book has been removed";
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 2),
                                      content: Text(message),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 30, color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     IconButton(
                          //       onPressed: () {
                          //         bool added = ms.addToBookmark(widget.bookList);
                          //         String message = added
                          //             ? "Book has been added"
                          //             : "Book is already added";
                          //         ScaffoldMessenger.of(context).showSnackBar(
                          //           SnackBar(
                          //             duration: Duration(seconds: 2),
                          //             content: Text(message),
                          //           ),
                          //         );
                          //       },
                          //       icon: Icon(
                          //         Icons.bookmark_outline,
                          //         size: 30, color: Colors.red,
                          //       ),
                          //     ),
                          //     IconButton(
                          //       onPressed: () {
                          //         bool added = ms.addToCard(widget.bookList);
                          //         String message = added
                          //             ? "Book has been added"
                          //             : "Book  added";
                          //         ScaffoldMessenger.of(context).showSnackBar(
                          //           SnackBar(
                          //             duration: Duration(seconds: 2),
                          //             content: Text(message),
                          //           ),
                          //         );
                          //       },
                          //       icon: Icon(
                          //         Icons.book,
                          //         size: 30, color: Colors.black,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

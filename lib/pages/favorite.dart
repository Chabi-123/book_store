import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/goggle_fornts.dart';
import 'package:untitled1/class/class.dart';

class Favorite extends StatelessWidget {
  const Favorite ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff9d0208),
          title: Text(
            "Favorites",
            style: myStyle( 30,Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Colors.white,size: 27
          ),
        ),
        body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ms.cardBook.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.32,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(19),bottomLeft: Radius.circular(19)),
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "${ms.cardBook[index].image}"),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.32,
                                  width: MediaQuery.of(context).size.width * 0.57,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${ms.cardBook[index].bookName}",
                                          style: myStyle(
                                              25, Colors.black,FontWeight.bold),
                                        ),
                                        Text(
                                          "${ms.cardBook[index].authore}",
                                          style: myStyle(
                                              25, Colors.black,FontWeight.bold),
                                        ),
                                        Text("Published: ",style: myStyle(25,Colors.blue),),
                                        Text("${ms.cardBook[index].publishDate}", style: myStyle(22, Colors.black,FontWeight.bold),maxLines: 3,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$ ${ms.cardBook[index].price}",
                                              style: myStyle(
                                                  25, Colors.black,FontWeight.bold),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text("Confirm Deletion",style: myStyle(20)),
                                                      content: Text("Are you sure you want to remove this item from your cart?",style: style(18),),
                                                      actions: [
                                                        TextButton(
                                                          child: Text("Cancel",style: style(14),),
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                        ),
                                                        SizedBox(width: 90,),
                                                        TextButton(
                                                          child: Text("Delete",style: style(14),),
                                                          onPressed: () {
                                                            ms.deleteBook(ms.cardBook[index]);
                                                            Navigator.of(context).pop();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                // if (confirm) {
                                                //   ms.deleteBook(ms.cardProducts[index]);
                                                // }
                                              },
                                              icon: Icon(
                                                Icons.delete_outline_outlined,
                                                size: 30,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
// class _HomePageState extends State<HomePage> {
//   bool isBookmarkVisible = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ManageState>(
//       builder: (context, ms, _) {
//         return Scaffold(
//           drawer: Drawer(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       // Drawer items...
//                     ],
//                   ),
//                 ),
//                 MaterialButton(
//                   onPressed: () {
//                     // Logout dialog...
//                   },
//                   child: ListTile(
//                     leading: Icon(
//                       Icons.logout,
//                       size: 35,
//                       color: Colors.red,
//                     ),
//                     title: Text(
//                       "Log Out",
//                       style: style(20),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           appBar: AppBar(
//             backgroundColor: Color(0xff9d0208),
//             iconTheme: IconThemeData(color: Colors.white, size: 30),
//             actions: [
//               Icon(Icons.search, size: 30, color: Colors.white),
//               SizedBox(width: 10),
//               InkWell(
//                 onTap: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (builder) => Favorite()));
//                 },
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     Icon(
//                       Icons.bookmark_outline,
//                       size: 30,
//                       color: Colors.white,
//                     ),
//                     if (isBookmarkVisible)
//                       Positioned(
//                         right: -10,
//                         top: -10,
//                         child: Container(
//                           height: 25,
//                           width: 25,
//                           decoration: BoxDecoration(
//                             color: Colors.blue,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Center(
//                             child: Text(
//                               "${ms.bookmarkCounter}",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//               SizedBox(width: 10),
//               InkWell(
//                 onTap: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (builder) => CartPage()));
//                 },
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     Icon(
//                       Icons.shopping_cart_outlined,
//                       size: 30,
//                       color: Colors.white,
//                     ),
//                     Positioned(
//                       right: -10,
//                       top: -10,
//                       child: Container(
//                         height: 25,
//                         width: 25,
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Center(
//                           child: Text(
//                             "${ms.counter}",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Gap(10),
//             ],
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Top Rated Novels",
//                   style: myStyle(29, Colors.black, FontWeight.bold),
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       childAspectRatio: 0.55,
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                     ),
//                     itemCount: store.length,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (builder) => BookDetails(
//                                   bookList: store[index],
//                                 )));
//                           },
//                           child: Container(
//                             height: 200,
//                             width: double.infinity,
//                             child: Column(
//                               children: [
//                                 Container(
//                                   height: 171,
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     image: DecorationImage(
//                                       image: AssetImage("${store[index].image}"),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 Gap(10),
//                                 Container(
//                                   padding: EdgeInsets.all(15),
//                                   height: 140,
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       Text(
//                                         "${store[index].bookName}",
//                                         style: myStyle(20),
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "\$ ${store[index].price}",
//                                             style: myStyle(25),
//                                           ),
//                                           Row(
//                                             children: [
//                                               IconButton(
//                                                 onPressed: () {
//                                                   setState(() {
//                                                     bool added =
//                                                     ms.addToBookmark(
//                                                         store[index]);
//                                                     String message = added
//                                                         ? "Book has been added"
//                                                         : "Book has been removed";
//                                                     ScaffoldMessenger.of(
//                                                         context)
//                                                         .showSnackBar(
//                                                       SnackBar(
//                                                         duration: Duration(
//                                                             seconds: 2),
//                                                         content: Text(message),
//                                                       ),
//                                                     );
//                                                     // Toggle visibility
//                                                     isBookmarkVisible =
//                                                         added;
//                                                   });
//                                                 },
//                                                 icon: store[index]
//                                                     .Bookmarked
//                                                     ? Icon(
//                                                   Icons
//                                                       .bookmark_outline,
//                                                   size: 30,
//                                                   color: Colors.red,
//                                                 )
//                                                     : Icon(
//                                                   Icons
//                                                       .bookmark_outline,
//                                                   size: 30,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                               IconButton(
//                                                 onPressed: () {
//                                                   bool added =
//                                                   ms.addToCard(
//                                                       store[index]);
//                                                   String message = added
//                                                       ? "Book has been added"
//                                                       : "Book has been removed";
//                                                   ScaffoldMessenger.of(context)
//                                                       .showSnackBar(
//                                                     SnackBar(
//                                                       duration: Duration(
//                                                           seconds: 2),
//                                                       content: Text(message),
//                                                     ),
//                                                   );
//                                                 },
//                                                 icon: Icon(
//                                                   Icons
//                                                       .shopping_cart_outlined,
//                                                   size: 30,
//                                                   color: Colors.black,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/class/class.dart';
import 'package:untitled1/goggle_fornts.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9d0208),
        title: Text(
          "Purchase",
          style: myStyle(29, Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 27),
      ),
      body: Consumer<ManageState>(
        builder: (context, ms, _) {
          if (ms.cardProducts.isEmpty) {
            return Center(
              child: Text(
                "No products in cart",
                style: myStyle(25),
              ),
            );
          }

          return ms.cardProducts.length == 1
              ? ListView.builder(
            itemCount: ms.cardProducts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Center(
                        child: Image.asset(
                            "${ms.cardProducts[index].image}")),
                    Lottie.asset("assets/animation/complete.json"),
                    Text(
                      "You have Purchased",
                      style: myStyle(25),
                    ),
                  ],
                ),
              );
            },
          )
              : GridView.builder(
            padding: const EdgeInsets.all(30),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: ms.cardProducts.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: 100,
                    height: 200,
                    child: Image.asset("${ms.cardProducts[index].image}",fit: BoxFit.cover,),
                  ),
                  Lottie.asset("assets/animation/complete.json"),
                  Text(
                    "Purchased",
                    style: myStyle(20),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

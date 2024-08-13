import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/class/class.dart';
import 'package:untitled1/pages/BottonNa.dart';
import 'package:untitled1/pages/Sign%20In.dart';
import 'package:untitled1/pages/forget%20password.dart';
import 'package:untitled1/pages/home.dart';
import 'package:untitled1/pages/profile.dart';
import 'package:untitled1/pages/splish_screen.dart';
import 'package:untitled1/parctice.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ManageState())
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:PracticeBottomNavBar(),
    );
  }
}


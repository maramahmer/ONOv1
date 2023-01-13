import 'package:flutter/material.dart';
import 'package:ono/constants.dart';
import 'package:ono/screens/home/homeScreen.dart';
import 'package:ono/screens/home/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ONO',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: "Lolita",
        scaffoldBackgroundColor: bgColor,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

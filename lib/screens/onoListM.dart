import 'package:flutter/material.dart';
import 'package:ono/constants.dart';
import 'package:ono/screens/home/homeScreen.dart';
import '../../model/emotionButton.dart';
import 'dart:typed_data';
import 'dart:convert';

class onoListM extends StatefulWidget {
  const onoListM(
      {Key? key, required this.mainEmotion, required this.emotionButton})
      : super(key: key);
  // ADJUST THIS
  final EmotionButton emotionButton;
  final String mainEmotion;

  @override
  State<onoListM> createState() => _onoListM();
}

class _onoListM extends State<onoListM> {
  int quantity = 1;

  get button => widget.mainEmotion;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  // pop everything and return to home
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (Route<dynamic> route) => false);
                },
                child: const Icon(
                  Icons.home,
                  size: 30,
                ),
              )),
        ],
        backgroundColor: bgColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: mainPink,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(),
          //Text(button),
          Text(widget.emotionButton.name),
          // put the onomatopoeia list here
          //createList()
        ],
      ),
    );
  }

  //Widget createList(){}
}

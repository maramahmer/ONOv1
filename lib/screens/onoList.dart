import 'package:flutter/material.dart';
import 'package:ono/constants.dart';
import 'package:ono/screens/home/homeScreen.dart';
import '../../model/emotionButton.dart';
import 'dart:typed_data';
import 'dart:convert';

class onoList extends StatefulWidget {
  const onoList(
      {Key? key,
      required this.indexOno,
      required this.mainEmotion,
      required this.emotionButton})
      : super(key: key);
  // ADJUST THIS
  final EmotionButton emotionButton;
  final int indexOno;
  final String mainEmotion;

  @override
  State<onoList> createState() => _onoList();
}

class _onoList extends State<onoList> {
  int quantity = 1;

  get indexNum => widget.indexOno;
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
          SizedBox(
            height: 15,
          ),
          //Text(button),
          Text(
            "   ${widget.emotionButton.name} > ${widget.emotionButton.secondEmotionList[indexNum]}",
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500, color: desaturatedBlue),
          ),

          // put the onomatopoeia list here
          //createList()
        ],
      ),
    );
  }
/*   
  Widget createList(){
    
  } */

}

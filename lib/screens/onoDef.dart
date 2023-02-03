import 'package:flutter/material.dart';
import 'package:ono/constants.dart';
import 'package:ono/model/listModel.dart';
import 'package:ono/screens/home/homeScreen.dart';
import '../../model/emotionButton.dart';
import 'package:ono/model/dummyData.dart';

class onoDef extends StatefulWidget{
  onoDef({Key? key, required this.model}) : super(key: key);
  final listModel model;

  @override
  _onoDefState createState() => _onoDefState();
}

class _onoDefState extends State<onoDef>{
  late listModel model;
  @override
  void initState(){
    model = widget.model;
    super.initState();
  }

  Widget build(BuildContext context){
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
      body: 
      Text(model.onomatopoeia),
    );
  }
}
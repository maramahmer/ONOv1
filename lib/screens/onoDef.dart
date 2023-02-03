import 'package:flutter/material.dart';
import 'package:ono/constants.dart';
import 'package:ono/model/listModel.dart';
import 'package:ono/screens/home/homeScreen.dart';
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

      body: ListView(
        children: [
          const SizedBox(
            height: 0,
          ),
          onoTop(), // the top part with circular letter, TODO adding onomatopoeia and translit
          meaning(),
          onoBottomEn(),
          onoBottomJp(),
          frequencyButton(),
        ],
      ),
    );
  }

  Widget onoTop(){
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(CircleBorder()),
              padding: MaterialStateProperty.all(EdgeInsets.all(35)),
              backgroundColor:
              MaterialStateProperty.all(mainBlue), // <-- Button color
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed))
                  return mainPink; // <-- Splash color
              }),
            ),
            onPressed: () { },
            child: Text(
              model.letter,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(model.onomatopoeia,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(model.transliteration,
                    style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 20
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }

  Widget meaning(){
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Meaning:",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 35,
              //fontFamily: , // try to change font for the whole thing later
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget onoBottomEn(){
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children : <Widget>[
            ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(CircleBorder()),
              padding: MaterialStateProperty.all(EdgeInsets.all(20)),
              backgroundColor:
              MaterialStateProperty.all(mainPink), // <-- Button color
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed))
                  return mainBlue; // <-- Splash color
              }),
            ),
            onPressed: () { },
            child: const Text(
              "E",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
            Flexible(
                //padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 10.0, top: 5),
                      child: Text(model.meaningen,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                      ),
                    ),
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }

  Widget onoBottomJp(){
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children : <Widget>[
            ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(CircleBorder()),
              padding: MaterialStateProperty.all(EdgeInsets.all(20)),
              backgroundColor:
              MaterialStateProperty.all(mainPink), // <-- Button color
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed))
                  return mainBlue; // <-- Splash color
              }),
            ),
            onPressed: () { },
            child: const Text(
              "J",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
            Flexible(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 10.0, top: 5),
                      child: Text(model.meaningjp,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                    ),
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }

  frequencyButton(){
    return Padding(
        padding: const EdgeInsets.only(top: 30, left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children : <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0))),
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                backgroundColor:
                MaterialStateProperty.all(mainBlue), // <-- Button color
                overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return mainPink; // <-- Splash color
                }),
              ),
              onPressed: () {
                showDialog(

                    context: context,
                    builder: (context) => AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  contentPadding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 20),
                  title: const Text('Tip\n 。。。。。',
                    style: TextStyle(fontSize: 21, color: mainBlue, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),

                  content: const Text('Onomatopoeia can be labeled as Common, Infrequent, and Antiquated.\nInfrequent and antiquated onomatopoeia are unlikely to be used in conversation, but you may come across them in a written format!',
                    style: TextStyle(fontSize: 19, wordSpacing: 1),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    Center(
                      child: Column(
                        children:[
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
                                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                                  backgroundColor:
                                  MaterialStateProperty.all(mainPink),
                                  alignment: Alignment.center
                              ),
                              child: const Text('ok', style: TextStyle(fontSize: 17))),
                        ],
                      ),
                    ),
                  ],
                ),
                );
              },
              child: Text(
                model.frequency,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        )
    );
  }
}
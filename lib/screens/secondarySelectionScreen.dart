import 'package:flutter/material.dart';
import 'package:ono/constants.dart';
import '../../model/emotionButton.dart';

class SecondarySelectionScreen extends StatefulWidget {
  const SecondarySelectionScreen({Key? key, required this.emotionButton})
      : super(key: key);
  final EmotionButton emotionButton;

  @override
  State<SecondarySelectionScreen> createState() =>
      _SecondarySelectionScreenState();
}
  class _SecondarySelectionScreenState extends State<SecondarySelectionScreen>{
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: mainPink,
        ),
        // not putting anything to navigate with in the top bar of main screen yet
        // for future development, a search button can be implemented to search all
      ),
      body: ListView(
        children: [
          const SizedBox(height: 0,),
          header(), // can you narrow that down
          const SizedBox(height: 0,),
          listEmotions(), // secondary emotion buttons (list format)
        ],
      ),
    );
  }
  Widget header() {
    // widget implementation for appbar message "can you narrow that down?"
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Text(
            "can you narrow that down?",
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .headlineSmall!
                .copyWith(
                fontWeight: FontWeight.w400,
                color: mainPink),
          ),
          Text(
            widget.emotionButton.name,
            style: Theme
                .of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w400,
                color: mainBlue),
          )
        ],
      ),
    );
  }

/*  Widget listEmotions(){
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: widget.emotionButton.length,
        itemBuilder: (context, index){
          return ButtonTheme(
            minWidth: 15.0,
            height: 30.0,
            child: MaterialButton(
              color: mainBlue,
              colorBrightness: Brightness.dark,
              onPressed: () =>(){},
              shape: RoundedRectangleBorder(borderRadius:
              BorderRadius.circular(10.0)),
              child:  Text(widget.emotionButton.secondEmotionList[index]),
            ),
          );
        },
      ),
    );
  }*/

  Widget listEmotions(){
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: widget.emotionButton.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Center(
              child:  Text(widget.emotionButton.secondEmotionList[index]),
            ),
          );
        },
      ),
    );
  }
}
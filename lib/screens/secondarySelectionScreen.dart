import 'package:flutter/material.dart';
import 'package:ono/constants.dart';
import 'package:ono/screens/home/homeScreen.dart';
import '../../model/emotionButton.dart';
import 'onoList.dart';
import 'onoListM.dart';

class SecondarySelectionScreen extends StatefulWidget {
  const SecondarySelectionScreen({Key? key, required this.emotionButton})
      : super(key: key);
  final EmotionButton emotionButton;

  @override
  State<SecondarySelectionScreen> createState() =>
      _SecondarySelectionScreenState();
}

class _SecondarySelectionScreenState extends State<SecondarySelectionScreen> {
  int quantity = 1;

  @override
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
        // not putting anything to navigate with in the top bar of main screen yet
        // for future development, a search button can be implemented to search all
      ),
      body: ListView(
        children: [
          const SizedBox(),

          header(), // can you narrow that down

          SizedBox(
            height: 500,
            child: //listEmotions(),
                gridEmotionsSec(),
          ),

          showAll(), // show all ono in the broad category
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
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w400, color: mainPink),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.emotionButton.name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w400, color: mainBlue),
              )),
        ],
      ),
    );
  }

  Widget listEmotions() {
    return SizedBox(
      height: 1000,
      width: 10,
      child: ListView.separated(
        itemCount: widget.emotionButton.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.all(defaultBorderRadius),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return ButtonTheme(
            minWidth: 15.0,
            height: 40.0,
            child: MaterialButton(
              color: mainBlue,
              padding: const EdgeInsets.all(7),
              minWidth: 15,
              colorBrightness: Brightness.dark,
              onPressed: () => () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Text(
                widget.emotionButton.secondEmotionList[index],
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w300, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget showAll() {
    // widget implementation for appbar message "can you narrow that down?"
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return onoListM(
                  emotionButton: widget.emotionButton,
                  mainEmotion: widget.emotionButton.name,
                );
              }));
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(CircleBorder()),
              padding: MaterialStateProperty.all(EdgeInsets.all(45)),
              backgroundColor:
                  MaterialStateProperty.all(mainBlue), // <-- Button color
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed))
                  return mainPink; // <-- Splash color
              }),
            ),
            child: Text(
              "show all",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.white),
            ),
          ),
/*           Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                widget.emotionButton.name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w400, color: mainPink),
              )), */
        ],
      ),
    );
  }

  Widget gridEmotionsSec() {
    return GridView.builder(
      itemCount: widget.emotionButton.secondEmotionList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        mainAxisExtent: 60,
      ),
      itemBuilder: (context, index) {
        EmotionButton emotionButton = emoButton[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return onoList(
                emotionButton: widget.emotionButton,
                indexOno: index,
                mainEmotion: widget.emotionButton.name,
              );
            }));
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: mainBlue,
              borderRadius: BorderRadius.circular(85),
            ),
            child: Stack(
              children: [
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const SizedBox(height: 0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        widget.emotionButton.secondEmotionList[index],
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

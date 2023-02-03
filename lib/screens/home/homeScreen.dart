import 'package:flutter/material.dart';
import 'package:ono/constants.dart';
import '../../model/emotionButton.dart';
import '../secondarySelectionScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: mainPink,
            ),
            onPressed: () {
              showDialog(

                context: context,
                builder: (context) => AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  contentPadding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 20),
                  title: const Text('How to use ONO\n 。。。。。',
                    style: TextStyle(fontSize: 21, color: mainBlue, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),

                  content: const Text('Specify your desired emotion by choosing one of the available general emotions, then narrow it down to a more specific emotion. \nTo view all onomatopoeia in a broad emotional category, choose the broad category and press "show all".',
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
            }),
        toolbarHeight: 35,
        backgroundColor: bgColor,
        elevation: 0,
        // not putting anything to navigate with in the top bar of main screen yet
        // for future development, a search button can be implemented to search all
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 0,
          ),
          header(), // how are you feeling
          gridEmotions(), // emotion buttons
        ],
      ),
    );
  }

  Widget header() {
    // widget implementation for appbar message "how are you feeling?"
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: const [
          Text(
            "How are you feeling?",
            textAlign: TextAlign.center,
            style: TextStyle(color: mainPink, fontSize: 30),
          ),
        ],
      ),
    );
  }

  Widget gridEmotions() {
    return GridView.builder(
      itemCount: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(3),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 0,
        mainAxisExtent: 165,
      ),
      itemBuilder: (context, index) {
        EmotionButton emotionButton = emoButton[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondarySelectionScreen(emotionButton: emotionButton);
            },
            ),
            );
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              //color: Colors.grey[200],
              color: bgColor,
              // CHANGE TO THIS ONCE REMAINDER OF BUTTON DONE TO MAKE TRANSPARENT
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 9,
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.asset(
                          emotionButton.image,
                          width: 120,
                          height: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        emotionButton.name,
                        style: const TextStyle(
                            color: Colors.black,
                            //fontWeight: FontWeight.bold,
                            fontSize: 18),
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

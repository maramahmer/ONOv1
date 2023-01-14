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
          const SizedBox(
            height: 0,
          ),
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
        children: [
          Text(
            "how are you feeling?",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w400, color: mainPink),
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
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 0,
        mainAxisExtent: 165,
      ),
      itemBuilder: (context, index) {
        EmotionButton emotionButton = emoButton[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondarySelectionScreen(emotionButton: emotionButton);
            }));
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
                      height: 14,
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.asset(
                          emotionButton.image,
                          width: 130,
                          height: 130,
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

class EmotionButton {
  EmotionButton({
    required this.id,
    required this.image,
    required this.name,
    required this.secondEmotionList,
    required this.length,
  });

  String id;
  String image;
  String name;
  var secondEmotionList = [];
  int length;

  factory EmotionButton.fromJson(Map<String, dynamic> json) => EmotionButton(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        secondEmotionList: json["list"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "secondEmotionList": secondEmotionList,
        "length": length,
      };
}

final emoButton = [
  EmotionButton(
      id: '1',
      image: 'assets/images/Happy.png',
      name: 'Happy',
      secondEmotionList: ["elated", "content"],
      length: 2),
  EmotionButton(
      id: '2',
      image: 'assets/images/Angry.png',
      name: 'Angry',
      secondEmotionList: ["enraged", "frustrated"],
      length: 2),
  EmotionButton(
      id: '3',
      image: 'assets/images/Sad.png',
      name: 'Sad',
      secondEmotionList: ["depressed", "really sad"],
      length: 2),
  EmotionButton(
      id: '4',
      image: 'assets/images/Surprised.png',
      name: 'Surprised',
      secondEmotionList: ["shocked", "discombobulated", "startled"],
      length: 3),
  EmotionButton(
      id: '5',
      image: 'assets/images/Fearful.png',
      name: 'Fearful',
      secondEmotionList: ["terrified", "uncomfortable"],
      length: 2),
  EmotionButton(
      id: '6',
      image: 'assets/images/Disgusted.png',
      name: 'Disgusted',
      secondEmotionList: ["uncomfortable", "ew"],
      length: 2),
  EmotionButton(
      id: '7',
      image: 'assets/images/Bad.png',
      name: 'Bad',
      secondEmotionList: ["tired", "exhausted"],
      length: 2),
  EmotionButton(
      id: '8',
      image: 'assets/images/Physical.png',
      name: 'Physical',
      secondEmotionList: ["pain", "pleasure", "dizzy", "discomfort"],
      length: 4)
];

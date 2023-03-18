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
      secondEmotionList: [
        "carefree",
        "cheerful",
        "complacent",
        "confident",
        "content",
        "elated",
        "excited",
        "laughing",
        "loving",
        "moved",
        "optimistic",
        "playful",
        "pleased",
        "relaxed",
        "vulnerable"
      ],
      length: 15),

  EmotionButton(
      id: '2',
      image: 'assets/images/Angry.png',
      name: 'Angry',
      secondEmotionList: [
        "enraged",
        "frustrated",
        "humiliated",
        "critical",
        "aggressive",
        "irritated",
        "cruel",
        "tense"
      ],
      length: 8),

  EmotionButton(
      id: '3',
      image: 'assets/images/Sad.png',
      name: 'Sad',
      secondEmotionList: [
        "crying",
        "depressed",
        "despair",
        "disappointed",
        "down",
        "lonely",
        "vulnerable",
      ],
      length: 7),

  EmotionButton(
      id: '4',
      image: 'assets/images/Surprised.png',
      name: 'Surprised',
      secondEmotionList: ["confused", "dismayed", "shocked", "startled"],
      length: 4),

  EmotionButton(
      id: '5',
      image: 'assets/images/Fearful.png',
      name: 'Fearful',
      secondEmotionList: [
        "anxious",
        "confused",
        "helpless",
        "hesitant",
        "insecure",
        "nervous",
        "restless",
        "shaken",
        "shocked",
        "tense",
        "terrified",
        "threatened",
        "worried"
      ],
      length: 13),
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
      secondEmotionList: [
        "annoyed",
        "awkward",
        "careless",
        "conflicted",
        "confused",
        "depressed",
        "disappointed",
        "disgusted",
        "disorganized",
        "disruptive",
        "dizzy",
        "down",
        "embarassed",
        "frustrated",
        "hurt",
        "indifferent",
        "inflexible",
        "mocking",
        "nervous",
        "overwhelmed",
        "pain",
        "restless",
        "stressed",
        "tired",
        "uncaring",
        "unclear",
        "uncomfortable",
        "unfeeling",
        "unfocused",
        "unmotivated",
        "unstable",
        "upset",
        "vulnerable",
        "worried"
      ],
      length: 34),
  EmotionButton(
      id: '8',
      image: 'assets/images/Physical.png',
      name: 'Physical',
      secondEmotionList: [
        "consiousness",
        "dizzy",
        "exertion",
        "hard",
        "healthy",
        "ill",
        "overwhelmed",
        "pain",
        "pleasure",
        "relaxed",
        "sensation",
        "stressed",
        "strong",
        "tired",
        "unhealthy",
        "unwell",
        "weak"
      ],
      length: 17)
];

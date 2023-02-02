import 'dart:convert';

class listModel {
  int number;
  String letter;
  String onomatopoeia;
  String transliteration;
  String frequency;
  String meaningjp;
  String meaningen;
  String mainemotion;
  String subemotion;

  listModel({
    required this.number,
    required this.letter,
    required this.onomatopoeia,
    required this.transliteration,
    required this.frequency,
    required this.meaningjp,
    required this.meaningen,
    required this.mainemotion,
    required this.subemotion,
    
  });

  listModel copyWith({
    required int number,
    required String letter,
    required String onomatopoeia,
    required String transliteration,
    required String frequency,
    required String meaningjp,
    required String meaningen,
    required String mainemotion,
    required String subemotion,
})=>
      listModel(
          number: number ?? this.number,
          letter: letter ?? this.letter,
          onomatopoeia: onomatopoeia ?? this.onomatopoeia,
          transliteration: transliteration ?? this.transliteration,
          frequency: frequency ?? this.frequency,
          meaningjp: meaningjp ?? this.meaningjp,
          meaningen: meaningen ?? this.meaningen,
          mainemotion: mainemotion ?? this.mainemotion,
          subemotion: subemotion ?? this.subemotion
      );

  factory listModel.fromRawJson(String str) => listModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory listModel.fromJson(Map<String, dynamic> json) => listModel(
    number: json["number"] == null ? null: json["number"],
    letter: json["letter"] == null ? null: json["letter"],
    onomatopoeia: json["onomatopoeia"] == null ? null: json["onomatopoeia"],
    transliteration: json["transliteration"] == null ? null: json["transliteration"],
    frequency: json["frequency"] == null ? null: json["frequency"],
    meaningjp: json["meaningjp"] == null ? null: json["meaningjp"],
    meaningen: json["meaningen"] == null ? null: json["meaningen"],
    mainemotion: json["mainemotion"] == null ? null: json["mainemotion"],
    subemotion: json["subemotion"] == null ? null: json["subemotion"],
  );

  Map<String, dynamic> toJson() => {
    "number": number == null ? null : number,
    "letter": letter == null ? null : letter,
    "onomatopoeia": onomatopoeia == null ? null : onomatopoeia,
    "transliteration": transliteration == null ? null : transliteration,
    "frequency": frequency == null ? null : frequency,
    "meaningjp": meaningjp == null ? null : meaningjp,
    "meaningen": meaningen == null ? null : meaningen,
    "mainemotion": mainemotion == null ? null : mainemotion,
    "subemotion": subemotion == null ? null : subemotion,

  };
}

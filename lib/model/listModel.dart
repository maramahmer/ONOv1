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
          number: number,
          letter: letter,
          onomatopoeia: onomatopoeia,
          transliteration: transliteration,
          frequency: frequency,
          meaningjp: meaningjp,
          meaningen: meaningen,
          mainemotion: mainemotion,
          subemotion: subemotion
      );

  factory listModel.fromRawJson(String str) => listModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory listModel.fromJson(Map<String, Object> json) => listModel(
    number: json["number"] as int,
    letter: json["letter"] as String,
    onomatopoeia: json["onomatopoeia"] as String,
    transliteration: json["transliteration"] as String,
    frequency: json["frequency"] as String,
    meaningjp: json["meaningjp"] as String,
    meaningen: json["meaningen"] as String,
    mainemotion: json["mainemotion"] as String,
    subemotion: json["subemotion"] as String,
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "letter": letter,
    "onomatopoeia": onomatopoeia,
    "transliteration": transliteration,
    "frequency": frequency,
    "meaningjp": meaningjp,
    "meaningen": meaningen,
    "mainemotion": mainemotion,
    "subemotion": subemotion,

  };
}

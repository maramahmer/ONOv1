// To parse this JSON data, do
//
//     final dummyData = dummyDataFromJson(jsonString);

import 'dart:convert';

listModel dummyDataFromJson(String str) => listModel.fromJson(json.decode(str));

String dummyDataToJson(listModel data) => json.encode(data.toJson());

class listModel {
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

  int number;
  String letter;
  String onomatopoeia;
  String transliteration;
  String frequency;
  String meaningjp;
  String meaningen;
  String mainemotion;
  String subemotion;

  factory listModel.fromJson(Map<String, dynamic> json) => listModel(
    number: json["number"],
    letter: json["letter"],
    onomatopoeia: json["onomatopoeia"],
    transliteration: json["transliteration"],
    frequency: json["frequency"],
    meaningjp: json["meaningjp"],
    meaningen: json["meaningen"],
    mainemotion: json["mainemotion"],
    subemotion: json["subemotion"],
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

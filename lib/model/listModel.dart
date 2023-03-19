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

  Map<String, Object> toJson() => {
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

// To parse this JSON data, do
//
//     final popular = popularFromJson(jsonString);

import 'dart:convert';

List<Popular> popularFromJson(String str) =>
    List<Popular>.from(json.decode(str).map((x) => Popular.fromJson(x)));

String popularToJson(List<Popular> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Popular {
  Popular({
    this.id,
    this.videoName,
    this.videoChannel,
    this.date,
    this.imageUrl,
    this.videoUrl,
  });

  int id;
  String videoName;
  String videoChannel;
  String date;
  String imageUrl;
  String videoUrl;

  factory Popular.fromJson(Map<String, dynamic> json) => Popular(
        id: json["id"],
        videoName: json["videoName:"],
        videoChannel: json["videoChannel"],
        date: json["date"],
        imageUrl: json["imageUrl"],
        videoUrl: json["videoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "videoName:": videoName,
        "videoChannel": videoChannel,
        "date": date,
        "imageUrl": imageUrl,
        "videoUrl": videoUrl,
      };
}

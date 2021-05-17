// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

List<Notification> notificationFromJson(String str) => List<Notification>.from(
    json.decode(str).map((x) => Notification.fromJson(x)));

String notificationToJson(List<Notification> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notification {
  Notification({
    this.id,
    this.videoName,
    this.videoChannel,
    this.date,
    this.imageUrl,
    this.videoUrl,
    this.imageSt,
  });

  int id;
  String videoName;
  String videoChannel;
  String date;
  String imageUrl;
  String videoUrl;
  String imageSt;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        videoName: json["videoName:"],
        videoChannel: json["videoChannel"],
        date: json["date"],
        imageUrl: json["imageUrl"],
        videoUrl: json["videoUrl"],
        imageSt: json["imageSt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "videoName:": videoName,
        "videoChannel": videoChannel,
        "date": date,
        "imageUrl": imageUrl,
        "videoUrl": videoUrl,
        "imageSt": imageSt,
      };
}

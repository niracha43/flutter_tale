// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) =>
    List<NotificationModel>.from(
        json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  NotificationModel({
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
  DateTime date;
  String imageUrl;
  String videoUrl;
  String imageSt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"] == null ? null : json["id"],
        videoName: json["videoName"] == null ? null : json["videoName"],
        videoChannel:
            json["videoChannel"] == null ? null : json["videoChannel"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        videoUrl: json["videoUrl"] == null ? null : json["videoUrl"],
        imageSt: json["imageSt"] == null ? null : json["imageSt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "videoName": videoName == null ? null : videoName,
        "videoChannel": videoChannel == null ? null : videoChannel,
        "date": date == null ? null : date.toIso8601String(),
        "imageUrl": imageUrl == null ? null : imageUrl,
        "videoUrl": videoUrl == null ? null : videoUrl,
        "imageSt": imageSt == null ? null : imageSt,
      };
}

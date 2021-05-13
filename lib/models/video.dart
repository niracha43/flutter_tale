// To parse this JSON data, do
//
//     final videoList = videoListFromJson(jsonString);

import 'dart:convert';

List<VideoList> videoListFromJson(String str) => List<VideoList>.from(json.decode(str).map((x) => VideoList.fromJson(x)));

String videoListToJson(List<VideoList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoList {
    VideoList({
        this.id,
        this.videoName,
        this.videoChannel,
        this.date,
        this.imageUrl,
        this.videoUrl,
    });

    int? id;
    String? videoName;
    String? videoChannel;
    DateTime? date;
    String? imageUrl;
    String? videoUrl;

    factory VideoList.fromJson(Map<String, dynamic> json) => VideoList(
        id: json["id"] == null ? null : json["id"],
        videoName: json["videoName"] == null ? null : json["videoName"],
        videoChannel: json["videoChannel"] == null ? null : json["videoChannel"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        videoUrl: json["videoUrl"] == null ? null : json["videoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "videoName": videoName == null ? null : videoName,
        "videoChannel": videoChannel == null ? null : videoChannel,
        "date": date == null ? null : date!.toIso8601String(),
        "imageUrl": imageUrl == null ? null : imageUrl,
        "videoUrl": videoUrl == null ? null : videoUrl,
    };
}

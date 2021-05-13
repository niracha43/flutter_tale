// To parse this JSON data, do
//
//     final allvideo = allvideoFromJson(jsonString);

import 'dart:convert';

List<Allvideo> allvideoFromJson(String str) =>
    List<Allvideo>.from(json.decode(str).map((x) => Allvideo.fromJson(x)));

String allvideoToJson(List<Allvideo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Allvideo {
  Allvideo({
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
  String? date;
  String? imageUrl;
  String? videoUrl;

  factory Allvideo.fromJson(Map<String, dynamic> json) => Allvideo(
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

enum VideoChannel {
  KOOSLOOS_ULIAS_CHANNEL,
  HMONG_BEDTIME_STORIES,
  DAB_HAIS_HMOOB,
  PHMOOB_NOOS_HAIS
}

final videoChannelValues = EnumValues({
  "Dab hais hmoob": VideoChannel.DAB_HAIS_HMOOB,
  "Hmong Bedtime Stories": VideoChannel.HMONG_BEDTIME_STORIES,
  "Koosloos_Ulias Channel": VideoChannel.KOOSLOOS_ULIAS_CHANNEL,
  "PHMOOB NOOS HAIS": VideoChannel.PHMOOB_NOOS_HAIS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

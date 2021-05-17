import 'dart:convert';

List<TellerModel> tellerModelFromJson(String str) => List<TellerModel>.from(
    json.decode(str).map((x) => TellerModel.fromJson(x)));

String tellerModelToJson(List<TellerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TellerModel {
  TellerModel({
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

  factory TellerModel.fromJson(Map<String, dynamic> json) => TellerModel(
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

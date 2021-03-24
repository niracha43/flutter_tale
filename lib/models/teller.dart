// To parse this JSON data, do
//
//     final storyteller = storytellerFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

List<Storyteller> storytellerFromJson(String str) => List<Storyteller>.from(json.decode(str).map((x) => Storyteller.fromJson(x)));

String storytellerToJson(List<Storyteller> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Storyteller  extends Equatable{
    Storyteller({
        this.id,
        this.stName,
        this.stChannel,
        this.imageUrl,
        this.stColor,
    });

    int id;
    String stName;
    String stChannel;
    String imageUrl;
    Color stColor;

    factory Storyteller.fromJson(Map<String, dynamic> json) => Storyteller(
        id: json["id"] == null ? null : json["id"],
        stName: json["stName"] == null ? null : json["stName"],
        stChannel: json["stChannel"] == null ? null : json["stChannel"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        stColor: json["stColor"] == null ? null : json["stColor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "stName": stName == null ? null : stName,
        "stChannel": stChannel == null ? null : stChannel,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "stColor": stColor == null ? null : stColor,
    };

  @override
  List<Object> get props => [];
}

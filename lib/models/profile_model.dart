// To parse this JSON data, do
//
//     final profile = profileFromMap(jsonString);

import 'dart:convert';

List<Profile> profileFromMap(String str) =>
    List<Profile>.from(json.decode(str).map((x) => Profile.fromMap(x)));

String profileToMap(List<Profile> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Profile {
  Profile({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
  });

  int id;
  String firstname;
  String lastname;
  String email;
  String phone;

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
      };
}

// To parse this JSON data, do
//
//     final allStoriesModel = allStoriesModelFromJson(jsonString);

import 'dart:convert';

AllStoriesModel allStoriesModelFromJson(String str) =>
    AllStoriesModel.fromJson(json.decode(str));

String allStoriesModelToJson(AllStoriesModel data) =>
    json.encode(data.toJson());

class AllStoriesModel {
  final bool? error;
  final String? message;
  final List<ListStory>? listStory;

  AllStoriesModel({
    this.error,
    this.message,
    this.listStory,
  });

  factory AllStoriesModel.fromJson(Map<String, dynamic> json) =>
      AllStoriesModel(
        error: json["error"] as bool?,
        message: json["message"] as String?,
        listStory: (json["listStory"] as List<dynamic>?)
            ?.map((x) => ListStory.fromJson(x as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "listStory":
            listStory?.map((x) => x.toJson()).toList() ?? <dynamic>[],
      };
}



class ListStory {
  final String? id;
  final  String? name;
  final String? description;
  final String? photoUrl;
  final DateTime? createdAt;
  final double? lat;
  final double? lon;

  ListStory({
    this.id,
    this.name,
    this.description,
    this.photoUrl,
    this.createdAt,
    this.lat,
    this.lon,
  });

  factory ListStory.fromJson(Map<String, dynamic> json) {
    return ListStory(
      id: json["id"] as String?,
      name: json["name"] as String?,
      description: json["description"] as String?,
      photoUrl: json["photoUrl"] as String?,
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"] as String)
          : null,
      lat: (json["lat"] as num?)?.toDouble(),
      lon: (json["lon"] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "photoUrl": photoUrl,
        "createdAt": createdAt?.toIso8601String(),
        "lat": lat,
        "lon": lon,
      };
}
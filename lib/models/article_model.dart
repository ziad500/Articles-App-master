import 'package:cloud_firestore/cloud_firestore.dart';

class ArticlesModel {
  String? title;
  String? category;
  String? content;
  String? location;
  String? category2;
  List<String>? images;
  List<String>? details;

  Timestamp? time;

  ArticlesModel({
    this.category,
    this.content,
    this.location,
    this.title,
    this.time,
    this.category2,
    this.details,
    this.images,
  });

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    category = json["category"];
    content = json["content"];
    location = json["location"];
    category2 = json["category2"];
    details = json["details"] != null
        ? List.from(json["details"]).map((e) => e.toString()).toList()
        : [];

    images = json["images"] != null
        ? List.from(json["images"]).map((e) => e.toString()).toList()
        : [];
    time = json["time"];
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "category": category,
      "content": content,
      "location": location,
      "time": time,
      "category2": category2,
      "details": details?.map((e) => e.toString()).toList(),
      "images": images?.map((e) => e.toString()).toList()
    };
  }
}

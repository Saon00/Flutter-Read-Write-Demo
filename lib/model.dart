// class NewsDataModel {
//   String title, imageUrl, content, description;
//
//   NewsDataModel({
//     required this.title,
//     required this.imageUrl,
//     required this.content,
//     required this.description,
//   });
// }

// To parse this JSON data, do
//
//     final newsDataModel = newsDataModelFromJson(jsonString);

import 'dart:convert';

NewsDataModel newsDataModelFromJson(String str) => NewsDataModel.fromJson(json.decode(str));

// we commented it because we dont need this now
// String newsDataModelToJson(NewsDataModel data) => json.encode(data.toJson());

class NewsDataModel {
  NewsDataModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    // required this.publishedAt,
    required this.content,
  });

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  // DateTime publishedAt;
  String content;

  factory NewsDataModel.fromJson(Map<String, dynamic> json) => NewsDataModel(
    author: json["author"] ?? 'author not found',
    title: json["title"] ?? 'title not found',
    description: json["description"] ?? 'description not found',
    url: json["url"] ?? 'url not found',
    urlToImage: json["urlToImage"] ?? 'urlToImage not found',
    // publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"] ?? 'content not found',
  );

  // not need now
  // Map<String, dynamic> toJson() => {
  //   "author": author,
  //   "title": title,
  //   "description": description,
  //   "url": url,
  //   "urlToImage": urlToImage,
  //   "publishedAt": publishedAt.toIso8601String(),
  //   "content": content,
  // };
}

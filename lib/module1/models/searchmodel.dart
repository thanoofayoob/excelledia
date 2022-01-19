// To parse this JSON data, do
//
//     final searchmodel = searchmodelFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:meta/meta.dart';
import 'dart:convert';

Searchmodel searchmodelFromJson(String str) =>
    Searchmodel.fromJson(json.decode(str));

String searchmodelToJson(Searchmodel data) => json.encode(data.toJson());

class Searchmodel {
  Searchmodel({
    @required this.total,
    @required this.totalHits,
    @required this.hits,
  });

  final int? total;
  final int? totalHits;
  final List<Hit>? hits;

  factory Searchmodel.fromJson(Map<String, dynamic> json) => Searchmodel(
        total: json["total"] ?? null,
        totalHits: json["totalHits"] ?? null,
        hits: json["hits"] == null
            ? null
            : List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total ?? null,
        "totalHits": totalHits ?? null,
        "hits": hits == null
            ? null
            : List<dynamic>.from(hits!.map((x) => x.toJson())),
      };
}

class Hit {
  Hit({
    @required this.id,
    @required this.pageUrl,
    @required this.type,
    @required this.tags,
    @required this.previewUrl,
    @required this.previewWidth,
    @required this.previewHeight,
    @required this.webformatUrl,
    @required this.webformatWidth,
    @required this.webformatHeight,
    @required this.largeImageUrl,
    @required this.fullHdurl,
    @required this.imageUrl,
    @required this.imageWidth,
    @required this.imageHeight,
    @required this.imageSize,
    @required this.views,
    @required this.downloads,
    @required this.likes,
    @required this.comments,
    @required this.userId,
    @required this.user,
    @required this.userImageUrl,
  });

  final int? id;
  final String? pageUrl;
  final String? type;
  final String? tags;
  final String? previewUrl;
  final int? previewWidth;
  final int? previewHeight;
  final String? webformatUrl;
  final int? webformatWidth;
  final int? webformatHeight;
  final String? largeImageUrl;
  final String? fullHdurl;
  final String? imageUrl;
  final int? imageWidth;
  final int? imageHeight;
  final int? imageSize;
  final int? views;
  final int? downloads;
  final int? likes;
  final int? comments;
  final int? userId;
  final String? user;
  final String? userImageUrl;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        id: json["id"] ?? null,
        pageUrl: json["pageURL"] ?? null,
        type: json["type"] ?? null,
        tags: json["tags"] ?? null,
        previewUrl: json["previewURL"] ?? null,
        previewWidth: json["previewWidth"] ?? null,
        previewHeight: json["previewHeight"] ?? null,
        webformatUrl: json["webformatURL"] ?? null,
        webformatWidth: json["webformatWidth"] ?? null,
        webformatHeight: json["webformatHeight"] ?? null,
        largeImageUrl: json["largeImageURL"] ?? null,
        fullHdurl: json["fullHDURL"] ?? null,
        imageUrl: json["imageURL"] ?? null,
        imageWidth: json["imageWidth"] ?? null,
        imageHeight: json["imageHeight"] ?? null,
        imageSize: json["imageSize"] ?? null,
        views: json["views"] ?? null,
        downloads: json["downloads"] ?? null,
        likes: json["likes"] ?? null,
        comments: json["comments"] ?? null,
        userId: json["user_id"] ?? null,
        user: json["user"] ?? null,
        userImageUrl: json["userImageURL"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "pageURL": pageUrl ?? null,
        "type": type ?? null,
        "tags": tags ?? null,
        "previewURL": previewUrl ?? null,
        "previewWidth": previewWidth ?? null,
        "previewHeight": previewHeight ?? null,
        "webformatURL": webformatUrl ?? null,
        "webformatWidth": webformatWidth ?? null,
        "webformatHeight": webformatHeight ?? null,
        "largeImageURL": largeImageUrl ?? null,
        "fullHDURL": fullHdurl ?? null,
        "imageURL": imageUrl ?? null,
        "imageWidth": imageWidth ?? null,
        "imageHeight": imageHeight ?? null,
        "imageSize": imageSize ?? null,
        "views": views ?? null,
        "downloads": downloads ?? null,
        "likes": likes ?? null,
        "comments": comments ?? null,
        "user_id": userId ?? null,
        "user": user ?? null,
        "userImageURL": userImageUrl ?? null,
      };
}

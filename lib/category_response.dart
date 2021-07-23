// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromMap(jsonString);

import 'dart:convert';

class CategoryResponse {
    CategoryResponse({
        this.message,
        this.data,
    });

    final String? message;
    final List<Datum>? data;

    factory CategoryResponse.fromJson(String str) => CategoryResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CategoryResponse.fromMap(Map<String, dynamic> json) => CategoryResponse(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class Datum {
    Datum({
        this.catId,
        this.catName,
        this.catImage,
        this.corCount,
        this.catColor,
    });

    final int ?catId;
    final String ? catName;
    final String? catImage;
    final int? corCount;
    final String? catColor;

    factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        catId: json["cat_id"],
        catName: json["cat_name"],
        catImage: json["cat_image"],
        corCount: json["cor_count"],
        catColor: json["cat_color"],
    );

    Map<String, dynamic> toMap() => {
        "cat_id": catId,
        "cat_name": catName,
        "cat_image": catImage,
        "cor_count": corCount,
        "cat_color": catColor,
    };
}

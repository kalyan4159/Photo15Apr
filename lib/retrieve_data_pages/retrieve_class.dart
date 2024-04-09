import 'dart:convert';

import 'package:intl/intl.dart';

List<RetriveDataclass> retriveDataclassFromJson(String str) => List<RetriveDataclass>.from(json.decode(str).map((x) => RetriveDataclass.fromJson(x)));


class RetriveDataclass {
    String id;
    String name;
    String imageUrl;
    String description;
    bool isLiked;
    String createdDate;

    RetriveDataclass({
        required this.id,
        required this.name,
        required this.imageUrl,
        required this.description,
        required this.isLiked,
        required this.createdDate,
    });

    factory RetriveDataclass.fromJson(Map<String, dynamic> json) => RetriveDataclass(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageURL"],
        description: json["description"],
        isLiked: json["isLiked"],
        createdDate: json["createdDate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageURL": imageUrl,
        "description": description,
        "isLiked": isLiked,
        "createdDate": createdDate,
    };
}

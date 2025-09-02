

import 'dart:convert';

GetCategrories getCategroriesFromJson(String str) => GetCategrories.fromJson(json.decode(str));

String getCategroriesToJson(GetCategrories data) => json.encode(data.toJson());

class GetCategrories {
  bool success;
  String message;
  List<Datum> data;

  GetCategrories({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetCategrories.fromJson(Map<String, dynamic> json) => GetCategrories(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String name;
  String? description;
  String? image;
  bool isActive;
  List<Datum>? subcategories;
  DateTime createdAt;
  DateTime updatedAt;
  int? serviceCategoryId;

  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.isActive,
    this.subcategories,
    required this.createdAt,
    required this.updatedAt,
    this.serviceCategoryId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    isActive: json["is_active"],
    subcategories: json["subcategories"] == null ? [] : List<Datum>.from(json["subcategories"]!.map((x) => Datum.fromJson(x))),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    serviceCategoryId: json["service_category_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "is_active": isActive,
    "subcategories": subcategories == null ? [] : List<dynamic>.from(subcategories!.map((x) => x.toJson())),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "service_category_id": serviceCategoryId,
  };
}



import 'dart:convert';

GetSubCategrories getSubCategroriesFromJson(String str) => GetSubCategrories.fromJson(json.decode(str));

String getSubCategroriesToJson(GetSubCategrories data) => json.encode(data.toJson());

class GetSubCategrories {
  bool success;
  String message;
  Data data;

  GetSubCategrories({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetSubCategrories.fromJson(Map<String, dynamic> json) => GetSubCategrories(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String name;
  dynamic description;
  String? image;
  bool isActive;
  List<Data>? subcategories;
  DateTime createdAt;
  DateTime updatedAt;
  int? serviceCategoryId;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    isActive: json["is_active"],
    subcategories: json["subcategories"] == null ? [] : List<Data>.from(json["subcategories"]!.map((x) => Data.fromJson(x))),
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

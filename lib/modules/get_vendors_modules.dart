class GetVendor {
  dynamic success;
  dynamic message;
  List<Vendor>? data;

  GetVendor({this.success, this.message, this.data});

  factory GetVendor.fromJson(Map<String, dynamic> json) {
    return GetVendor(
      success: json['success'],
      message: json['message'],
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Vendor.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class Vendor {
  dynamic id;
  dynamic name;
  dynamic description;
  dynamic image;
  dynamic isActive;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Vendor({
    this.id,
    this.name,
    this.description,
    this.image,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}

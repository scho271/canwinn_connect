class VendorResponse {
  bool? success;
  String? message;
  VendorData? data;

  VendorResponse({this.success, this.message, this.data});

  factory VendorResponse.fromJson(Map<String, dynamic> json) {
    return VendorResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? VendorData.fromJson(json['data']) : null,
    );
  }
}

class VendorData {
  ServiceCategory? serviceCategory;
  List<Vendor>? vendors;

  VendorData({this.serviceCategory, this.vendors});

  factory VendorData.fromJson(Map<String, dynamic> json) {
    return VendorData(
      serviceCategory: json['service_category'] != null
          ? ServiceCategory.fromJson(json['service_category'])
          : null,
      vendors: (json['vendors'] as List?)
          ?.map((e) => Vendor.fromJson(e))
          .toList(),
    );
  }
}

class ServiceCategory {
  int? id;
  String? name;
  String? description;

  ServiceCategory({this.id, this.name, this.description});

  factory ServiceCategory.fromJson(Map<String, dynamic> json) {
    return ServiceCategory(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}

class Vendor {
  int? id;
  String? businessName;
  String? businessImage;
  String? address;
  String? contactInfo;
  double? latitude;
  double? longitude;
  bool? isVerified;
  bool? isActive;

  // New field for distance
  String? distance;

  Vendor({
    this.id,
    this.businessName,
    this.businessImage,
    this.address,
    this.contactInfo,
    this.latitude,
    this.longitude,
    this.isVerified,
    this.isActive,
    this.distance,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      businessName: json['business_name'],
      businessImage: json['business_image'],
      address: json['address'],
      contactInfo: json['contact_info'],
      latitude: json['latitude'] != null ? double.tryParse(json['latitude'].toString()) : null,
      longitude: json['longitude'] != null ? double.tryParse(json['longitude'].toString()) : null,
      isVerified: json['is_verified'],
      isActive: json['is_active'],
      distance: null, // initialize as null
    );
  }
}


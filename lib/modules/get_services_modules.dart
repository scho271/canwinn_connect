class ServiceModel {
  final int id;
  final String name;
  final String? description;
  final String? image;
  final int? durationMinutes;
  final String serviceType;
  final String basePrice;
  final String gstPercentage;
  final bool requiresProfessional;
  final bool isActive;
  final Vendor? vendor;
  final SubCategory? subcategory;
  final List<dynamic> variants;
  final String createdAt;
  final String updatedAt;

  ServiceModel({
    required this.id,
    required this.name,
    this.description,
    this.image,
    this.durationMinutes,
    required this.serviceType,
    required this.basePrice,
    required this.gstPercentage,
    required this.requiresProfessional,
    required this.isActive,
    this.vendor,
    this.subcategory,
    required this.variants,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'],
      image: json['image'],
      durationMinutes: json['duration_minutes'],
      serviceType: json['service_type'] ?? '',
      basePrice: json['base_price'] ?? '0.0',
      gstPercentage: json['gst_percentage'] ?? '0.0',
      requiresProfessional: json['requires_professional'] == 1,
      isActive: json['is_active'] == 1,
      vendor: json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null,
      subcategory:
      json['subcategory'] != null ? SubCategory.fromJson(json['subcategory']) : null,
      variants: json['variants'] ?? [],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

class Vendor {
  final int id;
  final String businessName;
  final String? address;
  final String? contactInfo;
  final String latitude;
  final String longitude;

  Vendor({
    required this.id,
    required this.businessName,
    this.address,
    this.contactInfo,
    required this.latitude,
    required this.longitude,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      businessName: json['business_name'] ?? '',
      address: json['address'],
      contactInfo: json['contact_info'],
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
    );
  }
}

class SubCategory {
  final int? id;
  final String? name;

  SubCategory({this.id, this.name});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
    );
  }
}

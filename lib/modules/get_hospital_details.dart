

class VendorModel {
  final int id;
  final String businessName;
  final String? businessImage;
  final String? address;
  final String? contactInfo;
  final String latitude;
  final String longitude;
  final String businessType;
  final int beds;
  final String isPharmacy;
  final bool isVerified;
  final bool isActive;
  final String? discountAvailable;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final VendorType vendorType;
  final ServiceCategory serviceCategory;
  final List<Service> services;
  final List<Professional> professionals;

  VendorModel({
    required this.id,
    required this.businessName,
    this.businessImage,
    this.address,
    this.contactInfo,
    required this.latitude,
    required this.longitude,
    required this.businessType,
    required this.beds,
    required this.isPharmacy,
    required this.isVerified,
    required this.isActive,
    this.discountAvailable,
    this.createdAt,
    this.updatedAt,
    required this.vendorType,
    required this.serviceCategory,
    required this.services,
    required this.professionals,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'] ?? 0,
      businessName: json['business_name'] ?? '',
      businessImage: json['business_image'],
      address: json['address'],
      contactInfo: json['contact_info'],
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
      businessType: json['bussiness_type'] ?? '',
      beds: json['beds'] ?? 0,
      isPharmacy: json['is_pharmacy'] ?? 'no',
      isVerified: json['is_verified'] ?? false,
      isActive: json['is_active'] ?? false,
      discountAvailable: json['discount_available'],
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
      vendorType: VendorType.fromJson(json['vendor_type']),
      serviceCategory: ServiceCategory.fromJson(json['service_category']),
      services: (json['services'] as List)
          .map((e) => Service.fromJson(e))
          .toList(),
      professionals: (json['professionals'] as List)
          .map((e) => Professional.fromJson(e))
          .toList(),
    );
  }
}

class VendorType {
  final int id;
  final String name;
  final String description;

  VendorType({
    required this.id,
    required this.name,
    required this.description,
  });

  factory VendorType.fromJson(Map<String, dynamic> json) {
    return VendorType(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class ServiceCategory {
  final int id;
  final String name;
  final String? description;

  ServiceCategory({
    required this.id,
    required this.name,
    this.description,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) {
    return ServiceCategory(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'],
    );
  }
}

class Service {
  final int id;
  final String name;
  final String? description;
  final String basePrice;
  final String? durationMinutes;
  final String serviceType;
  final String gstPercentage;
  final dynamic subcategory;
  final List<dynamic> variants;

  Service({
    required this.id,
    required this.name,
    this.description,
    required this.basePrice,
    this.durationMinutes,
    required this.serviceType,
    required this.gstPercentage,
    this.subcategory,
    required this.variants,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'],
      basePrice: json['base_price'] ?? '0.0',
      durationMinutes: json['duration_minutes']?.toString(),
      serviceType: json['service_type'] ?? '',
      gstPercentage: json['gst_percentage'] ?? '0',
      subcategory: json['subcategory'],
      variants: json['variants'] ?? [],
    );
  }
}

class Professional {
  final int id;
  final String name;
  final String? specialty;
  final String serviceFee;
  final String? profileImage;
  final String? bio;

  Professional({
    required this.id,
    required this.name,
    this.specialty,
    required this.serviceFee,
    this.profileImage,
    this.bio,
  });

  factory Professional.fromJson(Map<String, dynamic> json) {
    return Professional(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      specialty: json['specialty'],
      serviceFee: json['service_fee'] ?? '0.0',
      profileImage: json['profile_image'],
      bio: json['bio'],
    );
  }
}

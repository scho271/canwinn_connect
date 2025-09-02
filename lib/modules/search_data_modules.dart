class SearchServiceResponse {
  bool success;
  String message;
  List<SearchServiceModel> data;

  SearchServiceResponse({required this.success, required this.message, required this.data});

  factory SearchServiceResponse.fromJson(Map<String, dynamic> json) {
    return SearchServiceResponse(
      success: json['success'],
      message: json['message'],
      data: List<SearchServiceModel>.from(json['data'].map((x) => SearchServiceModel.fromJson(x))),
    );
  }
}

class SearchServiceModel {
  int id;
  String name;
  String? description;
  String? image;
  int? durationMinutes;
  String serviceType;
  String basePrice;
  String gstPercentage;
  int requiresProfessional;
  int isActive;
  SearchVendorModel vendor;
  SearchSubcategoryModel? subcategory;
  List<dynamic> variants;
  String createdAt;
  String updatedAt;

  SearchServiceModel({
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
    required this.vendor,
    this.subcategory,
    required this.variants,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SearchServiceModel.fromJson(Map<String, dynamic> json) {
    return SearchServiceModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      durationMinutes: json['duration_minutes'],
      serviceType: json['service_type'],
      basePrice: json['base_price'],
      gstPercentage: json['gst_percentage'],
      requiresProfessional: json['requires_professional'],
      isActive: json['is_active'],
      vendor: SearchVendorModel.fromJson(json['vendor']),
      subcategory: json['subcategory'] != null ? SearchSubcategoryModel.fromJson(json['subcategory']) : null,
      variants: json['variants'] ?? [],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class SearchVendorModel {
  int id;
  String businessName;
  String? address;
  String? contactInfo;
  String latitude;
  String longitude;

  SearchVendorModel({
    required this.id,
    required this.businessName,
    this.address,
    this.contactInfo,
    required this.latitude,
    required this.longitude,
  });

  factory SearchVendorModel.fromJson(Map<String, dynamic> json) {
    return SearchVendorModel(
      id: json['id'],
      businessName: json['business_name'],
      address: json['address'],
      contactInfo: json['contact_info'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class SearchSubcategoryModel {
  int id;
  String name;

  SearchSubcategoryModel({required this.id, required this.name});

  factory SearchSubcategoryModel.fromJson(Map<String, dynamic> json) {
    return SearchSubcategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

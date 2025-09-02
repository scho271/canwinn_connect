class GetVendorTypeModule {
  final List<Data>? data;

  GetVendorTypeModule({this.data});

  factory GetVendorTypeModule.fromJson(Map<String, dynamic> json) {
    return GetVendorTypeModule(
      data:
          (json['data'] as List?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class Data {
  final int? id;
  final String? businessName;
  final String? address;
  final String? contactInfo;
  final String? latitude;
  final String? longitude;
  final String? bussinessType;
  final int? beds;
  final String? isPharmacy;
  final bool? isVerified;
  final bool? isActive;
  final ServiceCategory? serviceCategory;

  Data({
    this.id,
    this.businessName,
    this.address,
    this.contactInfo,
    this.latitude,
    this.longitude,
    this.bussinessType,
    this.beds,
    this.isPharmacy,
    this.isVerified,
    this.isActive,
    this.serviceCategory,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      businessName: json['business_name'],
      address: json['address'],
      contactInfo: json['contact_info'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      bussinessType: json['bussiness_type'],
      beds: json['beds'],
      isPharmacy: json['is_pharmacy'],
      isVerified: json['is_verified'],
      isActive: json['is_active'],
      serviceCategory:
          json['service_category'] != null
              ? ServiceCategory.fromJson(json['service_category'])
              : null,
    );
  }
}

class ServiceCategory {
  final int? id;
  final String? name;
  final String? description;

  ServiceCategory({this.id, this.name, this.description});

  factory ServiceCategory.fromJson(Map<String, dynamic> json) {
    return ServiceCategory(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}

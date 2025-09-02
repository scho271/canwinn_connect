// class GetSubCategoryModules {
//   final bool success;
//   final String message;
//   final ServiceData data;
//
//   GetSubCategoryModules({
//     required this.success,
//     required this.message,
//     required this.data,
//   });
//
//   factory GetSubCategoryModules.fromJson(Map<String, dynamic> json) {
//     return GetSubCategoryModules(
//       success: json['success'] ?? false,
//       message: json['message'] ?? '',
//       data: ServiceData.fromJson(json['data'] ?? {}),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "success": success,
//       "message": message,
//       "data": data.toJson(),
//     };
//   }
// }
//
// class ServiceData {
//   final SubCategory subcategory;
//   final List<Service> services;
//
//   ServiceData({
//     required this.subcategory,
//     required this.services,
//   });
//
//   factory ServiceData.fromJson(Map<String, dynamic> json) {
//     return ServiceData(
//       subcategory: SubCategory.fromJson(json['subcategory'] ?? {}),
//       services: (json['services'] as List<dynamic>? ?? [])
//           .map((e) => Service.fromJson(e))
//           .toList(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "subcategory": subcategory.toJson(),
//       "services": services.map((e) => e.toJson()).toList(),
//     };
//   }
// }
//
// class SubCategory {
//   final int id;
//   final String name;
//   final String? description;
//
//   SubCategory({
//     required this.id,
//     required this.name,
//     this.description,
//   });
//
//   factory SubCategory.fromJson(Map<String, dynamic> json) {
//     return SubCategory(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       description: json['description'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "name": name,
//       "description": description,
//     };
//   }
// }
//
// class Service {
//   final int id;
//   final String name;
//   final String description;
//   final String image;
//   final String? durationMinutes;
//   final String serviceType;
//   final String basePrice;
//   final int membershipDiscount;
//   final String gstPercentage;
//   final int requiresProfessional;
//   final int isActive;
//   final Vendor vendor;
//   final List<dynamic> variants;
//   final String createdAt;
//   final String updatedAt;
//
//   Service({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.image,
//     this.durationMinutes,
//     required this.serviceType,
//     required this.basePrice,
//     required this.membershipDiscount,
//     required this.gstPercentage,
//     required this.requiresProfessional,
//     required this.isActive,
//     required this.vendor,
//     required this.variants,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Service.fromJson(Map<String, dynamic> json) {
//     return Service(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       description: json['description'] ?? '',
//       image: json['image'] ?? '',
//       durationMinutes: json['duration_minutes']?.toString(),
//       serviceType: json['service_type'] ?? '',
//       basePrice: json['base_price']?.toString() ?? '0',
//       membershipDiscount: json['membership_discount'] ?? 0,
//       gstPercentage: json['gst_percentage']?.toString() ?? '0',
//       requiresProfessional: json['requires_professional'] ?? 0,
//       isActive: json['is_active'] ?? 0,
//       vendor: json['vendor'] != null
//           ? Vendor.fromJson(json['vendor'])
//           : Vendor(id: 0, businessName: '', address: null),
//       variants: json['variants'] ?? [],
//       createdAt: json['created_at'] ?? '',
//       updatedAt: json['updated_at'] ?? '',
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "name": name,
//       "description": description,
//       "image": image,
//       "duration_minutes": durationMinutes,
//       "service_type": serviceType,
//       "base_price": basePrice,
//       "membership_discount": membershipDiscount,
//       "gst_percentage": gstPercentage,
//       "requires_professional": requiresProfessional,
//       "is_active": isActive,
//       "vendor": vendor.toJson(),
//       "variants": variants,
//       "created_at": createdAt,
//       "updated_at": updatedAt,
//     };
//   }
// }
//
// class Vendor {
//   final int id;
//   final String businessName;
//   final String? address;
//
//   Vendor({
//     required this.id,
//     required this.businessName,
//     this.address,
//   });
//
//   factory Vendor.fromJson(Map<String, dynamic> json) {
//     return Vendor(
//       id: json['id'] ?? 0,
//       businessName: json['business_name'] ?? '',
//       address: json['address'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "business_name": businessName,
//       "address": address,
//     };
//   }
// }

class GetSubCategoryModules {
  dynamic success;
  dynamic message;
  dynamic data;

  GetSubCategoryModules({this.success, this.message, this.data});

  factory GetSubCategoryModules.fromJson(Map<String, dynamic> json) {
    return GetSubCategoryModules(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data?.toJson(),
  };
}

class Data {
  dynamic subcategory;
  dynamic services;

  Data({this.subcategory, this.services});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      subcategory: json['subcategory'] != null ? Subcategory.fromJson(json['subcategory']) : null,
      services: json['services'] ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
    'subcategory': subcategory?.toJson(),
    'services': services,
  };
}

class Subcategory {
  dynamic id;
  dynamic name;
  dynamic description;

  Subcategory({this.id, this.name, this.description});

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    id: json['id'],
    name: json['name'],
    description: json['description'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
  };
}

class Service {
  dynamic id;
  dynamic name;
  dynamic description;
  dynamic image;
  dynamic durationMinutes;
  dynamic serviceType;
  dynamic basePrice;
  dynamic membershipDiscount;
  dynamic gstPercentage;
  dynamic requiresProfessional;
  dynamic isActive;
  dynamic vendor;
  dynamic variants;
  dynamic createdAt;
  dynamic updatedAt;

  Service({
    this.id,
    this.name,
    this.description,
    this.image,
    this.durationMinutes,
    this.serviceType,
    this.basePrice,
    this.membershipDiscount,
    this.gstPercentage,
    this.requiresProfessional,
    this.isActive,
    this.vendor,
    this.variants,
    this.createdAt,
    this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    image: json['image'],
    durationMinutes: json['duration_minutes'],
    serviceType: json['service_type'],
    basePrice: json['base_price'],
    membershipDiscount: json['membership_discount'],
    gstPercentage: json['gst_percentage'],
    requiresProfessional: json['requires_professional'],
    isActive: json['is_active'],
    vendor: json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null,
    variants: json['variants'] ?? [],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'image': image,
    'duration_minutes': durationMinutes,
    'service_type': serviceType,
    'base_price': basePrice,
    'membership_discount': membershipDiscount,
    'gst_percentage': gstPercentage,
    'requires_professional': requiresProfessional,
    'is_active': isActive,
    'vendor': vendor?.toJson(),
    'variants': variants,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

class Vendor {
  dynamic id;
  dynamic businessName;
  dynamic address;

  Vendor({this.id, this.businessName, this.address});

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json['id'],
    businessName: json['business_name'],
    address: json['address'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'business_name': businessName,
    'address': address,
  };
}

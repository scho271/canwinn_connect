class FetchServiceList {
  bool? success;
  String? message;
  List<FetchServiceListData>? data;

  FetchServiceList({this.success, this.message, this.data});

  FetchServiceList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FetchServiceListData>[];
      json['data'].forEach((v) {
        data!.add(FetchServiceListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FetchServiceListData {
  int? id;
  String? name;
  String? description;
  String? image;
  Null? durationMinutes;
  String? serviceType;
  String? basePrice;
  String? gstPercentage;
  int? requiresProfessional;
  int? isActive;
  Vendor? vendor;
  Subcategory? subcategory;
  List<Null>? variants;
  String? createdAt;
  String? updatedAt;

  FetchServiceListData(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.durationMinutes,
        this.serviceType,
        this.basePrice,
        this.gstPercentage,
        this.requiresProfessional,
        this.isActive,
        this.vendor,
        this.subcategory,
        this.variants,
        this.createdAt,
        this.updatedAt});

  FetchServiceListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    durationMinutes = json['duration_minutes'];
    serviceType = json['service_type'];
    basePrice = json['base_price'];
    gstPercentage = json['gst_percentage'];
    requiresProfessional = json['requires_professional'];
    isActive = json['is_active'];
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
    subcategory = json['subcategory'] != null
        ? Subcategory.fromJson(json['subcategory'])
        : null;
    if (json['variants'] != null) {
      variants = <Null>[];
      json['variants'].forEach((v) {
        // variants handling logic
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['duration_minutes'] = this.durationMinutes;
    data['service_type'] = this.serviceType;
    data['base_price'] = this.basePrice;
    data['gst_percentage'] = this.gstPercentage;
    data['requires_professional'] = this.requiresProfessional;
    data['is_active'] = this.isActive;
    if (vendor != null) {
      data['vendor'] = vendor!.toJson();
    }
    if (subcategory != null) {
      data['subcategory'] = subcategory!.toJson();
    }
    if (variants != null) {
      // variants serialization logic
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Vendor {
  int? id;
  String? businessName;
  Null address;
  String? contactInfo;
  String? latitude;
  String? longitude;

  Vendor(
      {this.id,
        this.businessName,
        this.address,
        this.contactInfo,
        this.latitude,
        this.longitude});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessName = json['business_name'];
    address = json['address'];
    contactInfo = json['contact_info'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['business_name'] = businessName;
    data['address'] = address;
    data['contact_info'] = contactInfo;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Subcategory {
  int? id;
  String? name;
  Category? category;

  Subcategory({this.id, this.name, this.category});

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category =
    json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

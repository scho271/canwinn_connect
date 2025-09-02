import 'dart:convert';

ServiceDetailModel serviceDetailModelFromJson(String str) =>
    ServiceDetailModel.fromJson(json.decode(str));

String serviceDetailModelToJson(ServiceDetailModel data) =>
    json.encode(data.toJson());

class ServiceDetailModel {
  bool success;
  String message;
  Data data;

  ServiceDetailModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ServiceDetailModel.fromJson(Map<String, dynamic> json) =>
      ServiceDetailModel(
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
  dynamic image;
  dynamic durationMinutes;
  String serviceType;
  String basePrice;
  int membershipDiscount;
  String gstPercentage;
  dynamic note;
  int requiresProfessional;
  List<dynamic> serviceDetails;
  int isActive;
  String professionalAssignmentType;
  Vendor vendor;
  dynamic subcategory;
  List<dynamic> variants;
  List<dynamic> discounts;
  List<dynamic> promotionalOffers;
  DateTime createdAt;
  DateTime updatedAt;
  List<Professional> professionals;

  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.durationMinutes,
    required this.serviceType,
    required this.basePrice,
    required this.membershipDiscount,
    required this.gstPercentage,
    required this.note,
    required this.requiresProfessional,
    required this.serviceDetails,
    required this.isActive,
    required this.professionalAssignmentType,
    required this.vendor,
    required this.subcategory,
    required this.variants,
    required this.discounts,
    required this.promotionalOffers,
    required this.createdAt,
    required this.updatedAt,
    required this.professionals,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    durationMinutes: json["duration_minutes"],
    serviceType: json["service_type"],
    basePrice: json["base_price"],
    membershipDiscount: json["membership_discount"],
    gstPercentage: json["gst_percentage"],
    note: json["note"],
    requiresProfessional: json["requires_professional"],
    serviceDetails:
    List<dynamic>.from(json["service_details"].map((x) => x)),
    isActive: json["is_active"],
    professionalAssignmentType: json["professional_assignment_type"],
    vendor: Vendor.fromJson(json["vendor"]),
    subcategory: json["subcategory"],
    variants: List<dynamic>.from(json["variants"].map((x) => x)),
    discounts: List<dynamic>.from(json["discounts"].map((x) => x)),
    promotionalOffers:
    List<dynamic>.from(json["promotional_offers"].map((x) => x)),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    professionals: List<Professional>.from(
        json["professionals"].map((x) => Professional.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "duration_minutes": durationMinutes,
    "service_type": serviceType,
    "base_price": basePrice,
    "membership_discount": membershipDiscount,
    "gst_percentage": gstPercentage,
    "note": note,
    "requires_professional": requiresProfessional,
    "service_details": List<dynamic>.from(serviceDetails.map((x) => x)),
    "is_active": isActive,
    "professional_assignment_type": professionalAssignmentType,
    "vendor": vendor.toJson(),
    "subcategory": subcategory,
    "variants": List<dynamic>.from(variants.map((x) => x)),
    "discounts": List<dynamic>.from(discounts.map((x) => x)),
    "promotional_offers":
    List<dynamic>.from(promotionalOffers.map((x) => x)),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "professionals":
    List<dynamic>.from(professionals.map((x) => x.toJson())),
  };
}

class Professional {
  int id;
  String name;
  String? specialty;
  String serviceFee;
  String? profileImage;
  dynamic bio;
  List<List<DateAvailability>> availabilities;

  Professional({
    required this.id,
    required this.name,
    required this.specialty,
    required this.serviceFee,
    required this.profileImage,
    required this.bio,
    required this.availabilities,
  });

  factory Professional.fromJson(Map<String, dynamic> json) => Professional(
    id: json["id"],
    name: json["name"],
    specialty: json["specialty"],
    serviceFee: json["service_fee"],
    profileImage: json["profile_image"],
    bio: json["bio"],
    availabilities: List<List<DateAvailability>>.from(
      json["availabilities"].map(
            (list) => List<DateAvailability>.from(
          list.map((x) => DateAvailability.fromJson(x)),
        ),
      ),
    ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "specialty": specialty,
    "service_fee": serviceFee,
    "profile_image": profileImage,
    "bio": bio,
    "availabilities": List<dynamic>.from(
      availabilities.map(
            (list) => List<dynamic>.from(list.map((x) => x.toJson())),
      ),
    ),
  };
}

class DateAvailability {
  String date;
  List<Slot> slots;

  DateAvailability({
    required this.date,
    required this.slots,
  });

  factory DateAvailability.fromJson(Map<String, dynamic> json) =>
      DateAvailability(
        date: json["date"],
        slots: List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "date": date,
    "slots": List<dynamic>.from(slots.map((x) => x.toJson())),
  };
}

class Slot {
  int id;
  DateTime startTime;
  DateTime endTime;
  String status;

  Slot({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
    id: json["id"],
    startTime: DateTime.parse(json["start_time"]),
    endTime: DateTime.parse(json["end_time"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "start_time": startTime.toIso8601String(),
    "end_time": endTime.toIso8601String(),
    "status": status,
  };
}

class Vendor {
  int id;
  String businessName;
  dynamic address;
  dynamic contactInfo;

  Vendor({
    required this.id,
    required this.businessName,
    required this.address,
    required this.contactInfo,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    businessName: json["business_name"],
    address: json["address"],
    contactInfo: json["contact_info"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_name": businessName,
    "address": address,
    "contact_info": contactInfo,
  };
}

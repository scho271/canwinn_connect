class BookingResponse {
  bool success;
  String message;
  BookingData? data;

  BookingResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? BookingData.fromJson(json['data']) : null,
    );
  }
}

class BookingData {
  List<Booking> bookings;

  BookingData({required this.bookings});

  factory BookingData.fromJson(Map<String, dynamic> json) {
    var list = json['bookings'] as List<dynamic>? ?? [];
    List<Booking> bookingsList = list.map((e) => Booking.fromJson(e)).toList();
    return BookingData(bookings: bookingsList);
  }
}

class Booking {
  int id;
  Service service;
  Vendor vendor;
  Professional professional;
  String bookingDate;
  String startTime;
  String endTime;
  String basePrice;
  String totalPrice;
  String membershipDiscount;
  String discountedPrice;
  String gstPercentage;
  String gstAmount;
  String finalPrice;
  String status;
  String paymentStatus;
  String createdAt;
  String updatedAt;

  Booking({
    required this.id,
    required this.service,
    required this.vendor,
    required this.professional,
    required this.bookingDate,
    required this.startTime,
    required this.endTime,
    required this.basePrice,
    required this.totalPrice,
    required this.membershipDiscount,
    required this.discountedPrice,
    required this.gstPercentage,
    required this.gstAmount,
    required this.finalPrice,
    required this.status,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      service: Service.fromJson(json['service']),
      vendor: Vendor.fromJson(json['vendor']),
      professional: Professional.fromJson(json['professional']),
      bookingDate: json['booking_date'] ?? '',
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
      basePrice: json['base_price'] ?? '',
      totalPrice: json['total_price'] ?? '',
      membershipDiscount: json['membership_discount'] ?? '',
      discountedPrice: json['discounted_price'] ?? '',
      gstPercentage: json['gst_percentage'] ?? '',
      gstAmount: json['gst_amount'] ?? '',
      finalPrice: json['final_price'] ?? '',
      status: json['status'] ?? '',
      paymentStatus: json['payment_status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

class Service {
  int id;
  String name;

  Service({required this.id, required this.name});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }
}

class Vendor {
  int id;
  String businessName;

  Vendor({required this.id, required this.businessName});

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      businessName: json['business_name'] ?? '',
    );
  }
}

class Professional {
  int id;
  String name;

  Professional({required this.id, required this.name});

  factory Professional.fromJson(Map<String, dynamic> json) {
    return Professional(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }
}

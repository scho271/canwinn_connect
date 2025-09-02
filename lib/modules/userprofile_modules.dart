class ProfileResponse {
  final dynamic success;
  final dynamic message;
  final UserProfile data;

  ProfileResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      success: json['success'],
      message: json['message'],
      data: UserProfile.fromJson(json['data']),
    );
  }
}

class UserProfile {
  final dynamic id;
  final dynamic name;
  final dynamic email;
  final dynamic phoneNumber;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic profileImage;
  final dynamic addressId;
  final dynamic membershipTierId;
  final dynamic membershipId;
  final dynamic membershipValidity;
  final dynamic isActive;
  final dynamic dateOfBirth;
  final dynamic gender;
  final dynamic bloodGroup;
  final dynamic createdAt;
  final dynamic updatedAt;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    this.profileImage,
    this.addressId,
    required this.membershipTierId,
    required this.membershipId,
    required this.membershipValidity,
    required this.isActive,
    required this.dateOfBirth,
    required this.gender,
    required this.bloodGroup,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      profileImage: json['profile_image'],
      addressId: json['address_id'],
      membershipTierId: json['membership_tier_id'],
      membershipId: json['membership_id'],
      membershipValidity: json['membership_validity'],
      isActive: json['is_active'],
      dateOfBirth: json['date_of_birth'],
      gender: json['gender'],
      bloodGroup: json['blood_group'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

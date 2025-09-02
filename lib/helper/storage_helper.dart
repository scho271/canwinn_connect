import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static SharedPreferences? _preferences;

  static Future<void> initialize() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<void> clear() async => await _preferences?.clear();
  static const String _token = "token";
  static const String _userId = "user_id";
  static const String _userName = "user_name";
  static const String _userPhone = "user_phone";
  static const String _userEmail = "user_email";
  static const String _userEmailVerifiedAt = "user_email_verified_at";
  static const String _firstName = "first_name";
  static const String _lastName = "last_name";
  static const String _profileImage = "profile_image";
  static const String _dateOfBirth = "date_of_birth";
  static const String _gender = "gender";
  static const String _bloodGroup = "blood_group";
  static const String _addressId = "address_id";
  static const String _membershipTierId = "membership_tier_id";
  static const String _membershipId = "membership_id";
  static const String _membershipValidity = "membership_validity";
  static const String _deviceToken = "device_token";
  static const String _isActive = "is_active";
  static const String _createdAt = "created_at";
  static const String _updatedAt = "updated_at";
  static Future<void> saveUserData(Map<String, dynamic> data) async {
    final user = data['user'];

    await _preferences?.setString(_token, data['token'] ?? '');
    await _preferences?.setInt(_userId, user['id'] ?? 0);
    await _preferences?.setString(_userName, user['name'] ?? '');
    await _preferences?.setString(_userPhone, user['phone_number'] ?? '');
    await _preferences?.setString(_userEmail, user['email'] ?? '');
    await _preferences?.setString(_userEmailVerifiedAt, user['email_verified_at'] ?? '');
    await _preferences?.setString(_firstName, user['first_name'] ?? '');
    await _preferences?.setString(_lastName, user['last_name'] ?? '');
    await _preferences?.setString(_profileImage, user['profile_image'] ?? '');
    await _preferences?.setString(_dateOfBirth, user['date_of_birth'] ?? '');
    await _preferences?.setString(_gender, user['gender'] ?? '');
    await _preferences?.setString(_bloodGroup, user['blood_group'] ?? '');
    await _preferences?.setString(_addressId, user['address_id']?.toString() ?? '');
    await _preferences?.setString(_membershipTierId, user['membership_tier_id']?.toString() ?? '');
    await _preferences?.setString(_membershipId, user['membership_id']?.toString() ?? '');
    await _preferences?.setString(_membershipValidity, user['membership_validity'] ?? '');
    await _preferences?.setString(_deviceToken, user['device_token'] ?? '');
    await _preferences?.setBool(_isActive, user['is_active'] ?? false);
    await _preferences?.setString(_createdAt, user['created_at'] ?? '');
    await _preferences?.setString(_updatedAt, user['updated_at'] ?? '');
  }

  // Getters
  static String? getToken() => _preferences?.getString(_token);
  static int? getUserId() => _preferences?.getInt(_userId);
  static String? getUserName() => _preferences?.getString(_userName);
  static String? getUserPhone() => _preferences?.getString(_userPhone);
  static String? getUserEmail() => _preferences?.getString(_userEmail);
  static String? getUserEmailVerifiedAt() => _preferences?.getString(_userEmailVerifiedAt);
  static String? getFirstName() => _preferences?.getString(_firstName);
  static String? getLastName() => _preferences?.getString(_lastName);
  static String? getProfileImage() => _preferences?.getString(_profileImage);
  static String? getDateOfBirth() => _preferences?.getString(_dateOfBirth);
  static String? getGender() => _preferences?.getString(_gender);
  static String? getBloodGroup() => _preferences?.getString(_bloodGroup);
  static String? getAddressId() => _preferences?.getString(_addressId);
  static String? getMembershipTierId() => _preferences?.getString(_membershipTierId);
  static String? getMembershipId() => _preferences?.getString(_membershipId);
  static String? getMembershipValidity() => _preferences?.getString(_membershipValidity);
  static String? getDeviceToken() => _preferences?.getString(_deviceToken);
  static bool? isUserActive() => _preferences?.getBool(_isActive);
  static String? getCreatedAt() => _preferences?.getString(_createdAt);
  static String? getUpdatedAt() => _preferences?.getString(_updatedAt);
}

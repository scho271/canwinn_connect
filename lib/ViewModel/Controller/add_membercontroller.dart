import 'dart:io';
import 'package:canwinn_project/helper/storage_helper.dart' show StorageHelper;
import 'package:canwinn_project/res/api_url/app_api_url.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';


class AddMemberController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final pinCodeController = TextEditingController();
  final ageController = TextEditingController();
  final aadhaarNumberController = TextEditingController();
  final panCardController = TextEditingController();
  final voterIdController = TextEditingController();
  final fatherNameController = TextEditingController();

  final RxString selectedGender = ''.obs;
  final RxString addedMembershipId = ''.obs;
  final RxString selectedBloodGroup = ''.obs;
  // Rx<GetMemberShipModles?> memberDetails = Rx(null);
  final RxString deviceToken = ''.obs;
  final Rx<File?> pickedImage = Rx<File?>(null);
  Rx<DateTime?> selectedDOB = Rx<DateTime?>(null);

  final dio.Dio dioClient = dio.Dio();

  final RxBool isLoadingAddMember = false.obs;
  final RxBool isLoadingVerify = false.obs;
  final RxBool isLoadingGetDetails = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadMembershipIdFromPrefs();
    // initDeviceToken();
    loadMembershipId();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    bloodGroupController.dispose();
    addressController.dispose();
    cityController.dispose();
    pinCodeController.dispose();
    ageController.dispose();
    aadhaarNumberController.dispose();
    panCardController.dispose();
    voterIdController.dispose();
    super.onClose();
  }
  Future<void> pickImage(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    pickedImage.value = File(pickedFile.path);
                    print("Image path from camera: ${pickedFile.path}");
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    pickedImage.value = File(pickedFile.path);
                    print("Image path from gallery: ${pickedFile.path}");
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  RxString membershipId = ''.obs;
  RxString membershipName =''.obs;
  void loadMembershipId() async {
  }

  Future<void> selectDOB(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      selectedDOB.value = pickedDate;
    }
  }



  Future<void> loadMembershipIdFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedId = prefs.getString('membership_id');
    if (savedId != null && savedId.isNotEmpty) {
      addedMembershipId.value = savedId;
      await getMemberDetails(savedId);
    }
  }

  bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool validatePhone(String phone) {
    final phoneRegex = RegExp(r'^\d{10}$');
    return phoneRegex.hasMatch(phone);
  }

  bool validatePinCode(String pin) {
    final pinRegex = RegExp(r'^\d{6}$');
    return pinRegex.hasMatch(pin);
  }

  Future<void> addMemberData() async {


    isLoadingAddMember.value = true;

    final formData = dio.FormData.fromMap({
      "name": nameController.text,
      "email": emailController.text,
      "mobile": phoneController.text,
      // "bloodgroup":selectedBloodGroup.value,
      "bloodgroup": bloodGroupController.text,
      "address": addressController.text,
      "city": cityController.text,
      "pincode": pinCodeController.text,
      "gender": selectedGender.value,
      "dob": DateFormat('yyyy-MM-dd').format(selectedDOB.value!),
      "device_token": deviceToken.value.isNotEmpty ? deviceToken.value : "",
    });

    if (pickedImage.value != null && pickedImage.value!.existsSync()) {
      final file = pickedImage.value!;
      final mimeType = lookupMimeType(file.path) ?? 'image/jpeg';
      final mediaType = MediaType.parse(mimeType);

      formData.files.add(MapEntry(
        "image",
        await dio.MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: mediaType,
        ),
      ));
    }

    try {
      final response = await dioClient.post(
        AppApiUrl.baseUrl + AppApiUrl.vendorType,
        data: formData,
      );

      print("Add member response: ${response.data}");

      if (response.statusCode == 201) {
        final membershipId = response.data['membership_id'] ?? response.data['data']?['membership_id'];

        if (membershipId == null || membershipId.toString().isEmpty) {
          Get.snackbar("Error", "membership_id is missing in response");
          isLoadingAddMember.value = false;
          return;
        }

        addedMembershipId.value = membershipId.toString();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('membership_id', membershipId.toString());

        Get.snackbar(
          "✅ Success",
          "Member added successfully\nID: $membershipId",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.shade600,
          colorText: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          borderRadius: 12,
          icon: const Icon(Icons.check_circle, color: Colors.white),
          shouldIconPulse: false,
          duration: const Duration(seconds: 3),
          isDismissible: true,
        );
        await getMemberDetails(membershipId.toString());
        // Get.off(() => VerifiyScreens());
      } else {
        Get.snackbar("Failed", response.data['message'] ?? "Submission failed");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoadingAddMember.value = false;
    }
  }

  Future<void> verifyMember() async {
    // String? membershipId = await StorageHelper.getMembershipId();


    var url = "https://taskmaster.electionmaster.in/public/api/auth/member-verify-documnets";

    if (aadhaarNumberController.text.isEmpty &&
        panCardController.text.isEmpty &&
        voterIdController.text.isEmpty) {
      Get.snackbar("Missing Info", "Please provide at least one verification document");
      return;
    }

    isLoadingVerify.value = true;

    final formData = dio.FormData.fromMap({
      // "membership_id": addedMembershipId.value,
      "membership_id":membershipId,
      "adharcardno": aadhaarNumberController.text,
      "pancardno": panCardController.text,
      "votercardno": voterIdController.text,
      "device_token": deviceToken.value.isNotEmpty ? deviceToken.value : "",
    });

    try {
      final response = await dioClient.post(url, data: formData);

      print("Verify Member Response: ${response.data}");

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Verification submitted successfully.");
        panCardController.clear();
        aadhaarNumberController.clear();
        voterIdController.clear();

      } else {
        final message = response.data['message'] ?? "Verification failed";
        Get.snackbar("Failed", message);
      }
    } catch (e) {
      if (e is dio.DioError) {
        final errorMessage = e.response?.data['message'] ?? e.message;
        Get.snackbar("Error", errorMessage);
      } else {
        Get.snackbar("Error", e.toString());
      }
    } finally {
      isLoadingVerify.value = false;
    }
  }

  Future<void> getMemberDetails([String? id]) async {
    final stored = await StorageHelper.getToken();
    final mid = addedMembershipId.value.isNotEmpty
        ? addedMembershipId.value
        : (id ?? stored ?? '');

    if (mid.isEmpty) {
      Get.snackbar("Error", "Membership ID missing.");
      return;
    }

    print('Calling getMemberDetails with ID: $mid');
    isLoadingGetDetails.value = true;

    try {
      final url = AppApiUrl.baseUrl + AppApiUrl.vendorType;
      final res = await dioClient.get(
        url,
        queryParameters: {'membership_id': mid},
      );
      print('⬅️ Status: ${res.statusCode} | Data: ${res.data}');

      if (res.statusCode == 200) {
        // memberDetails.value = GetMemberShipModles.fromJson(res.data);
      } else if (res.statusCode == 404) {

      } else {
        Get.snackbar("Error", "Unexpected status: ${res.statusCode}");
      }
    }catch (e, st) {
      if (e is DioException) {
        print("${ e.response?.statusCode}");
      } else {
        Get.snackbar("Error", e.toString());
      }
      print('Dio Exception: $e');
      print(st);
    } finally {
      isLoadingGetDetails.value = false;
    }
  }


}









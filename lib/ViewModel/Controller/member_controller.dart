import 'dart:io' show File;
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

import 'package:canwinn_project/domain/repositories/membership_repository.dart';


class MemberController extends GetxController{
  MemberShipRepository memberShipRepository = MemberShipRepository();
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
  final Rx<File?> pickedImage = Rx<File?>(null);
  Rx<DateTime?> selectedDOB = Rx<DateTime?>(null);


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


  Future<void> registersMember(BuildContext context) async {
    final memberData = {
      "name": nameController.text.trim(),
      "email": emailController.text.trim(),
      "phone": phoneController.text.trim(),
      "bloodGroup": bloodGroupController.text.trim(),
      "address": addressController.text.trim(),
      "city": cityController.text.trim(),
      "pinCode": pinCodeController.text.trim(),
      "age": ageController.text.trim(),
      "dob": selectedDOB.value?.toIso8601String() ?? '',
      "aadhaarNumber": aadhaarNumberController.text.trim(),
      "panCard": panCardController.text.trim(),
      "voterId": voterIdController.text.trim(),
      "fatherName": fatherNameController.text.trim(),
    };

    final formData = FormData.fromMap(memberData);

    // 📷 Add image if selected
    if (pickedImage.value != null && pickedImage.value!.existsSync()) {
      final imageFile = pickedImage.value!;
      final mimeType = lookupMimeType(imageFile.path) ?? 'image/jpeg';

      formData.files.add(
        MapEntry(
          "image",
          await MultipartFile.fromFile(
            imageFile.path,
            filename: imageFile.path.split('/').last,
            contentType: MediaType.parse(mimeType),
          ),
        ),
      );
    }

    try {
      final response = await memberShipRepository.registerMembers(memberData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Member Registered Successfully"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (ex) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $ex"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
          padding: EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
    }
  }

}
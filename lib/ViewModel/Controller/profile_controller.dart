import 'package:canwinn_project/domain/repositories/profile_repository.dart';
import 'package:canwinn_project/modules/userprofile_modules.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  final ProfileRepository profileRepository = ProfileRepository();
  RxBool isLoading = false.obs;
  RxList<UserProfile> userProfileList = <UserProfile>[].obs;

  Future<void> getUserprofileData(BuildContext context) async {
    isLoading.value = true;
    try {
      final result = await profileRepository.getProfileApi();
      userProfileList.clear();
      userProfileList.add(result);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      isLoading.value = false;
    }
  }
}

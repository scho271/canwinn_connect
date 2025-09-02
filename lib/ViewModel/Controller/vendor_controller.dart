import 'package:canwinn_project/domain/repositories/vendor_repository.dart';
import 'package:canwinn_project/modules/get_hospital_details.dart';
import 'package:canwinn_project/modules/get_vendor_type_module.dart';
import 'package:canwinn_project/modules/get_vendors_modules.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorsController extends GetxController {
  final VendorRepository vendorRepository = VendorRepository();

  RxBool isLoading = false.obs;

  RxList<Vendor> vendorList = <Vendor>[].obs;
  RxList<Data> vendorData = <Data>[].obs;

  Rx<VendorModel?> singleVendor = Rx<VendorModel?>(null);

  Future<void> getVendorData(BuildContext context) async {
    isLoading.value = true;
    try {
      final result = await vendorRepository.getVendorApi();
      vendorList.assignAll(result ?? []);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getVendorTypeData(String vendorType) async {
    isLoading.value = true;
    try {
      final response = await vendorRepository.getVendorType(
        vendorType: vendorType,
      );
      vendorData.assignAll(response ?? []);
    } catch (e) {
      print("❌ Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getVendorById(int id, BuildContext context) async {
    isLoading.value = true;
    try {
      final response = await vendorRepository.getVendorById(id);
      if (response != null) {
        singleVendor.value = response;
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Vendor not found')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      isLoading.value = false;
    }
  }
}

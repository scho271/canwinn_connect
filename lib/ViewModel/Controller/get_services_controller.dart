import 'package:canwinn_project/domain/repositories/services_repository.dart';
import 'package:canwinn_project/helper/storage_helper.dart';
import 'package:canwinn_project/modules/get_services_details_modules.dart';
import 'package:canwinn_project/modules/service_book_modules.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:canwinn_project/data/network/network_api_services.dart';
import 'package:canwinn_project/modules/get_services_modules.dart';
import 'package:canwinn_project/res/api_url/app_api_url.dart';


class GetServicesController extends GetxController {
  final NetworkApiServices _networkApiServices = NetworkApiServices();
  ServiceRepository serviceRepository = Get.put(ServiceRepository());
  var isLoading = false.obs;
  RxList<ServiceModel> serviceList = <ServiceModel>[].obs;
  RxList<Booking> bookingList = <Booking>[].obs;
  Rx<Data?> serviceDetail = Rx<Data?>(null);

  Future<void> fetchServiceList() async {
    try {
      isLoading.value = true;
      final response = await _networkApiServices.getGetApiResponse(
        AppApiUrl.baseUrl + AppApiUrl.getServices,
      );

      if (response['success'] == true && response['data'] != null) {
        List<dynamic> dataList = response['data'];
        serviceList.value = dataList.map((e) => ServiceModel.fromJson(e)).toList();
      } else {
        throw Exception("Invalid response structure");
      }
    } catch (e) {
      print("Error fetching services: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchServiceDetails(int id) async {
    try {
      isLoading.value = true;
      final response = await _networkApiServices.getGetApiResponse(
        "${AppApiUrl.baseUrl}${AppApiUrl.getServicesDetails}/$id",
      );
      print('API URL: ${AppApiUrl.baseUrl}${AppApiUrl.getServicesDetails}/$id');
      if (response['success'] == true && response['data'] != null) {
        final detailModel = ServiceDetailModel(
          success: response['success'],
          message: response['message'],
          data: Data.fromJson(response['data']),
        );

        serviceDetail.value = detailModel.data;
      } else {
        throw Exception("Invalid response format");
      }
    } catch (e) {
      print("❌ Error fetching service details: $e");
    } finally {
      isLoading.value = false;
    }
  }



  Future<void> bookServices(
      {required BuildContext context, required String serviceId,
    required String date,
    required String startTime,
    required String professionalId,
     String? paymentMethod,
    String? notes,
  }) async {
    isLoading.value = true;

    final bookServicesData = {
      "service_id": serviceId,
      "date": date,
      "start_time": startTime,
      "professional_id": professionalId,
      "payment_method": 'credit_card',
      "notes": "",
    };
    try {
      final response = await serviceRepository.bookServices(bookServicesData);
      print("Status code: ${response.statusCode}");
      print("Response: ${response.data}");
      isLoading.value = false;
      if (response.data["success"] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.data["message"] ?? "Booking Successful"),
            backgroundColor: Colors.green,
          ),
        );
        Get.offAllNamed('/bootom');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.data["message"] ?? "Booking Failed"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (ex) {
      isLoading.value = false;
      if (ex is DioException) {
        print("Status Code: ${ex.response?.statusCode}");
        print("Response Data: ${ex.response?.data}");
      }
      final errorMsg = ex.toString().replaceFirst("Exception: ", "");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg), backgroundColor: Colors.red),
      );
    }
  }



  Future<void> fetchBookServiceList() async {
    try {
      isLoading.value = true;

      final userid = StorageHelper.getUserId();
      final token = StorageHelper.getToken();

      // Repository call returns Map<String,dynamic>
      final response = await serviceRepository.getBookServiceHistory(
        userid.toString(),
        token.toString(),
      );

      print("Booking API Response: $response");

      // Directly pass the map to BookingResponse
      final bookingResponse = BookingResponse.fromJson(response);
      bookingList.value = bookingResponse.data?.bookings ?? [];

    } catch (ex) {
      print("❌ Error fetching booking history: $ex");
    } finally {
      isLoading.value = false;
    }
  }

}

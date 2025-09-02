import 'dart:convert';

import 'package:canwinn_project/data/network/network_api_services.dart';
import 'package:canwinn_project/modules/categories_module.dart';
import 'package:canwinn_project/modules/get_subcategories.dart';
import 'package:canwinn_project/modules/get_subcategroy_modules_data.dart';
import 'package:canwinn_project/res/api_url/app_api_url.dart';
import 'package:get/get.dart';

class GetCategorie extends GetxController {
  final NetworkApiServices _networkApiServices = NetworkApiServices();

  Future<GetCategrories?> getCategories() async {
    final String url = AppApiUrl.baseUrl + AppApiUrl.getCategories;
      final response = await _networkApiServices.getGetApiResponse(url);
      if (response != null) {
        final categories = GetCategrories.fromJson(response);
      return categories;
      }
      return null;
    }

  Future<GetSubCategrories?> getSubCategories(int id) async {
  final String url = "${AppApiUrl.baseUrl + AppApiUrl.getSubCategories}/$id";
  final response = await _networkApiServices.getGetApiResponse(url);
  if (response != null) {
    final categories = GetSubCategrories.fromJson(response);
    return categories;
  }
  print("response:---$response");
  return null;
}

  Future<GetSubCategoryModules?> getSubCategoriesById(int id) async {
    final String url = "${AppApiUrl.baseUrl + AppApiUrl.getSubCategoriesById}/$id";
    final response = await _networkApiServices.getGetApiResponse(url);
    if (response != null) {
      final categories = GetSubCategoryModules.fromJson(response);
      return categories;
    }
    print("response:---$response");
    return null;
  }


  }




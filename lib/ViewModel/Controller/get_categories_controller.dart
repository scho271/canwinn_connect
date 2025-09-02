import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/domain/repositories/categories_repository.dart';
import 'package:canwinn_project/modules/categories_module.dart';
import 'package:canwinn_project/modules/get_subcategroy_modules_data.dart'
    hide Data;
import 'package:get/get.dart';
import '../../modules/get_subcategories.dart' show Data, GetSubCategrories;

class CategoriesController extends GetxController {
  final GetCategorie _repository = GetCategorie();


  var categoriesList = <Datum>[].obs;
  var subcategoriesList = <Data>[].obs;
  var subcategoriesListDataById = <Service>[].obs;
  var subcategoryName = "".obs;
  var isLoading = false.obs;

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final result = await _repository.getCategories();
      if (result != null) {
        categoriesList.value = result.data;
      }
    } catch (e) {
      print("Controller Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchSubCategories(int id) async {
    try {
      isLoading.value = true;
      final results = await _repository.getSubCategories(id);
      if (results != null) {
        subcategoriesList.value = results.data.subcategories ?? [];
        print(
            "Subcategories List: ${subcategoriesList.map((e) => e).toList()}");
      }
    } catch (e) {
      print("Controller Error: $e");
      print("Controller Error: $subcategoriesList");
    } finally {
      isLoading.value = false;
    }
  }




  Future<void> getSubCategoriesById(int id) async {
    try {
      isLoading.value = true;

      final response = await _repository.getSubCategoriesById(id);

      if (response != null && response.data != null) {
        subcategoryName.value = response.data.subcategory?.name ?? "";
        if (response.data.services != null) {
          subcategoriesListDataById.value = (response.data.services as List).map((e) => Service.fromJson(e)).toList();
        } else {
          subcategoriesListDataById.clear();
        }
      } else {
        subcategoriesListDataById.clear();
        subcategoryName.value = "";
      }

    } catch (ex) {
      print("Error112: ${ex.toString()}");
      Get.snackbar("Error", ex.toString());
    } finally {
      isLoading.value = false;
    }
  }
}








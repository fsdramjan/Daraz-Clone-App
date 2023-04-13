import 'package:enayas_app/models/category/allCategoryModel.dart';
import 'package:enayas_app/services/Api/apiService.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final allCategory = AllCategoryModel().obs;
  final topCategory = AllCategoryModel().obs;
  final subCategoryList = AllCategoryModel().obs;

  final isLoading = RxBool(false);
  void getAllCategory() async {
    try {
      isLoading.value = true;
      final res = await ApiService.get(endPoint: '/categories');

      if (res!.statusCode == 200) {
        allCategory.value = AllCategoryModel.fromJson(res.data);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  void getFeaturedCategory() async {
    try {
      isLoading.value = true;
      final res = await ApiService.get(endPoint: '/categories/featured');

      if (res!.statusCode == 200) {
        allCategory.value = AllCategoryModel.fromJson(res.data);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  void getTopCategory() async {
    try {
      isLoading.value = true;
      final res = await ApiService.get(endPoint: '/categories/top');

      if (res!.statusCode == 200) {
        topCategory.value = AllCategoryModel.fromJson(res.data);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  void getSubCategory(int? categoryId) async {
    try {
      isLoading.value = true;
      final res = await ApiService.get(endPoint: '/sub-categories/$categoryId');

      if (res!.statusCode == 200) {
        subCategoryList.value = AllCategoryModel.fromJson(res.data);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }
}

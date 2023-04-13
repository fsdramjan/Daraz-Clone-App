import 'package:enayas_app/models/product/productDetailsModel.dart';
import 'package:enayas_app/models/product/productModel.dart';
import 'package:enayas_app/services/Api/apiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final isLoading = RxBool(false);

  final searchProduct = ProductModel().obs;
  final product = ProductModel().obs;
  final subCategoryProduct = ProductModel().obs;
  final productDetails = ProductDetailsModel().obs;

  final searchText = TextEditingController().obs;

  final page = RxInt(1);

  void getAllProduct() async {
    try {
      isLoading.value = true;
      final res = await ApiService.get(
        endPoint: '/products?page=${page.value}',
      );

      if (res!.statusCode == 200) {
        product.value = ProductModel.fromJson(res.data);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  void getSearchProduct() async {
    try {
      isLoading.value = true;
      final res = await ApiService.get(
        endPoint:
            '/products/search?name=${searchText.value.text}&page=${page.value}',
      );

      if (res!.statusCode == 200) {
        searchProduct.value = ProductModel.fromJson(res.data);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  Future getProductDetails(int? productId) async {
    try {
      // isLoading.value = true;
      final res = await ApiService.get(
        endPoint: '/products/$productId',
      );

      if (res!.statusCode == 200) {
        productDetails.value = ProductDetailsModel.fromJson(res.data);
        // isLoading.value = false;
      }
    } catch (e) {
      print(e);
      // isLoading.value = false;
    }
  }

  void getCategoryWiseProduct({
    required int? categoryId,
  }) async {
    try {
      isLoading.value = true;
      final res = await ApiService.get(
        endPoint: '/products/category/$categoryId?page=${page.value}',
      );

      if (res!.statusCode == 200) {
        product.value = ProductModel.fromJson(res.data);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  void getSubCategoryWiseProduct({
    required int? categoryId,
  }) async {
    try {
      isLoading.value = true;
      final res = await ApiService.get(
        endPoint: '/products/sub-category/$categoryId?page=${page.value}',
      );

      if (res!.statusCode == 200) {
        subCategoryProduct.value = ProductModel.fromJson(res.data ?? {});
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }
}

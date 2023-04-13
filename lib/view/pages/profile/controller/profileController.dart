import 'package:enayas_app/services/Api/apiService.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/allController.dart';
import 'package:enayas_app/services/helpers/loadingDialog.dart';
import 'package:enayas_app/services/helpers/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/profileModel.dart';

class ProfileController extends GetxController {
  final isLoading = RxBool(false);

  final profileInfo = ProfileModel().obs;

  final name = TextEditingController().obs;
  final email = TextEditingController().obs;
  final phone = TextEditingController().obs;

  void getProfileInfo() async {
    try {
      isLoading.value = true;
      final res = await ApiService.post(
        url: '/get-user-by-access_token',
        data: {
          'access_token': Apputils.getStorage.read(Apputils.accessToken),
        },
      );
      if (res!.statusCode == 200) {
        profileInfo.value = ProfileModel.fromJson(res.data);
        name.value.text = profileInfo.value.name ?? '';
        email.value.text = profileInfo.value.email ?? '';
        phone.value.text = profileInfo.value.phone ?? '';
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }

  profileUpdate() async {
    try {
      loadingDialog(loadingText: 'Updating...');
      final res = await ApiService.post(
        url: '/profile/update',
        data: {
          "id": AllController.profileC.profileInfo.value.id,
          "name": name.value.text,
          "email": email.value.text,
          "phone": phone.value.text,
        },
      );

      if (res!.data != null) {
        if (res.data['result'] == true) {
          getProfileInfo();
          Get.back();
          Get.back();
          snackBar(message: res.data['message']);
        } else {
          Get.back();

          snackBar(message: res.data['message']);
        }
      }
    } catch (e) {
      print(e);
      Get.back();
    }
  }

  uploadProfilePic(
    String? fileName,
    String? base64String,
  ) async {
    try {
      loadingDialog(loadingText: 'Uploading...');
      final res = await ApiService.post(
        url: '/profile/update-image',
        data: {
          "id": 8,
          "filename": "$fileName",
          "image": "$base64String",
        },
      );

      if (res!.data != null) {
        if (res.data['result'] == true) {
          getProfileInfo();
          Get.back();
          Get.back();
          snackBar(message: res.data['message']);
        } else {
          Get.back();

          snackBar(message: res.data['message']);
        }
      }
    } catch (e) {
      Get.back();

      print(e);
    }
  }
}

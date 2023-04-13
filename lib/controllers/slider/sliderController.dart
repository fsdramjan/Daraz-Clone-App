import 'package:enayas_app/models/slider/mainSliderModel.dart';
import 'package:enayas_app/services/Api/apiService.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  
  final mainSliderList = MainSliderModel().obs;
  var isLoading = RxBool(false);

  void getMainSlider() async {
    try {
      isLoading.value = true;
      var res = await ApiService.get(
        endPoint: '/sliders',
      );
      if (res!.statusCode == 200) {
        mainSliderList.value = MainSliderModel.fromJson(res.data);
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}

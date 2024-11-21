import 'package:get/get.dart';
import 'package:miner/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _loadData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed(Routes.HOME);
  }
}

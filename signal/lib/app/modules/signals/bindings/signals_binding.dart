import 'package:get/get.dart';

import '../controllers/signals_controller.dart';

class SignalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace<SignalsController>(
      () => SignalsController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/pass_key_controller.dart';

class PassKeyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace<PassKeyController>(
      () => PassKeyController(),
    );
  }
}

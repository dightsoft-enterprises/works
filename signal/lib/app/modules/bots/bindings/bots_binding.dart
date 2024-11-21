import 'package:get/get.dart';

import '../controllers/bots_controller.dart';

class BotsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace<BotsController>(
      () => BotsController(),
    );
  }
}

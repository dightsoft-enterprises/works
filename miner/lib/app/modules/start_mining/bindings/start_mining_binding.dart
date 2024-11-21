import 'package:get/get.dart';

import '../controllers/start_mining_controller.dart';

class StartMiningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace<StartMiningController>(
      () => StartMiningController(),
    );
  }
}

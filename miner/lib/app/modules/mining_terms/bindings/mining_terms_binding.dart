import 'package:get/get.dart';

import '../controllers/mining_terms_controller.dart';

class MiningTermsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MiningTermsController>(
      () => MiningTermsController(),
    );
  }
}

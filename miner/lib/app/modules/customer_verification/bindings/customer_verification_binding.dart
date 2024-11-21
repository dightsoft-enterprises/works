import 'package:get/get.dart';

import '../controllers/customer_verification_controller.dart';

class CustomerVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerVerificationController>(
      () => CustomerVerificationController(),
    );
  }
}

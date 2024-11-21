import 'package:get/get.dart';

import '../controllers/withdrawal_controller.dart';

class WithdrawalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace<WithdrawalController>(
      () => WithdrawalController(),
    );
  }
}

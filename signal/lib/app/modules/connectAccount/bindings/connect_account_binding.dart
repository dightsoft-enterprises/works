import 'package:get/get.dart';

import '../controllers/connect_account_controller.dart';

class ConnectAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace<ConnectAccountController>(
      () => ConnectAccountController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/signal_level2_controller.dart';

class SignalLevel2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace<SignalLevel2Controller>(
      () => SignalLevel2Controller(),
    );
  }
}

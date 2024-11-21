import 'package:get/get.dart';

import '../controllers/bot_level2_controller.dart';

class  BotLevel2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace<BotLevel2Controller>(
      () => BotLevel2Controller(),
    );
  }
}

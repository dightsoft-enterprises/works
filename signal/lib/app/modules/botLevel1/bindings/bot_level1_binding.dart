import 'package:get/get.dart';

import '../controllers/bot_level1_controller.dart';

class  BotLevel1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace<BotLevel1Controller>(
      () => BotLevel1Controller(),
    );
  }
}

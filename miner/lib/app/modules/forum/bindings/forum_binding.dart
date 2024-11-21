import 'package:get/get.dart';

import '../controllers/forum_controller.dart';

class ForumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace<ForumController>(
      () => ForumController(),
    );
  }
}

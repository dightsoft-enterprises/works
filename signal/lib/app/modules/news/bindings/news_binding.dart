import 'package:get/get.dart';

import '../controllers/news_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyReplace<NewsController>(
      () => NewsController(),
    );
  }
}

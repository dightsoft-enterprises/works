import 'package:get/get.dart';

import '../../../data/model/news.dart';
import '../../../data/providers/app_provider.dart';

class NewsController extends GetxController with StateMixin<List<News>>{
  final AppProvider _appProvider = Get.find();
  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _loadData() async {
    change(List.empty(), status: RxStatus.loading());
    return _appProvider
        .getNews()
        .then((data) => change(data, status: RxStatus.success()));
  }
}

import 'package:get/get.dart';
import 'package:signal/app/data/model/contact.dart';

import '../../../data/providers/app_provider.dart';

class AboutController extends GetxController with StateMixin<Contact> {
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
    change(null, status: RxStatus.loading());

    return _appProvider
        .getContact()
        .then((data) => change(data, status: RxStatus.success()));
  }
}

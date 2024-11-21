import 'package:get/get.dart';
import 'package:miner/app/data/models/app_notification.dart';

import '../../../data/providers/app_provider.dart';
import '../../../data/service/app_storage_manager.dart';

class NotificationController extends GetxController
    with StateMixin<List<AppNotification>> {
  final AppProvider _appProvider = Get.find();
  final AppStorageManager _appStorageManager = Get.find();
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
  await  _appStorageManager.removeNotificationStatus();
    change(List.empty(), status: RxStatus.loading());
    return _appProvider
        .getNotification()
        .then((data) => {change(data, status: RxStatus.success())});
  }
}

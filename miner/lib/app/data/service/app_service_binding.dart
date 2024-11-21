import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:miner/app/data/providers/app_provider.dart';

import '../providers/user_provider.dart';
import 'app_storage_manager.dart';
import 'apps_service.dart';

class AppServiceBinding extends GetxService {
  static Future<void> initServices() async {
    await GetStorage.init();
    Get.create(() => AppStorageManager());
    Get.create(() => AppProvider());
    Get.create(() => UserProvider());

    await Get.putAsync(() => AppsService().init());
  }
}

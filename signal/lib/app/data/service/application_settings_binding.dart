
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:signal/app/data/providers/app_provider.dart';

import '../app_storage_maneger.dart';
import '../providers/user_provider.dart';

import 'apps_service.dart';



class ApplicationSettingsBinding {
  static Future<void> initServices() async {
    await GetStorage.init();

    Get.create(() => AppStorageManager());
    Get.create(() => UserProvider());
    Get.create(() => AppProvider());

    await Get.putAsync(() => AppsService().init());
  }
}

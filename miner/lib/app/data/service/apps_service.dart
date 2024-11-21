
import 'package:get/get.dart';

import '../providers/app_provider.dart';
import 'app_storage_manager.dart';


class AppsService extends GetxService {
  final AppProvider _appProvider = Get.find();
  final AppStorageManager _appStorageManager = Get.find();

  Future<AppsService> init() async {
    await _appProvider.getSettings();
  //   String code = _appStorageManager.getRegistrationCode();
  //   Account data = Account.none();
  //   data.code.value = code;
  //
  //   await _appProvider.checkDeiceActivation(data).then((item) async => {
  //         if (item.id.value == null)
  //           {await _appStorageManager.removeUser()},
  //       });
  //
    return this;
   }
}

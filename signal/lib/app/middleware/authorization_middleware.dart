import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/app_storage_maneger.dart';
import '../data/model/user.dart';
import '../routes/app_pages.dart';

class AuthorizationMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;
  final AppStorageManager _appStorageManager = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    try {
      User user = _appStorageManager.getActiveUser();
      String code = _appStorageManager.getRegistrationCode();
      int deviceRegistered = _appStorageManager.getDevice();

      if (deviceRegistered == 0) {
        return const RouteSettings(name: Routes.DEVICE);
      }
    //   else if (approved == null || approved == 0) {
    //     _appStorageManager.removeActiveUser();
    //     return  const RouteSettings(name: Routes.LOGIN);
    //   } else if (user.id.value == null || user.id.value == null) {
    //     _appStorageManager.removeActiveUser();
    //     return const RouteSettings(name: Routes.LOGIN);
    //   }
    } catch (e) {
      _appStorageManager.removeActiveUser();
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }

  @override
  Widget onPageBuilt(Widget page) {
    //perform task
    return page;
  }
}

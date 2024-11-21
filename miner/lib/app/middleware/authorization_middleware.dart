
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/models/subscriber.dart';
import '../data/models/user.dart';
import '../data/service/app_storage_manager.dart';
import '../routes/app_pages.dart';

class AuthorizationMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;
  final AppStorageManager _systemStorageManager = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    Subscriber? data = _systemStorageManager.getUserDetails();

    if (data == null ||data.id.value == null) {
      _systemStorageManager.removeActiveUser();
      return const RouteSettings(name: Routes.LOGIN);
    }

    return null;
  }

  @override
  Widget onPageBuilt(Widget page) {
    //  _remoteJobManager.todayTask();
    return page;
  }


}

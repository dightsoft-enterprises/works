
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/models/subscriber.dart';
import '../data/models/user.dart';
import '../data/service/app_storage_manager.dart';
import '../routes/app_pages.dart';

class NotificationMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  final AppStorageManager _systemStorageManager = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    // int status = _systemStorageManager.getNotificationStatus();
    // if (status == 1) {
    //   return const RouteSettings(name: Routes.NOTIFICATION);
    // }
    return null;
  }

  @override
  Widget onPageBuilt(Widget page) {
    return page;
  }


}

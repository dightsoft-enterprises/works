import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miner/app/data/models/subscription_plan.dart';

import '../../../data/providers/app_provider.dart';
import '../../../data/service/app_storage_manager.dart';
import '../../../util/app_constant.dart';

class PricingController extends GetxController
    with StateMixin<List<SubscriptionPlan>> {
  final AppStorageManager _appStorageManager = Get.find();
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
        .getSubscriptionPlan()
        .then((data) => {change(data, status: RxStatus.success())});
  }



}

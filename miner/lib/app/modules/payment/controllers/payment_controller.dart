import 'dart:developer';

import 'package:get/get.dart';
import 'package:miner/app/data/models/subscription_plan.dart';

class PaymentController extends GetxController
    with StateMixin<SubscriptionPlan> {
  int colorIndex = 0;

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

  _loadData() {
    change(SubscriptionPlan.none(), status: RxStatus.loading());
    try {
      SubscriptionPlan plan = Get.arguments['subscriptionPlan'];
      colorIndex = Get.arguments['colorIndex'];
      if (plan.name != null) {
        change(plan, status: RxStatus.success());
      }else{
        change(SubscriptionPlan.none(), status: RxStatus.empty());
      }
    } catch (e) {
      change(SubscriptionPlan.none(), status: RxStatus.empty());
    }
  }
}

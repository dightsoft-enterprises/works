import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signal/app/data/model/pricing.dart';

import '../../../data/providers/app_provider.dart';

class BotsController extends GetxController with StateMixin<List<Pricing>> {
  final AppProvider _appProvider = Get.find();

  Color  color1 =  Colors.orange[500] as Color;
  Color  color11 =  Colors.orange[700] as Color;

  Color color2 =  Colors.red[500]as Color;
  Color color22 =  Colors.red[700]as Color;

  Color color3 =  Colors.green[500]as Color;
  Color color33 =  Colors.green[700]as Color;

  Color color4 =  Colors.blue[500]as Color;
  Color color44 =  Colors.blue[700]as Color;

  final count = 0.obs;

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
        .getPricing()
        .then((data) => change(data, status: RxStatus.success()));
  }
}

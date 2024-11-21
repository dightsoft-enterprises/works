import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:signal/app/data/model/trade.dart';

import '../../../data/providers/app_provider.dart';

class HomeController extends GetxController with StateMixin<List<Trade>> {
  final TextEditingController startEditingController = TextEditingController();
  final TextEditingController endEditingController = TextEditingController();

  final AppProvider _appProvider = Get.find();
  Rxn<String> createdDateFrom = Rxn<String>();
  Rxn<String> createdDateEnd = Rxn<String>();

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

  setStartDate(String date) {
    var formatter = DateFormat('yyyy-MM-dd');
    var start = DateTime.parse(date);
    var now = DateTime.utc(start.year, start.month, start.day, 00, 00, 00);
    String formattedDate = formatter.format(now);
    createdDateFrom.value = formattedDate;
  }

  setEndDate(String date) {
    var formatter = DateFormat('yyyy-MM-dd');
    var end = DateTime.parse(date);

    var now = DateTime.utc(end.year, end.month, end.day, 23, 59, 59);
    createdDateEnd.value = formatter.format(now);
  }

  DateTime getEndDate() {
    if (createdDateEnd.value == null) {
      return DateTime.now();
    }
    return DateTime.parse(createdDateEnd.value!);
  }

  DateTime getStartDate() {
    if (createdDateFrom.value == null) {
      return DateTime.now();
    }
    return DateTime.parse(createdDateFrom.value!);
  }

  _loadData() async {
    change(List.empty(), status: RxStatus.loading());
    if (createdDateFrom.value == null) {
      setStartDate(DateTime.now().toIso8601String());
    }
    if (createdDateEnd.value == null) {
      setEndDate(DateTime.now().toIso8601String());
    }

    Trade data = Trade.name(createdDateFrom, createdDateEnd);
    return _appProvider.getTrade(data).then((data) => {
          change(data, status: RxStatus.success())
        });
  }

  search() {
    if (startEditingController.text.isNotEmpty &&
        endEditingController.text.isNotEmpty) {
      change(List.empty(), status: RxStatus.loading());
      Trade data = Trade.name(createdDateFrom, createdDateEnd);
      return _appProvider
          .getTrade(data)
          .then((data) => {
        change(data, status: RxStatus.success())
      });
    }
  }
}

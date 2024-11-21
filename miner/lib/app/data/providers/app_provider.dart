import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:miner/app/data/models/general_settings.dart';
import 'package:miner/app/data/models/mining_currency.dart';
import 'package:miner/app/data/models/app_notification.dart';
import 'package:miner/app/data/models/subscription_plan.dart';
import 'package:miner/app/util/app_constant.dart';

import '../service/app_storage_manager.dart';


class AppProvider extends GetConnect {
  final AppStorageManager _appStorageManager = Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = AppConstant.baseUrl;

    httpClient.addResponseModifier((request, response) async {
      if (response.statusCode != null && response.statusCode == 401) {}

      // log('UserProvider responses.........................');
      // log(response.bodyString.toString());
      //
      // log('UserProvider request.............'+ request.url.path);
      // log(request.bodyBytes.toString());
      return response;
    });

    httpClient.addRequestModifier((Request request) {
      String? token = 'hdshsdhdhs';
      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] = "Bearer $token";
      return request;
    });
  }

  Future<GeneralSettings> getSettings() async {
    final response = await post('settings', '');
    var result = response.body;
    if (response.isOk && result != null) {
      GeneralSettings dataResponse = GeneralSettings.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;

      await _appStorageManager.addSettings(dataResponse);

      return dataResponse;
    }

    return GeneralSettings.none();
  }



  Future<List<SubscriptionPlan>> getSubscriptionPlan() async {
    SubscriptionPlan data = SubscriptionPlan.none();
    final response = await post('pricing', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      List<SubscriptionPlan> dataList =
          (result as List).map((item) => SubscriptionPlan.fromJson(item)).toList();
      return dataList;
    }
    return List.empty();
  }

  Future<List<AppNotification>> getNotification() async {
    AppNotification data = AppNotification.none();
    final response = await post('notification', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      List<AppNotification> dataList =
          (result as List).map((item) => AppNotification.fromJson(item)).toList();
      return dataList;
    }
    return List.empty();
  }

   Future<bool> createNotification(AppNotification data) async {
    final response = await post('notification-create', data.toJson());
    var result = response.body;

    return true;
  }

  Future<List<MiningCurrency>> getCurrency() async {
    MiningCurrency data = MiningCurrency.none();
    final response = await post('currency', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      List<MiningCurrency> dataList =
          (result as List).map((item) => MiningCurrency.fromJson(item)).toList();
      return dataList;
    }
    return List.empty();
  }

  Future<List<MiningCurrency>> getSubscriberCurrency() async {
    MiningCurrency data = MiningCurrency.none();
    final response = await post('subscriber-currency', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      List<MiningCurrency> dataList =
      (result as List).map((item) => MiningCurrency.fromJson(item)).toList();
      return dataList;
    }
    return List.empty();
  }

}

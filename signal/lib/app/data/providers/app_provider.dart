import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:signal/app/data/model/news.dart';
import 'package:signal/app/data/model/trade.dart';

import '../../util/app_helper.dart';

import '../app_storage_maneger.dart';
import '../model/account.dart';
import '../model/contact.dart';
import '../model/pricing.dart';

class AppProvider extends GetConnect {
  final AppStorageManager _appStorageManager = Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = AppHelper.baseUrl;

    httpClient.addResponseModifier((request, response) async {
      if (response.statusCode != null && response.statusCode == 401) {}
      return response;
    });

    httpClient.addRequestModifier((Request request) {
      String? token = 'hdshsdhdhs';
      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] = "Bearer $token";
      return request;
    });
  }

  Future<Contact> getContact() async {
    final response = await post('contact', '');
    var result = response.body;
    if (response.isOk && result != null) {
      Contact dataResponse = Contact.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;

      await _appStorageManager.addContact(dataResponse);

      return dataResponse;
    }

    return Contact.none();
  }

  Future<List<Trade>> getTrade(Trade data) async {
    final response = await post('trade', data.toJson());
    var result = response.body;

    if (response.isOk && result != null) {
      List<Trade> dataList =
          (result as List).map((item) => Trade.fromJson(item)).toList();
      return dataList;
    }
    return List.empty();
  }

  Future<List<Pricing>> getPricing() async {
    Pricing data = Pricing.none();
    final response = await post('pricing', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      List<Pricing> dataList =
          (result as List).map((item) => Pricing.fromJson(item)).toList();
      return dataList;
    }
    return List.empty();
  }

  Future<List<News>> getNews() async {
    News data = News.none();
    final response = await post('news', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      List<News> dataList =
          (result as List).map((item) => News.fromJson(item)).toList();
      return dataList;
    }
    return List.empty();
  }

  Future<List<Trade>> getSignal() async {
    Trade data = Trade.none();
    final response = await post('signal', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      List<Trade> dataList =
          (result as List).map((item) => Trade.fromJson(item)).toList();
      return dataList;
    }
    return List.empty();
  }

  Future<Account> getSignalLevel1(Account data) async {
    final response = await post('signal-level-1', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      Account dataResponse = Account.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;
      return dataResponse;
    }
    return Account.none();
  }

  Future<Account> checkDeiceActivation(Account data) async {
    final response = await post('device-activation', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      Account dataResponse = Account.fromJson(result);
      return dataResponse;
    }
    return Account.none();
  }

  Future<Account> getDeiceActivation(Account data) async {
    final response = await post('device-activation', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      Account dataResponse = Account.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;

      await _appStorageManager.addDevice(1);
      await _appStorageManager.addRegistrationCode(dataResponse.code.string);
      return dataResponse;
    }
    return Account.none();
  }


  Future<Account> getPassKey(Account data) async {
    final response = await post('passkey', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      Account dataResponse = Account.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;
      return dataResponse;
    }
    return Account.none();
  }

  Future<Account> getSecretKey(Account data) async {
    final response = await post('SECRETKEY', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      Account dataResponse = Account.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;
      return dataResponse;
    }
    return Account.none();
  }



  Future<Account> getBotLevel1(Account data) async {
    final response = await post('bot-level-1', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      Account dataResponse = Account.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;
      return dataResponse;
    }
    return Account.none();
  }

  Future<Account> getBotLevel2(Account data) async {
    final response = await post('bot-level-2', data.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      Account dataResponse = Account.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;
      return dataResponse;
    }
    return Account.none();
  }
}

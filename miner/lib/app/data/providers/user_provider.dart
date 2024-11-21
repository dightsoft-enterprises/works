import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../util/app_constant.dart';
import '../models/subscriber.dart';

import '../models/user.dart';
import '../service/app_storage_manager.dart';

class UserProvider extends GetConnect {
  final AppStorageManager _appStorageManager = Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = AppConstant.baseUrl;

    httpClient.addResponseModifier((request, response) async {
      if (response.statusCode != null && response.statusCode == 401) {}

      log('UserProvider responses.........................');
       log(response.bodyString.toString());

      return response;
    });

    httpClient.addRequestModifier((Request request) {
      String? token = '092019';
      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] = "Bearer $token";

      return request;
    });
  }

  Future<Subscriber> authUser(Subscriber data) async {
    return loginFromServer(data);
  }

  Future<Subscriber> loginFromServer(Subscriber data) async {
    final response = await post('auth', data.toJson());
    var result = response.body;

    if (response.isOk && result != null && result != []) {
      Subscriber dataResponse = Subscriber.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;

      if(dataResponse.approved.value == null || dataResponse.approved.value != 1){
        Subscriber dataResponse1 = Subscriber.none();
        dataResponse1.serverResponseStatus.value = false;
        dataResponse1.serverMessage.value = "Not Found";
        return dataResponse1;
      }

      await addUserDetails(dataResponse);
      return dataResponse;
    } else if (response.isOk && result == null) {
      Subscriber dataResponse = Subscriber.none();
      dataResponse.serverMessage.value = "Not Found";
      return dataResponse;
    } else {
      var dataResponse = Subscriber.none();
      dataResponse.serverMessage.value = "Unavailable";
      return dataResponse;
    }
  }

  Future<Subscriber> getSubscriberById(Subscriber data) async {
    final response = await post('user-details', data.toJson());
    var result = response.body;

    if (response.isOk && result != null) {
      Subscriber dataResponse = Subscriber.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;

      await addUserDetails(dataResponse);
      return dataResponse;
    } else if (response.isOk && result == null) {
      Subscriber dataResponse = Subscriber.none();
      dataResponse.serverMessage.value = "Not Found";
      return dataResponse;
    } else {
      var dataResponse = Subscriber.none();
      dataResponse.serverMessage.value = "Unavailable";
      return dataResponse;
    }
  }

  Future<bool> addUserDetails(Subscriber data) {
    return _appStorageManager.addUserDetails(data);
  }

  Future<Subscriber> updateCoinBalance(Subscriber data) async {
    final response = await post('update-coin-balance', data.toJson());
    var result = response.body;
    if (response.isOk && result != null && result != []) {
      Subscriber dataResponse = Subscriber.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;
      await addUserDetails(dataResponse);
      return dataResponse;
    } else {
      var dataResponse = Subscriber.none();
      return dataResponse;
    }
  }

  Future<Subscriber> withdrawal(Subscriber data) async {
    final response = await post('withdrawal', data.toJson());
    var result = response.body;
    if (response.isOk && result != null && result != []) {
      Subscriber dataResponse = Subscriber.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;
      await addUserDetails(dataResponse);
      return dataResponse;
    } else {
      var dataResponse = Subscriber.none();
      return dataResponse;
    }
  }


  Future<Subscriber> resetPassword(Subscriber data) async {
    final response = await post('reset-password', data.toJson());
    var result = response.body;
    if (response.isOk && result != null && result != []) {
      Subscriber dataResponse = Subscriber.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;
      await addUserDetails(dataResponse);
      return dataResponse;
    } else {
      var dataResponse = Subscriber.none();
      return dataResponse;
    }
  }


  Future<Subscriber> verifyAccount(Subscriber data) async {
    final response = await post('verify-account', data.toJson());
    var result = response.body;
    if (response.isOk && result != null && result != []) {
      Subscriber dataResponse = Subscriber.fromJson(result);
      dataResponse.serverResponseStatus.value = true;
      dataResponse.serverBody.value = result;
      await addUserDetails(dataResponse);
      return dataResponse;
    } else {
      var dataResponse = Subscriber.none();
      return dataResponse;
    }
  }

  Future<dynamic> register(Subscriber data) async {
    final response = await post('register', data.toJson());
    var result = response.body;
    return result;
  }

  Future<dynamic> forgotPassword(Subscriber data) async {
    final response = await post('forgot-password', data.toJson());
    var result = response.body;
    return result;
  }


}

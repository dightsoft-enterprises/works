
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../util/app_helper.dart';
import '../app_storage_maneger.dart';
import '../model/user.dart';


class UserProvider extends GetConnect {
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



  Future<User> loginFromServer(User user) async {
    final response = await post('auth', user.toJson());
    var result = response.body;
    if (response.isOk && result != null) {
      int approved = 0;
      User data = User.fromJson(result);
      data.serverResponseStatus.value = true;
      data.serverBody.value = result;

      if (data.approved.value != null && data.approved.value == true) {
        approved = 1;
      }
      await addUser(data);
      await addClientCode(data.code.value!);
      await addApprovedCode(approved);

      return data;
    } else if (response.isOk && result == null) {
      User data = User.none();
      data.serverMessage.value = "NOT FOUND";
      return data;
    } else {
      var data = User.none();
      data.serverMessage.value = "NOT FOUND";
      return data;
    }
  }

  Future<User> deviceRegistration(User user) async {
    final response = await post('register-device', user.toJson());
    var result = response.body;

    if (response.isOk && result != null) {
      User data = User.fromJson(result);
      data.serverResponseStatus.value = true;
      data.serverBody.value = result;

      return data;
    } else {
      var data = User.none();
      data.serverMessage.value = "NOT FOUND";
      return data;
    }
  }

  Future<bool> addUser(User data) {
    return _appStorageManager.addUser(data);
  }

  getClientCode() {
    return _appStorageManager.getClientCode();
  }

  Future<bool> addClientCode(String code) {
    return _appStorageManager.addClientCode(code);
  }

  getApprovedCode() {
    return _appStorageManager.getApprovedCode();
  }

  Future<bool> addApprovedCode(int code) {
    return _appStorageManager.addApprovedCode(code);
  }

  getRegistrationCode() {
    return _appStorageManager.getRegistrationCode();
  }

  Future<bool> addRegistrationCode(String code) {
    return _appStorageManager.addRegistrationCode(code);
  }

  getDevice() {
    return _appStorageManager.getDevice();
  }

  Future<bool> addDevice(int code) {
    return _appStorageManager.addDevice(code);
  }
}

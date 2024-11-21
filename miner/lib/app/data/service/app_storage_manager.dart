import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:miner/app/data/models/subscriber.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constant.dart';
import '../models/general_settings.dart';
import '../models/user.dart';

class AppStorageManager {
  final box = GetStorage();

  Future<bool> addUserDetails(Subscriber data) async {
    await _addUser(data);
    return true;
  }

  _addUser(Subscriber data) {
    return box.write(AppConstant.activeUser, jsonEncode(data.serverBody.value));
  }

  Future<void> removeActiveUser() async {
    var v = await box.remove(AppConstant.activeUser);
    return v;
  }

  Subscriber? getUserDetails() {
    var jsonString = box.read(AppConstant.activeUser);
    if (jsonString != null) {
      return Subscriber.fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  Future<bool> addSettings(GeneralSettings data) async {
    await box.write(AppConstant.settings, jsonEncode(data.serverBody.value));
    return true;
  }

  Future<void> removeSettings() async {
    var v = await box.remove(AppConstant.settings);
    return v;
  }



  Future<void> removeTimeSpent() async {
    var v = await box.remove(AppConstant.timeSpent);
    return v;
  }

  GeneralSettings getSettings() {
    var jsonString = box.read(AppConstant.settings);
    if (jsonString != null) {
      return GeneralSettings.fromJson(jsonDecode(jsonString));
    }
    return GeneralSettings.none();
  }

  Future<int> getNotificationStatus()  async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    int? status = await prefs.getInt(AppConstant.notification);
    if (status != null) {
      return status;
    }
    return 0;
  }

  Future<void> removeNotificationStatus() async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    var v = await prefs.remove(AppConstant.notification);
    return v;
  }




}

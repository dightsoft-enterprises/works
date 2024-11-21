import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/app_pages.dart';
import '../util/app_helper.dart';
import 'model/contact.dart';
import 'model/user.dart';

class AppStorageManager {
  final box = GetStorage();

  Future<bool> addUser(User user) async {
    await box.write(AppHelper.activeUser, jsonEncode(user.serverBody.value));

    return true;
  }

  Future<void> removeActiveUser() async {
    var v = await box.remove(AppHelper.activeUser);
    return v;
  }

  User getActiveUser() {
    var jsonString = box.read(AppHelper.activeUser);
    if (jsonString != null) {
      return User.fromJson(jsonDecode(jsonString));
    }
    return User.none();
  }

  Future<bool> addContact(Contact contact) async {
    await box.write(AppHelper.contact, jsonEncode(contact.serverBody.value));

    return true;
  }

  Future<void> removeContact() async {
    var v = await box.remove(AppHelper.contact);
    return v;
  }

  Contact getContact() {
    var jsonString = box.read(AppHelper.contact);
    if (jsonString != null) {
      return Contact.fromJson(jsonDecode(jsonString));
    }
    return Contact.none();
  }

  logout() {
    return removeActiveUser()
        .then((value) => {Get.offAndToNamed(Routes.LOGIN)});
  }

  Future<bool> addClientCode(String code) async {
    await box.write(AppHelper.clientCode, jsonEncode(code));
    return true;
  }

  String getClientCode() {
    var jsonString = box.read(AppHelper.clientCode);
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return "";
  }

  Future<bool> addApprovedCode(int code) async {
    await box.write(AppHelper.approved, jsonEncode(code));
    return true;
  }

  int getApprovedCode() {
    var jsonString = box.read(AppHelper.approved);
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return 0;
  }

  Future<bool> addRegistrationCode(String code) async {
    await box.write(AppHelper.registrationCode, jsonEncode(code));
    return true;
  }

  String getRegistrationCode() {
    var jsonString = box.read(AppHelper.registrationCode);
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return "";
  }

  Future<bool> addDevice(int code) async {
    await box.write(AppHelper.device, jsonEncode(code));
    return true;
  }

  int getDevice() {
    var jsonString = box.read(AppHelper.device);
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return 0;
  }

  Future<void> removeUser() async {
    var v = await box.remove(AppHelper.device);
    await box.remove(AppHelper.registrationCode);

    return v;
  }
}

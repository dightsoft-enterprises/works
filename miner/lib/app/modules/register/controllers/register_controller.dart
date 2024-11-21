import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/models/subscriber.dart';
import '../../../data/providers/user_provider.dart';
import '../../../data/service/app_storage_manager.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final AppStorageManager _appStorageManager = Get.find();
  Rxn<bool> emailUsed = Rxn<bool>();
  Rxn<bool> flashMessage = Rxn<bool>();
  final UserProvider _userProvider = Get.find();
  Rxn<bool> isLoading = Rxn<bool>();
  final RxBool hidePassword = true.obs;
  final RxBool rememberMe = true.obs;
  final RxString phoneCode = '+1'.obs;

  final TextEditingController firstNameEditingController =
      TextEditingController();
  final TextEditingController lastNameEditingController =
      TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController genderEditingController = TextEditingController();
  final TextEditingController countryEditingController =
      TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();


  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String? validateText(String value, AppLocalizations language) {
    if (value.isEmpty) {
      return language.field_is_required;
    }
    return null;
  }

  bool _checkForm(GlobalKey<FormState> formKey) {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      return isValid;
    } else {
      return isValid;
    }
  }

  RxBool togglePasswordIcon() {
    if (hidePassword.isTrue) {
      hidePassword.value = false;
      return hidePassword;
    } else {
      hidePassword.value = true;
      return hidePassword;
    }
  }

  Future<dynamic> _register() {
    Subscriber data = Subscriber.none();

    data.firstName.value = firstNameEditingController.text;
    data.lastName.value = lastNameEditingController.text;
    data.email.value = emailEditingController.text;
    data.phone.value = phoneCode.value + phoneEditingController.text;
    data.password.value = passwordEditingController.text;
    return _userProvider.register(data);
  }

  _checkRegistration(result)  {
    var settings = _appStorageManager.getSettings();
    Map<String, dynamic> json = jsonDecode(result);

    bool success = json['success'];
    var status = json['code'];
    var message = json['message'];

    if (success && status == 200) {
      if (settings.emailVerification.value != null &&
          settings.emailVerification.value == 1) {
        Get.toNamed(Routes.CUSTOMER_VERIFICATION,
            arguments: {"data": json['data']});
      } else {
        Subscriber dataResponse = Subscriber.fromJson(json['data']);
        dataResponse.serverResponseStatus.value = true;
        dataResponse.serverBody.value = json['data'];
        return _userProvider
            .addUserDetails(dataResponse)
            .then((it) => {Get.toNamed(Routes.HOME)});
      }
    } else if (message == "EMAIL-USED") {
      emailUsed.value == true;
    } else {
      flashMessage.value = true;
    }
  }

  register(BuildContext context, GlobalKey<FormState> formKey) {
    emailUsed.value = false;
    flashMessage.value = false;
    isLoading.value = true;
    if (_checkForm(formKey)) {
      _register().then(
          (data) async => {isLoading.value = false, _checkRegistration(data)});
    } else {
      isLoading.value = false;
    }
  }
}

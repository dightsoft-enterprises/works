import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/models/subscriber.dart';
import '../../../data/providers/user_provider.dart';
import '../../../routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  Rxn<bool> isLoading = Rxn<bool>();
  Rxn<bool> flashMessage = Rxn<bool>();
  final UserProvider _userProvider = Get.find();
  final TextEditingController emailEditingController = TextEditingController();

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

  submit(BuildContext context, GlobalKey<FormState> formKey) {
    flashMessage.value = false;
    isLoading.value = true;
    if (_checkForm(formKey)) {
      _send().then(
              (data) async => {isLoading.value = false, _checkSubscriber(data)});
    } else {
      isLoading.value = false;
    }
  }

  _checkSubscriber(result)  {
    Map<String, dynamic> json = jsonDecode(result);
    bool success = json['success'];
    var status = json['code'];

    if (success && status == 200) {
      Get.toNamed(Routes.PASSWORD_RESET, arguments: {"data": json['data']});
    } else {
      flashMessage.value = true;
    }
  }

  Future<dynamic> _send() {
    Subscriber data = Subscriber.none();
    data.email.value = emailEditingController.text;
    return _userProvider.forgotPassword(data);
  }
}

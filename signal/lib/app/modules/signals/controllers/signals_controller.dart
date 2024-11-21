import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:signal/app/data/model/account.dart';

import '../../../data/providers/app_provider.dart';
import '../../../util/app_helper.dart';

class SignalsController extends GetxController {
  Rxn<bool> isLoading = Rxn<bool>();
  Rxn<bool> flashMessage = Rxn<bool>();
  final AppHelper _appHelper = AppHelper();
  final AppProvider _appProvider = Get.find();
  final TextEditingController secretKeyEditingController =
      TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final RxBool hidePassword = true.obs;
  final password = Rxn<String>();

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

  reset(String value) {
    flashMessage.value = false;
  }

  String? validateSecretKey(String value) {
    if (value.isEmpty) {
      return 'field_is_required'.tr;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'field_is_required'.tr;
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

  connect(BuildContext context, GlobalKey<FormState> formKey) {
    isLoading.value = true;
    if (_checkForm(formKey)) {
      Account data = Account.none();
      data.code.value = secretKeyEditingController.text;

      _appProvider.getSignalLevel1(data).then((item) => {
            isLoading.value = false,
            if (item.id.value != null)
              {
                _appHelper.displayAccessCode(context),
              }
            else
              {
                flashMessage.value = true,
              }
          });


    } else {
      isLoading.value = false;
    }
  }
}

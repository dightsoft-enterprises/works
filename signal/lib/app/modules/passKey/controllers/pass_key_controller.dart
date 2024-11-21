import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signal/app/theme/app_colors.dart';
import 'package:signal/app/util/app_helper.dart';

import '../../../data/model/account.dart';
import '../../../data/providers/app_provider.dart';
import '../../../routes/app_pages.dart';

class PassKeyController extends GetxController {
  Rxn<bool> isLoading = Rxn<bool>();
  final AppHelper _appHelper =  AppHelper();
  Rxn<bool> flashMessage = Rxn<bool>();
  final AppProvider _appProvider = Get.find();
  final TextEditingController passKeyEditingController =
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

  String? validatePasskey(String value) {
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



  connect(BuildContext context, GlobalKey<FormState> formKey) {
    isLoading.value = true;
    if (_checkForm(formKey)) {
      Account data = Account.none();
      data.code.value = passKeyEditingController.text;

      _appProvider.getPassKey(data).then((item) => {
        isLoading.value = false,
        if (item.id.value != null)
          {
            Get.offAndToNamed(Routes.BOT_LEVEL1),
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

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:signal/app/routes/app_pages.dart';

import '../../../data/app_storage_maneger.dart';
import '../../../data/model/account.dart';
import '../../../data/providers/app_provider.dart';
import '../../../util/app_helper.dart';

class LoginController extends GetxController {
  Rxn<bool> isLoading = Rxn<bool>();
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

      _appProvider.getSignalLevel1(data).then((item) async => {
        isLoading.value = false,
        if (item.id.value != null)
          {
            Get.offAndToNamed(Routes.HOME),
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
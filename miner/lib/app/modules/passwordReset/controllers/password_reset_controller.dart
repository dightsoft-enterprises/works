import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/models/subscriber.dart';
import '../../../data/providers/user_provider.dart';
import '../../../routes/app_pages.dart';

class PasswordResetController extends GetxController {
  Rxn<bool> isLoading = Rxn<bool>();
  Rxn<bool> flashMessage = Rxn<bool>();

  Rxn<Subscriber> subscriber = Rxn<Subscriber>();
  final RxBool hidePassword = true.obs;
  final UserProvider _userProvider = Get.find();
  final TextEditingController codeEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();
  final TextEditingController confirmPasswordEditingController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    subscriber.value = Subscriber.fromJson(Get.arguments['data']);
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

  RxBool togglePasswordIcon() {
    if (hidePassword.isTrue) {
      hidePassword.value = false;
      return hidePassword;
    } else {
      hidePassword.value = true;
      return hidePassword;
    }
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

  submit(BuildContext context, GlobalKey<FormState> formKey) async {
    flashMessage.value = false;
    isLoading.value = true;
    if (_checkForm(formKey)) {

      if( codeEditingController.text != subscriber.value?.code.value){
        flashMessage.value = true;
        isLoading.value = false;
        return;
      }

      subscriber.value?.code.value = codeEditingController.text;
      subscriber.value?.password.value = passwordEditingController.text;
      return _userProvider.resetPassword(subscriber.value!).then((data) async => {
      isLoading.value = false,
        Get.offAndToNamed(Routes.HOME),
      });
    } else {
      isLoading.value = false;
      flashMessage.value = true;
    }
  }

}

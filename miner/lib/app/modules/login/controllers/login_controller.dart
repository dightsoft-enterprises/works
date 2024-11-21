
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:miner/app/data/models/subscriber.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/providers/user_provider.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController  with StateMixin<Subscriber>{
  Rxn<bool> flashMessage = Rxn<bool>();
  Rxn<bool> isLoading = Rxn<bool>();
  final RxBool hidePassword = true.obs;
  final RxBool rememberMe = true.obs;
  final UserProvider _userProvider = Get.find();

  final TextEditingController emailEditingController =
      TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  final username = Rxn<String>();
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

  RxBool togglePasswordIcon() {
    if (hidePassword.isTrue) {
      hidePassword.value = false;
      return hidePassword;
    } else {
      hidePassword.value = true;
      return hidePassword;
    }
  }

  RxBool toggleRememberMe() {
    if (rememberMe.isTrue) {
      rememberMe.value = false;
      return rememberMe;
    } else {
      rememberMe.value = true;
      return rememberMe;
    }
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

  Future<Subscriber> _subscriberLogin() {
    var data = Subscriber.none();
    var email = emailEditingController.text;
    var password = passwordEditingController.text;

    data.email.value = email;
    data.password.value = password;

    return _userProvider.authUser(data);
  }


  login(BuildContext context, GlobalKey<FormState> formKey) {
    isLoading.value = true;
    if (_checkForm(formKey)) {
      _subscriberLogin().then((data) async => {
        isLoading.value = false,
        if (data.serverResponseStatus.value == true)
          {
              {Get.offAndToNamed(Routes.HOME)}
          }
        else
          {
            flashMessage.value = true,
          },

      });
    } else {
      isLoading.value = false;
    }
  }
}

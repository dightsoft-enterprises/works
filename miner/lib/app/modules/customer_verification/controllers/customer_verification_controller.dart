import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:miner/app/data/models/subscriber.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/providers/user_provider.dart';
import '../../../routes/app_pages.dart';

class CustomerVerificationController extends GetxController {
  Rxn<bool> isLoading = Rxn<bool>();
  Rxn<bool> flashMessage = Rxn<bool>();
  Rxn<Subscriber> subscriber = Rxn<Subscriber>();
  final UserProvider _userProvider = Get.find();
  final TextEditingController codeEditingController = TextEditingController();
  final RxInt timeout = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _loadData() {
    subscriber.value = Subscriber.fromJson(Get.arguments['data']);
    startCounter(60);
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

  verify(BuildContext context, GlobalKey<FormState> formKey) async {
    isLoading.value = true;
    if (_checkForm(formKey)) {
      isLoading.value = false;
      var code = codeEditingController.text;
      if (subscriber.value != null) {
        var subCode = subscriber.value?.code;

        if (subCode != null && code == subCode.value) {
          return _userProvider
              .verifyAccount(subscriber.value!)
              .then((data) async => {
                    Get.offAndToNamed(Routes.HOME),
                  });
        } else {
          flashMessage.value = true;
        }
      } else {
        flashMessage.value = true;
      }
    } else {
      isLoading.value = false;
    }
  }

  startCounter(int time) {
    timeout.value = time;
    var timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeout.value <= 1) {
        timer.cancel();
      }
      timeout.value = (timeout.value - 1);
    });
  }
}

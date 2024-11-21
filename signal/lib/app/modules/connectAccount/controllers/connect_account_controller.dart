import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:signal/app/data/model/pricing.dart';

import '../../../data/providers/app_provider.dart';
import '../../../routes/app_pages.dart';
import '../../../util/app_helper.dart';

class ConnectAccountController extends GetxController {
  Rxn<bool> isLoading = Rxn<bool>();
  final RxBool hidePassword = true.obs;
  final AppHelper _appHelper = AppHelper();
  final AppProvider _appProvider = Get.find();
  final TextEditingController brokerEditingController = TextEditingController();

  final TextEditingController botEditingController = TextEditingController();

  final TextEditingController accountEditingController =
      TextEditingController();
  final TextEditingController typeEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  final type = Rxn<String>();
  final account = Rxn<String>();
  final password = Rxn<String>();

  RxList<Pricing> pricing = RxList<Pricing>();

  @override
  Future<void> onInit() async {
    super.onInit();
    await _loadData();
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

  String? validateType(String value) {
    if (value.isEmpty) {
      return 'field_is_required'.tr;
    }
    return null;
  }

  String? validateAccount(String value) {
    if (value.isEmpty) {
      return 'field_is_required'.tr;
    }
    return null;
  }

  String? validateBroker(String value) {
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

  List<String> getMTAccountType() {
    return ["MT4 LIVE", "MT5 LIVE", "MT4 DEMO", "MT5 DEMO", "DERIV", "PROP FIRM"];
  }

  List<String> getPricing() {
    List<String> p = List.empty(growable: true);
    pricing.forEach((item) {
      p.add(item.name.string);
    });
    return p;
  }

  proceed(BuildContext context, GlobalKey<FormState> formKey) {
    isLoading.value = true;
    if (_checkForm(formKey)) {
      Future.delayed(const Duration(seconds: 3), () {
        isLoading.value = false;
        _appHelper.displayActivated(context);
        //
      });
    } else {
      isLoading.value = false;
    }
  }

  _loadData() async {
    return _appProvider.getPricing().then((data) => {pricing.value = data});
  }
}

import 'dart:developer';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miner/app/data/models/general_settings.dart';
import 'package:miner/app/data/models/subscriber.dart';
import 'package:miner/app/data/providers/user_provider.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/providers/app_provider.dart';
import '../../../data/service/app_storage_manager.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../util/app_constant.dart';

class WithdrawalController extends GetxController with StateMixin<Subscriber> {
  Rxn<bool> isLoading = Rxn<bool>();
  final AppStorageManager _appStorageManager = Get.find();
  final AppProvider _appProvider = Get.find();
  final UserProvider _userProvider = Get.find();

  final TextEditingController addressEditingController =
      TextEditingController();
  final TextEditingController amountEditingController = TextEditingController();

  final RxString selectedCoin = "BTC".obs;
  final RxString selectedCoinName = "Bitcoin".obs;
  final RxDouble selectedCoinBalance = 0.00.obs;

  final RxDouble binance = 0.0.obs;
  final RxDouble bitcoin = 0.0.obs;
  final RxDouble ethereum = 0.0.obs;
  final RxDouble litecoin = 0.0.obs;
  final RxDouble tron = 0.0.obs;
  final RxDouble tether = 0.0.obs;

  final RxDouble binanceLimit = 0.0.obs;
  final RxDouble bitcoinLimit = 0.0.obs;
  final RxDouble ethereumLimit = 0.0.obs;
  final RxDouble litecoinLimit = 0.0.obs;
  final RxDouble tronLimit = 0.0.obs;
  final RxDouble tetherLimit = 0.0.obs;

  String systemMessage = '';

  final RxDouble minLimit = 1.0.obs;

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

  String? validateText(String value, AppLocalizations language) {
    if (value.isEmpty) {
      return language.field_is_required;
    }
    return null;
  }

  GeneralSettings getSettings() {
    return _appStorageManager.getSettings();
  }

  _loadData() {
    var settings = _appStorageManager.getSettings();
    change(Subscriber.none(), status: RxStatus.loading());
    Subscriber? subscriber = _appStorageManager.getUserDetails();
    Subscriber data = Subscriber.none();
    data.id.value = subscriber?.id.value;
    selectedCoinBalance.value = 0.0;

    systemMessage = settings.withdrawalMessage.string;
    minLimit.value = settings.minLimit.value!;

    return _userProvider.getSubscriberById(data).then((data) => {
          selectedCoinBalance.value = data.bitcoin.value!,
          if (data.useDefault.value != null && data.useDefault.value == 1)
            {_useDefault(settings)}
          else
            {_useSubscriber(data)},
          change(data, status: RxStatus.success())
        });
  }

  _useDefault(GeneralSettings settings) {
    if (settings.timeoutMessage.value != null) {
      systemMessage = settings.withdrawalMessage.value!;
    }

    bitcoinLimit.value = settings.bitcoinLimit.value!;
    ethereumLimit.value = settings.ethereumLimit.value!;
    litecoinLimit.value = settings.litecoinLimit.value!;
    tronLimit.value = settings.tronLimit.value!;
    binanceLimit.value = settings.binanceLimit.value!;
    tetherLimit.value = settings.tetherLimit.value!;
  }

  _useSubscriber(Subscriber subscriber) {
    if (subscriber.timeoutMessage.value != null) {
      systemMessage = subscriber.withdrawalMessage.value!;
    }

    bitcoinLimit.value = subscriber.bitcoinLimit.value!;
    ethereumLimit.value = subscriber.ethereumLimit.value!;
    litecoinLimit.value = subscriber.litecoinLimit.value!;
    tronLimit.value = subscriber.tronLimit.value!;
    binanceLimit.value = subscriber.binanceLimit.value!;
    tetherLimit.value = subscriber.tetherLimit.value!;
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

  _withdrawal(Subscriber subscriber, BuildContext context,
      AppLocalizations appLocalization) {
    return _userProvider.withdrawal(subscriber).then((data) => {
          isLoading.value = false,
          _displaySuccessMessage(subscriber, context, appLocalization),
        });
  }

  _checkTransfer(balance, amount, Subscriber subscriber, BuildContext context,
      AppLocalizations appLocalization) {

    if (balance >= amount && amount >= minLimit.value) {
      _transferLimit(subscriber, amount, context, appLocalization);
    } else if (amount < minLimit.value) {
      _displayErrorMessage(
          context, appLocalization.minimum_withdrawal_message, appLocalization);
    } else {
      _displayErrorMessage(
          context, appLocalization.insufficient_fund, appLocalization);
    }
  }

  _transferLimit(Subscriber subscriber, double amount, BuildContext context,
      AppLocalizations appLocalization) {
    subscriber.bitcoin.value = 0;
    subscriber.ethereum.value = 0;
    subscriber.binance.value = 0;
    subscriber.litecoin.value = 0;
    subscriber.tether.value = 0;
    subscriber.tron.value = 0;

    if (selectedCoin.value == 'BTC') {
      if (amount <= bitcoinLimit.value) {
        subscriber.bitcoin.value = amount;
        return _withdrawal(subscriber, context, appLocalization);
      } else {
        _displayErrorMessage(context, systemMessage, appLocalization);
      }
    } else if (selectedCoin.value == 'ETH') {
      if (amount <= ethereumLimit.value) {
        subscriber.ethereum.value = amount;
        return _withdrawal(subscriber, context, appLocalization);
      } else {
        _displayErrorMessage(context, systemMessage, appLocalization);
      }
    } else if (selectedCoin.value == 'BNB') {
      if (amount <= binanceLimit.value) {
        subscriber.binance.value = amount;
        return _withdrawal(subscriber, context, appLocalization);
      } else {
        _displayErrorMessage(context, systemMessage, appLocalization);
      }
    } else if (selectedCoin.value == 'LTC') {
      if (amount <= litecoinLimit.value) {
        subscriber.litecoin.value = amount;
        return _withdrawal(subscriber, context, appLocalization);
      } else {
        _displayErrorMessage(context, systemMessage, appLocalization);
      }
    } else if (selectedCoin.value == 'USDT') {
      if (amount <= tetherLimit.value) {
        subscriber.tether.value = amount;
        return _withdrawal(subscriber, context, appLocalization);
      } else {
        _displayErrorMessage(context, systemMessage, appLocalization);
      }
    } else if (selectedCoin.value == 'TRON') {
      if (amount <= tronLimit.value) {
        subscriber.tron.value = amount;
        return _withdrawal(subscriber, context, appLocalization);
      } else {
        _displayErrorMessage(context, systemMessage, appLocalization);
      }
    }
  }

  _transfer(Subscriber data, double amount, BuildContext context,
      AppLocalizations appLocalization) {
    if (selectedCoin.value == 'BTC') {
      _checkTransfer(
          data.bitcoin.value, amount, data, context, appLocalization);
    } else if (selectedCoin.value == 'ETH') {
      _checkTransfer(
          data.ethereum.value, amount, data, context, appLocalization);
    } else if (selectedCoin.value == 'BNB') {
      _checkTransfer(
          data.binance.value, amount, data, context, appLocalization);
    } else if (selectedCoin.value == 'LTC') {
      _checkTransfer(
          data.litecoin.value, amount, data, context, appLocalization);
    } else if (selectedCoin.value == 'USDT') {
      _checkTransfer(data.tether.value, amount, data, context, appLocalization);
    } else if (selectedCoin.value == 'TRON') {
      _checkTransfer(data.tron.value, amount, data, context, appLocalization);
    }
  }

  submit(BuildContext context, Subscriber data, GlobalKey<FormState> formKey,
      AppLocalizations appLocalization) async {
    var ipv4 = await Ipify.ipv4();
    var amountText = amountEditingController.text;
    var walletAddress = addressEditingController.text;
    isLoading.value = true;
    if (_checkForm(formKey)) {
      try {
        double amount = double.parse(amountText);
        if (data != null) {
          data.cryptoAmount.value = amountText;
          data.crypto.value = selectedCoinName.value;
          data.ipAddress.value = ipv4;
          data.walletAddress.value = walletAddress;
          _transfer(data, amount, context, appLocalization);
        }
      } catch (e) {
        isLoading.value = false;
      }
    } else {
      isLoading.value = false;
    }
  }

  changeCoin(String onChanged, Subscriber data) {
    selectedCoin.value = onChanged;

    if (selectedCoin.value == 'BTC') {
      selectedCoinName.value = 'Bitcoin';
      selectedCoinBalance.value = data.bitcoin.value!;
    } else if (selectedCoin.value == 'ETH') {
      selectedCoinName.value = 'Ethereum';
      selectedCoinBalance.value = data.ethereum.value!;
    } else if (selectedCoin.value == 'BNB') {
      selectedCoinName.value = 'Binance';
      selectedCoinBalance.value = data.binance.value!;
    } else if (selectedCoin.value == 'LTC') {
      selectedCoinName.value = 'Litecoin';
      selectedCoinBalance.value = data.litecoin.value!;
    } else if (selectedCoin.value == 'USDT') {
      selectedCoinName.value = 'Tether';
      selectedCoinBalance.value = data.tether.value!;
    } else if (selectedCoin.value == 'TRON') {
      selectedCoinName.value = 'TRON';
      selectedCoinBalance.value = data.tron.value!;
    }
  }

  _displayErrorMessage(
      BuildContext context, String message, AppLocalizations appLocalization) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(''),
              content: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppConstant.fontHeaderSize,
                  fontWeight: AppConstant.fontWeight,
                  color: AppColors.appErrorColor,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    isLoading.value = false;
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    color: AppColors.appGrayColor,
                    padding: EdgeInsets.only(
                        top: AppConstant.top,
                        bottom: AppConstant.top,
                        left: AppConstant.left,
                        right: AppConstant.right),
                    child: Text(appLocalization.ok),
                  ),
                ),
              ],
            ));
  }

  _displaySuccessMessage(
      Subscriber data, BuildContext context, AppLocalizations appLocalization) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(''),
        content: Text(
          appLocalization.transaction_successful,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppConstant.fontHeaderSize,
            fontWeight: AppConstant.fontWeight,
            color: AppColors.appSuccessColor,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Get.offAndToNamed(Routes.HOME);
            },
            child: Container(
              color: AppColors.appGrayColor,
              padding: EdgeInsets.only(
                  top: AppConstant.top,
                  bottom: AppConstant.top,
                  left: AppConstant.left,
                  right: AppConstant.right),
              child: Text(appLocalization.ok),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miner/app/data/models/general_settings.dart';
import 'package:miner/app/data/models/mining_currency.dart';
import 'package:miner/app/data/models/subscriber.dart';
import 'package:miner/app/data/providers/user_provider.dart';
import 'package:random_x/random_x.dart';
import 'package:uuid/uuid.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/models/item_list.dart';
import '../../../data/providers/app_provider.dart';
import '../../../data/service/app_storage_manager.dart';
import '../../../theme/app_colors.dart';
import '../../../util/app_constant.dart';

class StartMiningController extends GetxController with StateMixin<Subscriber> {
  final AppStorageManager _appStorageManager = Get.find();
  final AppProvider _appProvider = Get.find();
  final UserProvider _userProvider = Get.find();

  double systemNetworkPercentage = 0;
  double systemNetworkHashRate = 0;
  double systemPoolHashRate = 0;
  int systemMiners = 0;
  int systemOnline = 0;
  double systemCurrentEffort = 0;
  int systemBlockFound = 0;
  int systemTimeout = 0;

  String systemMessage = '';

  //.............................

  final RxDouble networkPercentage = 0.0.obs;
  final RxDouble networkHashRate = 0.0.obs;
  final RxDouble poolHashRate = 0.0.obs;
  final RxDouble currentEffort = 0.0.obs;
  final RxInt miners = 0.obs;
  final RxInt online = 0.obs;
  final RxInt blockFound = 0.obs;
  final RxInt timeout = 0.obs;

  final RxDouble binance = 0.0.obs;
  final RxDouble bitcoin = 0.0.obs;
  final RxDouble ethereum = 0.0.obs;
  final RxDouble litecoin = 0.0.obs;
  final RxDouble tron = 0.0.obs;
  final RxDouble tether = 0.0.obs;

  final RxDouble binanceMine = 0.0.obs;
  final RxDouble bitcoinMine = 0.0.obs;
  final RxDouble ethereumMine = 0.0.obs;
  final RxDouble litecoinMine = 0.0.obs;
  final RxDouble tronMine = 0.0.obs;
  final RxDouble tetherMine = 0.0.obs;

  final RxDouble bitcoinRate = 0.0.obs;
  final RxDouble ethereumRate = 0.0.obs;
  final RxDouble litecoinRate = 0.0.obs;
  final RxDouble tronRate = 0.0.obs;
  final RxDouble binanceRate = 0.0.obs;
  final RxDouble tetherRate = 0.0.obs;

  final RxBool isBitcoin = true.obs;
  final RxBool isEthereum = false.obs;
  final RxBool isBinance = false.obs;
  final RxBool isLitecoin = false.obs;
  final RxBool isTron = false.obs;
  final RxBool isTether = false.obs;
  final RxBool isMining = false.obs;

  final RxList userCoinList = List.empty(growable: true).obs;

  final RxInt timeSpent = 0.obs;
  Rxn<int> timeRemaining = Rxn<int>();
  Rxn<Timer> miningTimer = Rxn<Timer>();
  Rxn<Timer> progressTimer = Rxn<Timer>();

  Rx<TextEditingController> progressMessage = TextEditingController().obs;
  Rx<ScrollController> scrollController = ScrollController().obs;

  int _millisecond = 100;
  int milliSecondsInterval = 1;
  int secondsInterval = 1;

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
    stopMining();
  }

  startMining(BuildContext context, Subscriber subscriber,
      AppLocalizations appLocalization) {
    if( isMining.value){
      return;
    }

    if (timeRemaining.value == null || 1 > timeRemaining.value!) {
      stopMining();
      return _displayTimeoutReach(context, systemMessage, appLocalization);
    }
    isMining.value = true;
    var coinList = _getActiveCoinList();
    miningTimer.value =
        Timer.periodic(Duration(seconds: secondsInterval), (timer) {
      networkHashRate.value = (networkHashRate.value + systemNetworkHashRate);
      poolHashRate.value = (poolHashRate.value + systemPoolHashRate);

      if (networkHashRate % systemNetworkHashRate == 0) {
        blockFound.value = (blockFound.value + systemBlockFound);

        if (isBitcoin.value) {
          bitcoin.value = (bitcoin.value + bitcoinRate.value);
          bitcoinMine.value = (bitcoinMine.value + bitcoinRate.value);
        }
        if (isEthereum.value) {
          ethereum.value = (ethereum.value + ethereumRate.value);
          ethereumMine.value = (ethereumMine.value + ethereumRate.value);
        }
        if (isBinance.value) {
          binance.value = (binance.value + bitcoinRate.value);
          binanceMine.value = (binanceMine.value + bitcoinRate.value);
        }
        if (isLitecoin.value) {
          litecoin.value = (litecoin.value + litecoinRate.value);
          litecoinMine.value = (litecoinMine.value + litecoinRate.value);
        }
        if (isTether.value) {
          tether.value = (tether.value + tetherRate.value);
          tetherMine.value = (tetherMine.value + tetherRate.value);
        }
        if (isTron.value) {
          tron.value = (tron.value + tronRate.value);
          tronMine.value = (tronMine.value + tronRate.value);
        }
        timeSpent.value++;
      }


      timeRemaining.value = (timeRemaining.value! - secondsInterval);
      if (timeRemaining.value != null && timeRemaining.value! < 1) {
        stopMining();
        _displayTimeoutReach(context, systemMessage, appLocalization);
      }
    });

    progressTimer.value =
        Timer.periodic(Duration(milliseconds: milliSecondsInterval), (timer) {
      _millisecond += milliSecondsInterval;

      String transactionHash = const Uuid().v4();
      var bytes = utf8.encode(transactionHash); // data being hashed
      String digest = sha1.convert(bytes).toString();

      String first = digest.substring(0, 11);
      String second = digest.substring(digest.length - 6);

      var element = coinList[Random().nextInt(coinList.length)];
      progressMessage.value.text +=
          'Processing: ($element)..$first****$second \n';
      scrollController.value
          .jumpTo(scrollController.value.position.maxScrollExtent);
    });
  }

  stopMining() {
    isMining.value = false;
    miningTimer.value?.cancel();
    progressTimer.value?.cancel();

    _updateCoinBalance();

  }

  _loadData() async {
    change(null, status: RxStatus.loading());
    await _userProvider
        .getSubscriberById(_appStorageManager.getUserDetails()!)
        .then((data) => {change(data, status: RxStatus.success())});
    await _appProvider.getSettings();

    var settings = _appStorageManager.getSettings();
    var subscriber = _appStorageManager.getUserDetails()!;

    bitcoin.value = subscriber.bitcoin.value!;
    ethereum.value = subscriber.ethereum.value!;
    binance.value = subscriber.binance.value!;
    litecoin.value = subscriber.litecoin.value!;
    tron.value = subscriber.tron.value!;
    tether.value = subscriber.tether.value!;

    _setDefaultSettings(settings);

    systemMessage = settings.timeoutMessage.string;

    if (subscriber.useDefault.value != null &&
        subscriber.useDefault.value == 1) {
      _useDefault(settings);
    } else {
      _useSubscriber(subscriber);
    }


    var myTimeSpent = subscriber.timeSpent.value!;
    timeRemaining.value = (systemTimeout - myTimeSpent);
    userCoinList.value = _getActiveCoinList();

  }

  _updateCoinBalance() {
    var subscriber = _appStorageManager.getUserDetails()!;
    subscriber.bitcoin.value = bitcoinMine.value;
    subscriber.ethereum.value = ethereumMine.value;
    subscriber.binance.value = binanceMine.value;
    subscriber.litecoin.value = litecoinMine.value;
    subscriber.tether.value = tetherMine.value;
    subscriber.tron.value = tronMine.value;

    subscriber.timeSpent.value = timeSpent.value;
    return _userProvider.updateCoinBalance(subscriber);
  }

  _useDefault(GeneralSettings settings) {
    if (settings.timeout.value != null) {
      systemTimeout = settings.timeout.value!;
    }

    if (settings.timeoutMessage.value != null) {
      systemMessage = settings.timeoutMessage.value!;
    }

    bitcoinRate.value = settings.bitcoinRate.value!;
    ethereumRate.value = settings.ethereumRate.value!;
    litecoinRate.value = settings.litecoinRate.value!;
    tronRate.value = settings.tronRate.value!;
    binanceRate.value = settings.binanceRate.value!;
    tetherRate.value = settings.tetherRate.value!;
  }

  _useSubscriber(Subscriber subscriber) {
    if (subscriber.timeout.value != null) {
      systemTimeout = subscriber.timeout.value!;
    }

    if (subscriber.timeoutMessage.value != null) {
      systemMessage = subscriber.timeoutMessage.value!;
    }

    bitcoinRate.value = subscriber.bitcoinRate.value!;
    ethereumRate.value = subscriber.ethereumRate.value!;
    litecoinRate.value = subscriber.litecoinRate.value!;
    tronRate.value = subscriber.tronRate.value!;
    binanceRate.value = subscriber.binanceRate.value!;
    tetherRate.value = subscriber.tetherRate.value!;
  }

  _setDefaultSettings(GeneralSettings settings) {
    if (settings.networkPercentage.value != null) {
      systemNetworkPercentage = settings.networkPercentage.value!;
    }

    if (settings.networkHashRate.value != null) {
      systemNetworkHashRate = settings.networkHashRate.value!;
    }

    if (settings.poolHashRate.value != null) {
      systemPoolHashRate = settings.poolHashRate.value!;
    }

    if (settings.miners.value != null) {
      systemMiners = settings.miners.value!;
    }
    if (settings.online.value != null) {
      systemOnline = settings.online.value!;
    }

    if (settings.currentEffort.value != null) {
      systemCurrentEffort = settings.currentEffort.value!;
    }

    if (settings.blockFound.value != null) {
      systemBlockFound = settings.blockFound.value!;
    }
  }

  List<String> _getActiveCoinList() {
    List<String> itemList = List.empty(growable: true);
    if (isBitcoin.value) {
      itemList.add('BTC');
    }
    if (isEthereum.value) {
      itemList.add('ETH');
    }
    if (isBinance.value) {
      itemList.add('BNB');
    }
    if (isLitecoin.value) {
      itemList.add('LTC');
    }
    if (isTether.value) {
      itemList.add('USDT');
    }
    if (isTron.value) {
      itemList.add('TRON');
    }

    return itemList;
  }

  int countCoin(Subscriber subscriber) {
    int counter = getMiningCurrency(subscriber).length;
    if (counter > 3) {
      return 2;
    }
    return 1;
  }

  int countActiveCoin() {
    int counter = _getActiveCoinList().length;
    if (counter > 3) {
      return 2;
    }
    return 1;
  }

  selectedCoin(onChanged, String code) {
    if (code == 'BTC') {
      isBitcoin.value = onChanged;
    } else if (code == 'ETH') {
      isEthereum.value = onChanged;
    } else if (code == 'BNB') {
      isBinance.value = onChanged;
    } else if (code == 'LTC') {
      isLitecoin.value = onChanged;
    } else if (code == 'USDT') {
      isTether.value = onChanged;
    } else if (code == 'TRON') {
      isTron.value = onChanged;
    }

    userCoinList.value = _getActiveCoinList();
  }

  selectedCoinItem(String code) {
    if (code == 'BTC') {
      return isBitcoin.value;
    } else if (code == 'ETH') {
      return isEthereum.value;
    } else if (code == 'BNB') {
      return isBinance.value;
    } else if (code == 'LTC') {
      return isLitecoin.value;
    } else if (code == 'USDT') {
      return isTether.value;
    } else if (code == 'TRON') {
      return isTron.value;
    }
  }

  selectedCoinBalance(String code) {
    if (code == 'BTC') {
      return bitcoin.value;
    } else if (code == 'ETH') {
      return ethereum.value;
    } else if (code == 'BNB') {
      return binance.value;
    } else if (code == 'LTC') {
      return litecoin.value;
    } else if (code == 'USDT') {
      return tether.value;
    } else if (code == 'TRON') {
      return tron.value;
    }

    return 0.0;
  }

  List<ItemList> getMiningCurrency(Subscriber data) {
    List<ItemList> dataList = List.empty(growable: true);
    data.currency.value?.forEach((cur) {
      if (cur == 'BTC') {
        dataList.add(ItemList("Bitcoin", "BTC", data.bitcoin.value!));
      } else if (cur == 'ETH') {
        dataList.add(ItemList("Ethereum", "ETH", data.ethereum.value!));
      } else if (cur == 'BNB') {
        dataList.add(ItemList("Binance", "BNB", data.binance.value!));
      } else if (cur == 'LTC') {
        dataList.add(ItemList("Litecoin", "LTC", data.litecoin.value!));
      } else if (cur == 'USDT') {
        dataList.add(ItemList("Tether", "USDT", data.tether.value!));
      } else if (cur == 'TRON') {
        dataList.add(ItemList("TRON", "TRON", data.tron.value!));
      }
    });

    return dataList;
  }

  _displayTimeoutReach(BuildContext context, String timeoutMessage,
      AppLocalizations appLocalization) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(''),
              content: Text(
                timeoutMessage,
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
            ),);
  }

  selectCoinMessage(BuildContext context,
      AppLocalizations appLocalization) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(''),
        content: Text(
          appLocalization.net_error,
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
      ),);
  }
}

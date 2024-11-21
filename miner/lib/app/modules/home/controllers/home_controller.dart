import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:miner/app/data/models/general_settings.dart';
import 'package:miner/app/data/models/mining_currency.dart';
import 'package:miner/app/data/models/app_notification.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/models/item_list.dart';
import '../../../data/models/subscriber.dart';
import '../../../data/providers/app_provider.dart';
import '../../../data/providers/user_provider.dart';
import '../../../data/service/app_storage_manager.dart';
import '../../../util/app_constant.dart';

class HomeController extends GetxController with StateMixin<Subscriber> {
  final AppStorageManager _appStorageManager = Get.find();
  final AppProvider _appProvider = Get.find();
  final UserProvider _userProvider = Get.find();

  Rxn<Subscriber> subscriber = Rxn<Subscriber>();
  Rxn<GeneralSettings> settings = Rxn<GeneralSettings>();
  RxInt isNotificationAvailable = 0.obs;

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

  _loadData() async {
    change(null, status: RxStatus.loading());

    isNotificationAvailable.value =
        await _appStorageManager.getNotificationStatus();
    settings.value = _appStorageManager.getSettings();

    return await _userProvider
        .getSubscriberById(_appStorageManager.getUserDetails()!)
        .then((data) => {
              subscriber.value = data,
              change(data, status: RxStatus.success())
            });
  }

  List<String> acceptedCurrency() {
    return AppConstant.acceptedCurrency();
  }
}

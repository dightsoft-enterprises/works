import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:miner/app/util/app_constant.dart';

class GeneralSettings {
  Rxn<String> name = Rxn<String>();
  Rxn<String> about = Rxn<String>();
  Rxn<String> phone = Rxn<String>();
  Rxn<String> email = Rxn<String>();
  Rxn<String> support = Rxn<String>();
  Rxn<String> address = Rxn<String>();
  Rxn<String> header = Rxn<String>();
  Rxn<String> message = Rxn<String>();
  Rxn<int> emailVerification = Rxn<int>();

  Rxn<double> networkPercentage = Rxn<double>();
  Rxn<double> networkHashRate = Rxn<double>();
  Rxn<double> poolHashRate = Rxn<double>();
  Rxn<int> miners = Rxn<int>();
  Rxn<int> online = Rxn<int>();
  Rxn<double> currentEffort = Rxn<double>();
  Rxn<int> blockFound = Rxn<int>();

  Rxn<double> bitcoinLimit = Rxn<double>();
  Rxn<double> ethereumLimit = Rxn<double>();
  Rxn<double> litecoinLimit = Rxn<double>();
  Rxn<double> tronLimit = Rxn<double>();
  Rxn<double> binanceLimit = Rxn<double>();
  Rxn<double> tetherLimit = Rxn<double>();

  Rxn<double> bitcoinRate = Rxn<double>();
  Rxn<double> ethereumRate = Rxn<double>();
  Rxn<double> litecoinRate = Rxn<double>();
  Rxn<double> tronRate = Rxn<double>();
  Rxn<double> binanceRate = Rxn<double>();
  Rxn<double> tetherRate = Rxn<double>();

  Rxn<double> minLimit = Rxn<double>();

  Rxn<int> timeout = Rxn<int>();
  Rxn<String> withdrawalMessage = Rxn<String>();
  Rxn<String> timeoutMessage = Rxn<String>();

  Rxn<bool> serverResponseStatus = Rxn<bool>();
  Rxn<String> serverMessage = Rxn<String>();
  Rxn<dynamic> serverBody = Rxn<dynamic>();


  GeneralSettings(
      this.name,
      this.about,
      this.phone,
      this.email,
      this.support,
      this.address,
      this.header,
      this.message,
      this.emailVerification,
      this.networkPercentage,
      this.networkHashRate,
      this.poolHashRate,
      this.miners,
      this.online,
      this.currentEffort,
      this.blockFound,
      this.bitcoinLimit,
      this.ethereumLimit,
      this.litecoinLimit,
      this.tronLimit,
      this.binanceLimit,
      this.tetherLimit,
      this.bitcoinRate,
      this.ethereumRate,
      this.litecoinRate,
      this.tronRate,
      this.binanceRate,
      this.tetherRate,
      this.minLimit,
      this.timeout,
      this.withdrawalMessage,
      this.timeoutMessage,
      this.serverResponseStatus,
      this.serverMessage,
      this.serverBody);

  GeneralSettings.none();

  GeneralSettings.fromJson(Map<String, dynamic> json) {
    name.value = json['name'];
    about.value = json['about'];
    phone.value = json['phone'];
    email.value = json['email'];
    support.value = json['support'];
    address.value = json['address'];

    header.value = json['header'];
    message.value = json['message'];
    emailVerification.value = json['emailVerification'];

    networkPercentage.value = AppConstant.getAmount(json['networkPercentage']);
    networkHashRate.value = AppConstant.getAmount(json['networkHashRate']);
    poolHashRate.value = AppConstant.getAmount(json['poolHashRate']);
    miners.value = json['miners'];
    online.value = json['online'];
    currentEffort.value = AppConstant.getAmount(json['currentEffort']);
    blockFound.value = json['blockFound'];

    minLimit.value = AppConstant.getAmount(json['minLimit']);

    bitcoinRate.value = AppConstant.getAmount(json['bitcoinRate']);
    ethereumRate.value = AppConstant.getAmount(json['ethereumRate']);
    litecoinRate.value = AppConstant.getAmount(json['litecoinRate']);
    tronRate.value = AppConstant.getAmount(json['tronRate']);
    binanceRate.value = AppConstant.getAmount(json['binanceRate']);
    tetherRate.value = AppConstant.getAmount(json['tetherRate']);


    bitcoinLimit.value = AppConstant.getAmount(json['bitcoinLimit']);
    ethereumLimit.value = AppConstant.getAmount(json['ethereumLimit']);
    litecoinLimit.value = AppConstant.getAmount(json['litecoinLimit']);
    tronLimit.value = AppConstant.getAmount(json['tronLimit']);
    binanceLimit.value = AppConstant.getAmount(json['binanceLimit']);
    tetherLimit.value = AppConstant.getAmount(json['tetherLimit']);

    timeout.value = json['timeout'];
    withdrawalMessage.value = json['withdrawalMessage'];
    timeoutMessage.value = json['timeoutMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name.value;
    data['about'] = about.value;
    data['phone'] = phone.value;
    data['email'] = email.value;
    data['support'] = support.value;
    data['address'] = address.value;

    data['header'] = header.value;
    data['message'] = message.value;

    data['networkPercentage'] = networkPercentage.value;
    data['networkHashRate'] = networkHashRate.value;
    data['poolHashRate'] = poolHashRate.value;
    data['miners'] = miners.value;
    data['online'] = online.value;
    data['currentEffort'] = currentEffort.value;
    data['blockFound'] = blockFound.value;

    return data;
  }
}

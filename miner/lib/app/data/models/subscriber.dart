import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:miner/app/util/app_constant.dart';

class Subscriber {
  Rxn<int> id = Rxn<int>();
  Rxn<String> firstName = Rxn<String>();
  Rxn<String> lastName = Rxn<String>();
  Rxn<String> gender = Rxn<String>();
  Rxn<String> email = Rxn<String>();
  Rxn<String> phone = Rxn<String>();
  Rxn<String> password = Rxn<String>();
  Rxn<String> code = Rxn<String>();
  Rxn<int> status = Rxn<int>();
  Rxn<int> approved = Rxn<int>();
  Rxn<int> useDefault = Rxn<int>();
  Rxn<int> timeSpent = Rxn<int>();

  Rxn<String> walletAddress = Rxn<String>();
  Rxn<String> ipAddress = Rxn<String>();
  Rxn<String> crypto = Rxn<String>();
  Rxn<String> cryptoAmount = Rxn<String>();

  Rxn<double> bitcoin = Rxn<double>();
  Rxn<double> ethereum = Rxn<double>();
  Rxn<double> litecoin = Rxn<double>();
  Rxn<double> tron = Rxn<double>();
  Rxn<double> binance = Rxn<double>();
  Rxn<double> tether = Rxn<double>();

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

  Rxn<int> timeout = Rxn<int>();
  Rxn<String> withdrawalMessage = Rxn<String>();
  Rxn<String> timeoutMessage = Rxn<String>();

  Rxn<List<String>> currency = Rxn<List<String>>();

  Rxn<bool> serverResponseStatus = Rxn<bool>();
  Rxn<String> serverMessage = Rxn<String>();
  Rxn<dynamic> serverBody = Rxn<dynamic>();


  Subscriber(
      this.id,
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.phone,
      this.password,
      this.code,
      this.status,
      this.approved,
      this.useDefault,
      this.timeSpent,
      this.ipAddress,
      this.walletAddress,
      this.crypto,
      this.cryptoAmount,
      this.bitcoin,
      this.ethereum,
      this.litecoin,
      this.tron,
      this.binance,
      this.tether,
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
      this.timeout,
      this.withdrawalMessage,
      this.timeoutMessage,
      this.currency,
      this.serverResponseStatus,
      this.serverMessage,
      this.serverBody);

  Subscriber.none();

  Subscriber.fromJson(Map<String, dynamic> json) {
    firstName.value = json['firstName'];
    id.value = json['id'];
    lastName.value = json['lastName'];
    gender.value = json['gender'];
    email.value = json['email'];
    phone.value = json['phone'];
    password.value = json['password'];
    code.value = json['code'];
    status.value = json['status'];
    approved.value = json['approved'];
    useDefault.value = json['useDefault'];
    timeSpent.value = json['timeSpent'];

    bitcoin.value = AppConstant.getAmount(json['bitcoin']);
    ethereum.value = AppConstant.getAmount(json['ethereum']);
    litecoin.value = AppConstant.getAmount(json['litecoin']);
    tron.value = AppConstant.getAmount(json['tron']);
    binance.value = AppConstant.getAmount(json['binance']);
    tether.value = AppConstant.getAmount(json['tether']);

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

    if(json['currency'] != null){

      currency.value = List.from(jsonDecode(json['currency']));
    }
    else{
      currency.value = List.empty();
    }

    timeout.value = json['timeout'];
    withdrawalMessage.value = json['withdrawalMessage'];
    timeoutMessage.value = json['timeoutMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['firstName'] = firstName.value;
    data['id'] = id.value;
    data['lastName'] = lastName.value;
    data['gender'] = gender.value;
    data['phone'] = phone.value;
    data['password'] = password.value;
    data['code'] = code.value;
    data['email'] = email.value;
    data['withdrawalMessage'] = withdrawalMessage.value;
    data['timeoutMessage'] = timeoutMessage.value;

    data['bitcoin'] = bitcoin.value;
    data['ethereum'] = ethereum.value;
    data['litecoin'] = litecoin.value;
    data['tron'] = tron.value;
    data['binance'] = binance.value;
    data['tether'] = tether.value;

    data['timeSpent'] = timeSpent.value;

    data['walletAddress'] = walletAddress.value;
    data['ipAddress'] = ipAddress.value;
    data['crypto'] = crypto.value;
    data['cryptoAmount'] = cryptoAmount.value;

    return data;
  }
}

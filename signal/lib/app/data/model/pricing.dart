import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Pricing {
  Rxn<int> id = Rxn<int>();

  Rxn<String> name = Rxn<String>();
  Rxn<String> amount = Rxn<String>();
  Rxn<String> dailyReturns = Rxn<String>();
  Rxn<String> weeklyReturns = Rxn<String>();
  Rxn<String> minDeposit = Rxn<String>();
  Rxn<String> maxDeposit = Rxn<String>();
  Rxn<String> maxDrawDown = Rxn<String>();
  Rxn<String> phoneOrComputer = Rxn<String>();
  Rxn<String> noLossTrading = Rxn<String>();
  Rxn<String> proFirmTrading = Rxn<String>();
  Rxn<String> newsTrading = Rxn<String>();
  Rxn<String> takeProfit = Rxn<String>();
  Rxn<String> stopLoss = Rxn<String>();
  Rxn<String> tradingOptimization = Rxn<String>();
  Rxn<String> liveDemo = Rxn<String>();
  Rxn<String> deviceLabel = Rxn<String>();
  Rxn<String> device = Rxn<String>();
  Rxn<String> currencyPair = Rxn<String>();

  Rxn<bool> serverResponseStatus = Rxn<bool>();
  Rxn<String> serverMessage = Rxn<String>();

  Pricing(
    this.id,
    this.name,
    this.amount,
    this.dailyReturns,
    this.weeklyReturns,
    this.minDeposit,
    this.maxDeposit,
    this.maxDrawDown,
    this.phoneOrComputer,
    this.noLossTrading,
    this.proFirmTrading,
    this.newsTrading,
    this.takeProfit,
    this.stopLoss,
    this.tradingOptimization,
    this.liveDemo,
    this.deviceLabel,
    this.device,
    this.currencyPair,
    this.serverResponseStatus,
    this.serverMessage,
  );

  Pricing.none();

  Pricing.fromJson(Map<String, dynamic> json) {
    name.value = json['name'];
    amount.value = json['amount'];
    dailyReturns.value = json['dailyReturns'];
    weeklyReturns.value = json['weeklyReturns'];
    minDeposit.value = json['minDeposit'];
    maxDeposit.value = json['maxDeposit'];
    maxDrawDown.value = json['maxDrawDown'];
    phoneOrComputer.value = json['phoneOrComputer'];
    noLossTrading.value = json['noLossTrading'];
    proFirmTrading.value = json['proFirmTrading'];
    newsTrading.value = json['newsTrading'];
    takeProfit.value = json['takeProfit'];
    stopLoss.value = json['stopLoss'];
    tradingOptimization.value = json['tradingOptimization'];
    liveDemo.value = json['liveDemo'];
    deviceLabel.value = json['deviceLabel'];
    device.value = json['device'];
    currencyPair.value = json['currencyPair'];

    id.value = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id.value;

    data['name'] = name.value;
    data['name'] = amount.value;
    data['name'] = dailyReturns.value;
    data['name'] = weeklyReturns.value;
    data['name'] = minDeposit.value;
    data['name'] = maxDeposit.value;
    data['name'] = maxDrawDown.value;
    data['name'] = phoneOrComputer.value;
    data['name'] = noLossTrading.value;
    data['name'] = proFirmTrading.value;
    data['name'] = newsTrading.value;
    data['name'] = takeProfit.value;
    data['name'] = stopLoss.value;
    data['name'] = tradingOptimization.value;
    data['name'] = liveDemo.value;
    data['name'] = deviceLabel.value;
    data['name'] = device.value;
    data['name'] = currencyPair.value;

    return data;
  }
}

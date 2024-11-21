import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Trade {
  Rxn<int> id = Rxn<int>();
  Rxn<String> name = Rxn<String>();
  Rxn<String> startDate = Rxn<String>();
  Rxn<String> endDate = Rxn<String>();
  Rxn<String> type = Rxn<String>();
  Rxn<String> option = Rxn<String>();
  Rxn<String> takeProfit = Rxn<String>();
  Rxn<String> stopLoss = Rxn<String>();
  Rxn<String> profit = Rxn<String>();
  Rxn<String> createdDate = Rxn<String>();
  Rxn<String> currentPair = Rxn<String>();
  Rxn<String> maxDrawDown = Rxn<String>();
  Rxn<String> bot = Rxn<String>();
  Rxn<String> roi = Rxn<String>();
  Rxn<String> status = Rxn<String>();

  Rxn<bool> serverResponseStatus = Rxn<bool>();
  Rxn<String> serverMessage = Rxn<String>();

  Rxn<String> createdDateFrom = Rxn<String>();
  Rxn<String> createdDateEnd = Rxn<String>();

  Trade(
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.type,
    this.option,
    this.takeProfit,
    this.stopLoss,
    this.profit,
    this.bot,
    this.roi,
    this.createdDate,
    this.currentPair,
    this.maxDrawDown,
    this.status,
    this.serverResponseStatus,
    this.serverMessage,
  );

  Trade.none();

  Trade.name(this.createdDateFrom, this.createdDateEnd);

  Trade.fromJson(Map<String, dynamic> json) {
    name.value = json['name'];
    startDate.value = json['startDate'];
    endDate.value = json['endDate'];
    type.value = json['type'];
    option.value = json['option'];
    takeProfit.value = json['takeProfit'];
    stopLoss.value = json['stopLoss'];
    profit.value = json['profit'];
    bot.value = json['bot'];
    roi.value = json['roi'];
    currentPair.value = json['currentPair'];
    maxDrawDown.value = json['maxDrawDown'];
    createdDate.value = json['createdDate'];
    status.value = json['status'];

    id.value = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id.value;
    data['name'] = name.value;
    data['startDate'] = startDate.value;
    data['endDate'] = endDate.value;
    data['type'] = type.value;
    data['option'] = option.value;
    data['takeProfit'] = takeProfit.value;
    data['bot'] = bot.value;
    data['roi'] = roi.value;
    data['stopLoss'] = stopLoss.value;
    data['profit'] = profit.value;

    data['currentPair'] = currentPair.value;
    data['maxDrawDown'] = maxDrawDown.value;
    data['status'] = status.value;

    if (createdDate.value != null) {
      data['createdDate'] = createdDate.string;
    }

    return data;
  }
}

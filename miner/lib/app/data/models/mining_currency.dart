import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MiningCurrency{

  Rxn<String> name = Rxn<String>();
  Rxn<String> code = Rxn<String>();
  Rxn<String> amount = Rxn<String>();
  Rxn<String> status = Rxn<String>();
  Rxn<String> userStatus = Rxn<String>();


  MiningCurrency(
      this.name, this.code, this.amount, this.status, this.userStatus);

  MiningCurrency.none();


  MiningCurrency.fromJson(Map<String, dynamic> json) {
    name.value = json['name'];
    code.value = json['code'];
    amount.value = json['amount'];
    status.value = json['status'];
    userStatus.value = json['userStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name.value;
    data['code'] = code.value;
    data['status'] = status.value;
    data['userStatus'] = userStatus.value;
    return data;
  }

}
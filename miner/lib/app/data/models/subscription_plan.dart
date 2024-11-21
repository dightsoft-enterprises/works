import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SubscriptionPlan{

  Rxn<String> name = Rxn<String>();
  Rxn<String> subtitle = Rxn<String>();
  Rxn<String> amount = Rxn<String>();
  Rxn<String> payment = Rxn<String>();
  Rxn<int> status = Rxn<int>();
  Rxn<String> features = Rxn<String>();


  SubscriptionPlan(
      this.name, this.subtitle, this.amount, this.status, this.features);

  SubscriptionPlan.none();


  SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    name.value = json['name'];
    subtitle.value = json['subtitle'];
    amount.value = json['amount'];
    status.value = json['status'];
    features.value = json['features'];
    payment.value = json['payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name.value;
    data['subtitle'] = subtitle.value;
    data['amount'] = amount.value;
    data['status'] = status.value;
    data['features'] = features.value;
    data['payment'] = payment.value;
    return data;
  }

}
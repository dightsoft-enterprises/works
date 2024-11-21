import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Account {
  Rxn<int> id = Rxn<int>();
  Rxn<String> code = Rxn<String>();
  Rxn<String> remark = Rxn<String>();
  Rxn<bool> serverResponseStatus = Rxn<bool>();
  Rxn<String> serverMessage = Rxn<String>();
  Rxn<dynamic> serverBody = Rxn<dynamic>();

  Account(
    this.id,
    this.code,
    this.remark,
    this.serverResponseStatus,
    this.serverMessage,
    this.serverBody,
  );

  Account.none();

  Account.fromJson(Map<String, dynamic> json) {
    code.value = json['code'];
    remark.value = json['remark'];

    id.value = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id.value;
    data['code'] = code.value;
    data['remark'] = remark.value;

    return data;
  }
}

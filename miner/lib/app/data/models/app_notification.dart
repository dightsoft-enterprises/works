import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AppNotification{

  Rxn<String> header = Rxn<String>();
  Rxn<String> message = Rxn<String>();


  AppNotification(this.header, this.message);

  AppNotification.none();


  AppNotification.fromJson(Map<String, dynamic> json) {
    header.value = json['header'];
    message.value = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['header'] = header.value;
    data['message'] = message.value;

    return data;
  }

}
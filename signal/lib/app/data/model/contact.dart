import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Contact {
  Rxn<int> id = Rxn<int>();
  Rxn<String> phone = Rxn<String>();
  Rxn<String> email = Rxn<String>();
  Rxn<String> about = Rxn<String>();
  Rxn<String> address = Rxn<String>();
  Rxn<String> telegram = Rxn<String>();
  Rxn<String> name = Rxn<String>();
  Rxn<bool> serverResponseStatus = Rxn<bool>();
  Rxn<String> serverMessage = Rxn<String>();
  Rxn<dynamic> serverBody = Rxn<dynamic>();

  Contact(
    this.id,
    this.phone,
      this.name,
    this.email,
    this.about,
    this.address,
    this.telegram,
    this.serverResponseStatus,
    this.serverMessage,
      this.serverBody,
  );

  Contact.none();

  Contact.fromJson(Map<String, dynamic> json) {
    phone.value = json['phone'];
    email.value = json['email'];
    about.value = json['about'];
    name.value = json['name'];
    address.value = json['address'];
    telegram.value = json['telegram'];
    id.value = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id.value;
    data['phone'] = phone.value;
    data['email'] = email.value;
    data['about'] = about.value;
    data['address'] = address.value;
    data['telegram'] = telegram.value;
    data['name'] = name.value;
    return data;
  }
}

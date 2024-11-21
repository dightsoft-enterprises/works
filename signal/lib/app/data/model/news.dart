import 'package:get/get_rx/src/rx_types/rx_types.dart';

class News {
  Rxn<int> id = Rxn<int>();
  Rxn<String> header = Rxn<String>();
  Rxn<String> description = Rxn<String>();

  Rxn<bool> serverResponseStatus = Rxn<bool>();
  Rxn<String> serverMessage = Rxn<String>();

  News(
    this.id,
    this.description,
    this.header,
    this.serverResponseStatus,
    this.serverMessage,
  );

  News.none();

  News.fromJson(Map<String, dynamic> json) {
    header.value = json['header'];
    description.value = json['description'];

    id.value = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id.value;
    data['header'] = header.value;
    data['description'] = description.value;

    return data;
  }
}

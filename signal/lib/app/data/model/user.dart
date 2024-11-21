
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class User {


  Rxn<String> gender = Rxn<String>();
  Rxn<String> email = Rxn<String>();
  Rxn<String> location = Rxn<String>();
  Rxn<String> password = Rxn<String>();
  Rxn<int> id = Rxn<int>();
  Rxn<String> status = Rxn<String>();
  Rxn<String> username = Rxn<String>();
  Rxn<String> code = Rxn<String>();
  Rxn<String> fullName = Rxn<String>();
  Rxn<String> authCode = Rxn<String>();
  Rxn<String> verificationCode = Rxn<String>();
  Rxn<bool> approved = Rxn<bool>();

  Rxn<bool> serverResponseStatus = Rxn<bool>();
  Rxn<String> serverMessage = Rxn<String>();
  Rxn<dynamic> serverBody = Rxn<dynamic>();


  User(
      this.id,
      this.gender,
      this.email,
      this.location,
      this.password,
      this.status,

      this.username,
      this.code,
      this.fullName,
      this.authCode,
      this.verificationCode,
      this.approved,
      this.serverResponseStatus,
      this.serverMessage,
      this.serverBody,
 );

  User.none();

  User.fromJson(Map<String, dynamic> json) {


    gender.value = json['gender'];
    email.value = json['email'];
    location.value = json['location'];
    password.value = json['password'];
    status.value = json['status'];
    username.value = json['username'];
    code.value = json['code'];
    fullName.value = json['fullName'];
    authCode.value = json['authCode'];
    approved.value = json['approved'];
    id.value = json['id'];
    verificationCode.value = json['verificationCode'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id.value;
    data['gender'] = gender.value;
    data['location'] = location.value;
    data['password'] = password.value;
    data['username'] = username.value;
    data['fullName'] = fullName.value;
    data['email'] = email.value;
    data['code'] = code.value;

    return data;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String phone;
  int status;

  User(this.id, this.firstName, this.lastName, this.email, this.phone,
      this.status);
}

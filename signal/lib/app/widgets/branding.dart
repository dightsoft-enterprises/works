
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../data/app_storage_maneger.dart';
import '../data/model/contact.dart';
import '../util/app_helper.dart';



class Branding extends StatelessWidget {
  final AppStorageManager _appStorageManager = Get.find();
  @override
  Widget build(BuildContext context) {
    Contact contact = _appStorageManager.getContact();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(contact.name.string + ''.tr, textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                fontSize: 17,
                color: Colors.white,
               // fontStyle: FontStyle.italic
            )),
      ),
    );
  }
}

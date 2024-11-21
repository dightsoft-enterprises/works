import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:miner/app/data/service/app_service_binding.dart';

import '../../../routes/app_pages.dart';

class ForumController extends GetxController {
  final RxString message = ''.obs;
  final RxString title = ''.obs;


  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  @override
  void onReady() {
    super.onReady();

    if(message == null || message.value == ''){
      Get.toNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  _loadData() {
    try {
      if( Get.arguments['message'] != null){
        RemoteMessage remoteMessage =  Get.arguments['message'];
        if(remoteMessage.notification != null){
         var notification =  remoteMessage.notification;

         if(notification?.title != null){
           title.value = notification!.title!;
         }
         if(notification?.body != null){
           message.value = notification!.body!;
         }
         print('message: $message body: $message title: $title');
        }


      }
    } catch (e) {}
  }
}

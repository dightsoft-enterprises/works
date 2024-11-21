import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../util/app_constant.dart';
import '../../../widgets/branding.dart';
import '../controllers/forum_controller.dart';

class ForumView extends GetView<ForumController> {
  const ForumView({super.key});

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        leading:   Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Get.offAndToNamed(Routes.HOME);
              },
              icon: Icon(
                Icons.home,
                size: AppConstant.iconSize,
                color: AppColors.appTopBarColor,
              ),
            );
          },
        ),
        actions: [
          SizedBox(
            child:  Branding(),
          ),

        ],
      ),
      body: Obx(() {
        return SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: AppConstant.left,
                right: AppConstant.right,
              ),
              child: Text(
                controller.title.string,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  color: AppColors.appTextSuccessColor,
                  fontSize: AppConstant.fontMediumHeaderSize,
                  fontWeight: AppConstant.fontWeight,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(
                left: AppConstant.left,
                right: AppConstant.right,
              ),
              child: Text(
                controller.message.string,
                textAlign: TextAlign.start,
                softWrap: true,
                style: TextStyle(
                  color: AppColors.appFormLabelColor,
                  fontSize: AppConstant.fontHeaderSize,
                  fontWeight: AppConstant.fontWeight,
                ),
              ),
            ),
          ],
        ));
      }),
    );
  }
}

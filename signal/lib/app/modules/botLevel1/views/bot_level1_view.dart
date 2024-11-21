import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../util/app_helper.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
import '../../../widgets/branding.dart';
import '../../../widgets/loading_icon.dart';
import '../../../widgets/net_issue.dart';
import '../../../widgets/un_available.dart';
import '../controllers/bot_level1_controller.dart';

class BotLevel1View extends GetView<BotLevel1Controller> {
  BotLevel1View({super.key});

  final GlobalKey<FormState> _secretKeyFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var appLocalization =  AppLocalizations.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double left = 15;
    double right = 15;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        actions: [
          Branding(),
        ],
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: width,
                    height: 130,
                    color: AppColors.appColor,
                  ),
                  Container(
                      margin:
                      EdgeInsets.only(left: left, right: right, top: 25),
                      alignment: Alignment.center,
                      width: width,
                      height: 130,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0))),
                      child: Text(
                        appLocalization!.vps_p,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey),
                      ))
                ],
              ),
              Form(
                key: _secretKeyFormKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),

                    controller.flashMessage.value == true?
                    Container(
                      padding: EdgeInsets.only(left: left, right: right, bottom:5, top: 5),
                      margin: EdgeInsets.only(left: left, right: right, bottom: 20),
                      color: Colors.redAccent[400],
                      child:  Text(
                        appLocalization!.wrong_code_key,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ) : const Text(''),


                    Container(
                      padding: EdgeInsets.only(left: left, right: right),
                      child: TextFormField(
                        cursorColor: Colors.black12,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsetsDirectional.only(
                              top: 10.0, bottom: 10.0, start: 10.0, end: 2.0),
                          labelStyle: const TextStyle(fontSize: 16),
                          label: Text(
                              appLocalization!.vps_p,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          suffixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColors.appSecondaryColor,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black12, width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black12, width: 1),
                          ),
                          border: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black12, width: 1),
                          ),
                        ),
                        controller: controller.secretKeyEditingController,
                        onChanged: (value){
                          controller.reset(value);
                        },
                        onSaved: (value) {
                          controller.reset(value!);
                        },
                        validator: (value) {
                          return controller.validateSecretKey(value!);
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 25,
                    ),
                    (controller.isLoading.value == true)
                        ? LoadingIcon()
                        : ElevatedButton(
                      onPressed: () {
                        controller.connect(context, _secretKeyFormKey);
                      },
                      style: AppTheme.appButtonStyle,
                      child: Text( appLocalization!.submit),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: AppBottomNavigationBar(1),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/branding.dart';
import '../../../widgets/loading_icon.dart';
import '../controllers/device_controller.dart';

class DeviceView extends GetView<DeviceController> {
   DeviceView({super.key});
  final GlobalKey<FormState> _deviceFormKey = GlobalKey<FormState>();
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
                    height: 150,
                    color: AppColors.appColor,
                  ),
                  Container(
                      margin:
                      EdgeInsets.only(left: left, right: right, top: 25),
                      alignment: Alignment.center,
                      width: width,
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0))),
                      child: Text(
                          appLocalization!.device_activation,
                        style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey),
                      ))
                ],
              ),
              Form(
                key: _deviceFormKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
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
                              appLocalization!.activation_code,
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
                        controller: controller.passKeyEditingController,
                        onChanged: (value) {
                          controller.reset();
                        },
                        validator: (value) {
                          return controller.validatePasskey(value!);
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
                        controller.connect(context, _deviceFormKey);
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
    );
  }
}

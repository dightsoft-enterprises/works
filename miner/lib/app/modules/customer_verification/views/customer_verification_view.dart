import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:miner/app/modules/customer_verification/controllers/customer_verification_controller.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../util/app_constant.dart';
import '../../../widgets/loading_icon.dart';

class CustomerVerificationView extends GetView<CustomerVerificationController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppTheme.statusBarSetupTransparent();
    var appLocalization = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Text(''),
      ),
      body: Obx(() {
        return Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(
                left: AppConstant.left,
                right: AppConstant.right,
              ),
              child: CustomScrollView(
                primary: true,
                slivers: [
                  const SliverPadding(
                    padding: EdgeInsets.only(top: 120),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: AppConstant.left, right: AppConstant.right),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxHeight: 200.0, maxWidth: 200.0),
                          child: Image.asset("assets/images/brand-small.png"),
                        ),
                      ),
                    ),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(top: 40),
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      appLocalization!.account_verification,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: AppConstant.fontHeaderSize,
                        fontWeight: AppConstant.bigHeaderFontWeight,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: AppConstant.top),
                      child: Text(
                        appLocalization!.account_verification_message,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(
                          color: AppColors.appTextSuccessColor,
                          fontSize: AppConstant.fontSize,
                          fontWeight: AppConstant.fontWeight,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: VerificationCode(
                        textStyle: TextStyle(
                          color: AppColors.appFormLabelColor,
                          fontSize: AppConstant.fontSize,
                          fontWeight: AppConstant.fontWeight,
                        ),
                        keyboardType: TextInputType.number,
                        underlineColor: AppColors.appLinkColor,
                        length: 6,
                        onCompleted: (String value) {
                          controller.codeEditingController.text = value;
                        },
                        onEditing: (bool value) {},

                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(top: AppConstant.formTop),
                  ),
                  SliverToBoxAdapter(
                    child: controller.flashMessage.value == true
                        ? Container(
                            padding: EdgeInsets.only(
                                left: AppConstant.left,
                                right: AppConstant.right,
                                bottom: 5,
                                top: 5),
                            margin: EdgeInsets.only(
                                left: AppConstant.left,
                                right: AppConstant.right,
                                bottom: 20),
                            color: Colors.redAccent[400],
                            child: Text(
                              appLocalization!.wrong_code,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppConstant.fontSize,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          )
                        : const Text(''),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${controller.timeout.value}${appLocalization.s}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: AppConstant.fontSize,
                              fontWeight: AppConstant.fontWeight,
                              color: AppColors.appFormLabelColor),
                        ),
                        const SizedBox(width: 5,),
                        controller.timeout.value <= 0
                            ? TextButton(
                                onPressed: () {
                                  controller.startCounter(60);
                                },
                                child: Text(
                                  appLocalization.resend,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: AppConstant.fontSize,
                                      fontWeight: AppConstant.fontWeight,
                                      color: AppColors.appSuccessColor),
                                ),
                              )
                            : Text(
                                appLocalization.wait_before_resend,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: AppConstant.fontSize,
                                    fontWeight: AppConstant.fontWeight,
                                    color: AppColors.appFormLabelColor),
                              ),
                      ],
                    ),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(top: 25),
                  ),
                  SliverToBoxAdapter(
                    child: (controller.isLoading.value == true)
                        ? LoadingIcon()
                        : ElevatedButton(
                            onPressed: () {
                              controller.verify(context, _formKey);
                            },
                            style: AppTheme.appButtonStyle,
                            child: Text(appLocalization!.submit),
                          ),
                  ),
                ],
              )),
        );
      }),
    );
  }
}

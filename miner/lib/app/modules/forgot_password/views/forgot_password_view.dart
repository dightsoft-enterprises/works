import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../util/app_constant.dart';
import '../../../widgets/loading_icon.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
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
                      appLocalization!.forgot_password_message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: AppConstant.fontHeaderSize,
                        fontWeight: AppConstant.bigHeaderFontWeight,
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child:  controller.flashMessage.value == true?
                    Container(
                      padding: EdgeInsets.only(left: AppConstant.left, right: AppConstant.right, bottom:5, top: 5),
                      margin: EdgeInsets.only(left: AppConstant.left, right: AppConstant.right, bottom: 20),
                      color: Colors.redAccent[400],
                      child:  Text(
                        appLocalization!.email_not_valid,
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                            fontSize: AppConstant.fontSize,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ) : const Text(''),
                  ),

                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: AppConstant.formTop),
                      child: Text(
                        appLocalization!.email,
                        style: TextStyle(
                          color: AppColors.appFormLabelColor,
                          fontSize: AppConstant.fontSize,
                          fontWeight: AppConstant.fontWeight,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: SizedBox(
                        height: AppConstant.formFieldHeight,
                        child: TextFormField(
                          cursorColor: AppColors.appCursorColor,
                          cursorWidth: AppConstant.cursorWidth,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.appFormFieldBackgroundColor,
                            suffixIcon: Icon(
                              Icons.email_outlined,
                              size: AppConstant.iconSize,
                              color: AppColors.appIconColor,
                            ),
                            contentPadding:
                            EdgeInsets.all(AppConstant.formFieldPadding),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.appFormFieldLineColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.appFormFieldLineColor),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.appFormFieldLineColor),
                            ),
                            errorStyle: const TextStyle(fontSize: 0),
                          ),
                          controller: controller.emailEditingController,
                          onSaved: (value) {},
                          validator: (value) {
                            return controller.validateText(value!, appLocalization);
                          },
                        ),
                      )),
                  SliverPadding(
                    padding: EdgeInsets.only(top: AppConstant.top),
                  ),

                  SliverToBoxAdapter(
                    child: (controller.isLoading.value == true)
                        ? LoadingIcon()
                        : ElevatedButton(
                      onPressed: () {
                        controller.submit(context, _formKey);
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

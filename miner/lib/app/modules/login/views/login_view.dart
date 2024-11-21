import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:miner/app/routes/app_pages.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../util/app_constant.dart';
import '../../../widgets/loading_icon.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
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

                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: AppConstant.left, right: AppConstant.right),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxHeight: 150.0, maxWidth: 150.0),
                          child: Image.asset("assets/images/brand-small.png"),
                        ),
                      ),
                    ),
                  ),
                   SliverPadding(
                    padding: EdgeInsets.only(top: AppConstant.formTop),
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      appLocalization!.login,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: AppConstant.fontBigHeaderSize,
                        fontWeight: AppConstant.bigHeaderFontWeight,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.only(top: 1),
                      child: Text(
                        appLocalization.sign_in_description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.appMuteColor,
                          fontSize: AppConstant.fontSizeSmall,
                          fontWeight: AppConstant.fontWeight,
                        ),
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
                        appLocalization!.login_failed_message,
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
                      onSaved: (value) {
                        controller.username.value = value!;
                      },
                      validator: (value) {
                        return controller.validateText(value!, appLocalization);
                      },
                    ),
                  )),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: AppConstant.formTop),
                      child: Text(
                        appLocalization!.password,
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
                        obscureText:
                            controller.hidePassword.value ? true : false,
                        enableSuggestions: false,
                        autocorrect: false,
                        cursorColor: AppColors.appCursorColor,
                        cursorWidth: AppConstant.cursorWidth,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.appFormFieldBackgroundColor,
                          suffixIcon: IconButton(
                              icon: controller.hidePassword.value
                                  ? Icon(
                                      Icons.visibility_off,
                                      size: AppConstant.iconSize,
                                      color: AppColors.appIconColor,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      size: AppConstant.iconSize,
                                      color: AppColors.appIconColor,
                                    ),
                              onPressed: () {
                                controller.togglePasswordIcon();
                              }),
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
                        controller: controller.passwordEditingController,
                        onSaved: (value) {},
                        validator: (value) {
                          return controller.validateText(
                              value!, appLocalization);
                        },
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(top: AppConstant.formTop),
                  ),
                  SliverToBoxAdapter(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (isChecked) {
                              controller.rememberMe.value = isChecked!;
                            },
                            activeColor: AppColors.appIconColor,
                          ),
                          Text(
                            appLocalization.remember_me,
                            style: TextStyle(
                              color: AppColors.appFormLabelColor,
                              fontSize: AppConstant.fontSize,
                              fontWeight: AppConstant.fontWeight,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.FORGOT_PASSWORD);
                        },
                        child: Text(
                          appLocalization.forgot_password_,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: AppColors.appLinkColor,
                            fontSize: AppConstant.fontSize,
                            fontWeight: AppConstant.fontWeight,
                          ),
                        ),
                      )
                    ],
                  )),
                  SliverToBoxAdapter(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        appLocalization.dont_have_account,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.appFormLabelColor,
                          fontSize: AppConstant.fontSize,
                          fontWeight: AppConstant.fontWeight,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: Text(
                          appLocalization.register,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: AppColors.appLinkColor,
                            fontSize: AppConstant.fontSize,
                            fontWeight: AppConstant.fontWeight,
                          ),
                        ),
                      )
                    ],
                  )),
                  const SliverPadding(
                    padding: EdgeInsets.only(top: 25),
                  ),
                  SliverToBoxAdapter(
                    child: (controller.isLoading.value == true)
                        ? LoadingIcon()
                        : ElevatedButton(
                            onPressed: () {
                              controller.login(context, _formKey);
                            },
                            style: AppTheme.appButtonStyle,
                            child: Text(appLocalization!.sign_in),
                          ),
                  ),
                ],
              )),
        );
      }),
    );
  }
}

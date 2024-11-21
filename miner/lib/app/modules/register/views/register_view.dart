import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:miner/app/modules/register/controllers/register_controller.dart';
import 'package:miner/app/routes/app_pages.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../util/app_constant.dart';
import '../../../widgets/loading_icon.dart';

class RegisterView extends GetView<RegisterController> {
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
        return
          Form(
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
                              maxHeight: 100.0, maxWidth: 100.0),
                          child: Image.asset("assets/images/brand-small.png"),
                        ),
                      ),
                    ),
                  ),
                   SliverPadding(
                    padding: EdgeInsets.only(top: AppConstant.top),
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      appLocalization!.register,
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
                        appLocalization.create_account,
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
                    child: Container(
                      margin: EdgeInsets.only(top: AppConstant.formTop),
                      child: Text(
                        appLocalization!.first_name,
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
                          Icons.person,
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
                      controller: controller.firstNameEditingController,
                      onSaved: (value) {},
                      validator: (value) {
                        return controller.validateText(value!, appLocalization);
                      },
                    ),
                  )),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: AppConstant.formTop),
                      child: Text(
                        appLocalization!.last_name,
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
                          Icons.person,
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
                      controller: controller.lastNameEditingController,
                      onSaved: (value) {},
                      validator: (value) {
                        return controller.validateText(value!, appLocalization);
                      },
                    ),
                  )),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: AppConstant.formTop),
                      child: Text(
                        appLocalization.phone_number,
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
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.appFormFieldBackgroundColor,
                          prefix: SizedBox(
                            child:
                            CountryCodePicker(
                              padding: EdgeInsets.all(1),
                              onChanged: (value){
                                 controller.phoneCode.value = value.dialCode.toString();
                              },
                              initialSelection: 'US',
                              flagDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.phone_android,
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
                        controller: controller.phoneEditingController,
                        onSaved: (value) {},
                        validator: (value) {
                          return controller.validateText(
                              value!, appLocalization);
                        },
                      ),
                    ),
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
                      obscureText: controller.hidePassword.value ? true : false,
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
                        return controller.validateText(value!, appLocalization);
                      },
                    ),
                  )),
                  SliverToBoxAdapter(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        appLocalization.have_account,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.appFormLabelColor,
                          fontSize: AppConstant.fontSize,
                          fontWeight: AppConstant.fontWeight,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Text(
                          appLocalization.sign_in,
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
                                 controller.register(context, _formKey);
                              },
                              style: AppTheme.appButtonStyle,
                              child: Text(appLocalization!.submit),
                            )),
                ],
              )),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../util/app_constant.dart';
import '../../../widgets/loading_icon.dart';
import '../controllers/password_reset_controller.dart';

class PasswordResetView extends GetView<PasswordResetController> {
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
                  top: 50,
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
                        appLocalization!.password_reset_message,
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
                          appLocalization!.wrong_code,
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
                          appLocalization!.code,
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
                            enableSuggestions: false,
                            autocorrect: false,
                            cursorColor: AppColors.appCursorColor,
                            cursorWidth: AppConstant.cursorWidth,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.appFormFieldBackgroundColor,
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.text_snippet_outlined,
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
                            controller: controller.codeEditingController,
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
                          appLocalization!.new_password,
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

                    const SliverPadding(
                      padding: EdgeInsets.only(top: 25),
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
                        )),
                  ],
                )),
          );
      }),
    );
  }
}

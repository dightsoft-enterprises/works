import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../util/app_helper.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
import '../../../widgets/branding.dart';
import '../../../widgets/loading_icon.dart';
import '../controllers/connect_account_controller.dart';

class ConnectAccountView extends GetView<ConnectAccountController> {
  ConnectAccountView({super.key});

  final GlobalKey<FormState> _mtAccountFormKey = GlobalKey<FormState>();

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
                    height: 120,
                    color: AppColors.appColor,
                  ),
                  Container(
                     padding:  EdgeInsets.only(left: left, right: right),
                      margin:
                          EdgeInsets.only(left: left, right: right, top: 25),
                      alignment: Alignment.center,
                      width: width,
                      height: 120,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0))),
                      child: Text(
                        appLocalization!.fx_account_header,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey),
                      ))
                ],
              ),
              Form(
                key: _mtAccountFormKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: left, right: right),
                        child: DropdownButtonFormField(
                          focusColor: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          isExpanded: true,
                          value: 'MT4 LIVE',
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.appSecondaryColor,
                          ),
                          //  elevation: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          validator: (value) {
                            return controller.validateType(value!);
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black12, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black12, width: 1),
                            ),
                            label: Text(
                                appLocalization!.server,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            contentPadding: const EdgeInsetsDirectional.only(
                                top: 10.0,
                                bottom: 10.0,
                                start: 10.0,
                                end: 10.0),
                          ),
                          onChanged: (String? value) {},
                          items:
                              controller.getMTAccountType().map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: left, right: right),
                      child: TextFormField(
                        cursorColor: Colors.black12,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsetsDirectional.only(
                              top: 10.0, bottom: 10.0, start: 10.0, end: 2.0),
                          labelStyle: const TextStyle(fontSize: 16),
                          label: Text(
                              appLocalization!.mt_account,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          suffixIcon: Icon(
                            Icons.person_outlined,
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
                        controller: controller.accountEditingController,
                        onSaved: (value) {
                          controller.account.value = value!;
                        },
                        validator: (value) {
                          return controller.validateAccount(value!);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: left, right: right),
                      child: TextFormField(
                        cursorColor: Colors.black12,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsetsDirectional.only(
                              top: 10.0, bottom: 10.0, start: 10.0, end: 2.0),
                          labelStyle: const TextStyle(fontSize: 16),
                          label: Text(
                              appLocalization!.broker_server,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          suffixIcon: Icon(
                            Icons.insert_chart_outlined,
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
                        controller: controller.brokerEditingController,
                        onSaved: (value) {
                          controller.account.value = value!;
                        },
                        validator: (value) {
                          return controller.validateBroker(value!);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: left, right: right),
                      child: TextFormField(
                        obscureText:
                            controller.hidePassword.value ? true : false,
                        enableSuggestions: false,
                        autocorrect: false,
                        cursorColor: Colors.black12,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsetsDirectional.only(
                              top: 10.0, bottom: 10.0, start: 10.0, end: 2.0),
                          labelStyle: const TextStyle(fontSize: 17),
                          label: Text(
                              appLocalization!.mt_password,
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
                        controller: controller.passwordEditingController,
                        onSaved: (value) {
                          controller.password.value = value!;
                        },
                        validator: (value) {
                          return controller.validatePassword(value!);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: left, right: right),
                        child: DropdownButtonFormField(
                          focusColor: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          isExpanded: true,
                          value: controller.getPricing().firstOrNull,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.appSecondaryColor,
                          ),
                          //  elevation: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          validator: (value) {
                            return controller.validateType(value!);
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            label: Text(
                              appLocalization!.pricing_plan_paid_for,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            contentPadding: const EdgeInsetsDirectional.only(
                                top: 10.0,
                                bottom: 10.0,
                                start: 10.0,
                                end: 10.0),
                          ),
                          onChanged: (String? value) {},
                          items:
                          controller.getPricing().map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: left, right: right),
                        child: DropdownButtonFormField(
                          focusColor: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          isExpanded: true,
                          value: 'Safe',
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.appSecondaryColor,
                          ),
                          //  elevation: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          validator: (value) {
                            return controller.validateType(value!);
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            label: Text(
                              appLocalization!.choose_trading_mode,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            contentPadding: const EdgeInsetsDirectional.only(
                                top: 10.0,
                                bottom: 10.0,
                                start: 10.0,
                                end: 10.0),
                          ),
                          onChanged: (String? value) {},
                          items: ["Safe", "Conservative", "Aggressive"].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        )),

                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: left, right: right),
                        child: DropdownButtonFormField(
                          focusColor: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          isExpanded: true,
                          value: '100% Accuracy',
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.appSecondaryColor,
                          ),
                          //  elevation: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          validator: (value) {
                            return controller.validateType(value!);
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            label: Text(
                              appLocalization!.signal_strength,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            contentPadding: const EdgeInsetsDirectional.only(
                                top: 10.0,
                                bottom: 10.0,
                                start: 10.0,
                                end: 10.0),
                          ),
                          onChanged: (String? value) {},
                          items: ["100% Accuracy", "90% Accuracy", "85% Accuracy"].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        )),

                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: left, right: right),
                        child: DropdownButtonFormField(
                          focusColor: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          isExpanded: true,
                          value: 'All Pairs',
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.appSecondaryColor,
                          ),
                          //  elevation: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          validator: (value) {
                            return controller.validateType(value!);
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            label: Text(
                              appLocalization!.currency_pair_trade,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            contentPadding: const EdgeInsetsDirectional.only(
                                top: 10.0,
                                bottom: 10.0,
                                start: 10.0,
                                end: 10.0),
                          ),
                          onChanged: (String? value) {},
                          items: ["All Pairs", "Major Pairs", "Gold (XAU/USD)", "NASDAQ", "US30", "Cryptocurrencies"].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        )),

                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: left, right: right),
                        child: DropdownButtonFormField(
                          focusColor: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          isExpanded: true,
                          value: 'On',
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.appSecondaryColor,
                          ),
                          //  elevation: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          validator: (value) {
                            return controller.validateType(value!);
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            label: Text(
                              appLocalization!.take_profit_p,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            contentPadding: const EdgeInsetsDirectional.only(
                                top: 10.0,
                                bottom: 10.0,
                                start: 10.0,
                                end: 10.0),
                          ),
                          onChanged: (String? value) {},
                          items: ["On", "Off"].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        )),


                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: left, right: right),
                        child: DropdownButtonFormField(
                          focusColor: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          isExpanded: true,
                          value: 'On',
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.appSecondaryColor,
                          ),
                          //  elevation: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          validator: (value) {
                            return controller.validateType(value!);
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            label: Text(
                              appLocalization!.stop_loss,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            contentPadding: const EdgeInsetsDirectional.only(
                                top: 10.0,
                                bottom: 10.0,
                                start: 10.0,
                                end: 10.0),
                          ),
                          onChanged: (String? value) {},
                          items: ["On", "Off"].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        )),

                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: left, right: right),
                        child: DropdownButtonFormField(
                          focusColor: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          isExpanded: true,
                          value: 'No Drawdown',
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.appSecondaryColor,
                          ),
                          //  elevation: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          validator: (value) {
                            return controller.validateType(value!);
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            label: Text(
                              appLocalization!.max_drawdown_p,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            contentPadding: const EdgeInsetsDirectional.only(
                                top: 10.0,
                                bottom: 10.0,
                                start: 10.0,
                                end: 10.0),
                          ),
                          onChanged: (String? value) {},
                          items: ["No Drawdown", "1% Drawdown", "3% Drawdown"].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        )),

                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: left, right: right),
                        child: DropdownButtonFormField(
                          focusColor: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          isExpanded: true,
                          value: 'On',
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.appSecondaryColor,
                          ),
                          //  elevation: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          validator: (value) {
                            return controller.validateType(value!);
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            label: Text(
                              appLocalization!.vps_p,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            contentPadding: const EdgeInsetsDirectional.only(
                                top: 10.0,
                                bottom: 10.0,
                                start: 10.0,
                                end: 10.0),
                          ),
                          onChanged: (String? value) {},
                          items: ["On", "Off"].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        )),

                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: left, right: right),
                        child: DropdownButtonFormField(
                          focusColor: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          isExpanded: true,
                          value: 'Phone',
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.appSecondaryColor,
                          ),
                          //  elevation: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          validator: (value) {
                            return controller.validateType(value!);
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1),
                            ),
                            label: Text(
                              appLocalization!.trade_on_device,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            contentPadding: const EdgeInsetsDirectional.only(
                                top: 10.0,
                                bottom: 10.0,
                                start: 10.0,
                                end: 10.0),
                          ),
                          onChanged: (String? value) {},
                          items: ["Phone", "Computer", "Ipad/Macbook"].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        )),



                    const SizedBox(
                      height: 25,
                    ),
                    (controller.isLoading.value == true)
                        ? LoadingIcon()
                        : ElevatedButton(
                            onPressed: () {
                              controller.proceed(context, _mtAccountFormKey);
                            },
                            style: AppTheme.appButtonStyle,
                            child: Text( appLocalization!.connect_now),
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

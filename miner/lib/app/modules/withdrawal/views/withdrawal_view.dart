import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/models/item_list.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../util/app_constant.dart';
import '../../../widgets/AppLanguage.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
import '../../../widgets/app_drawer.dart';
import '../../../widgets/branding.dart';
import '../../../widgets/loading_icon.dart';
import '../../../widgets/net_issue.dart';
import '../../../widgets/un_available.dart';
import '../controllers/withdrawal_controller.dart';

class WithdrawalView extends GetView<WithdrawalController> {
  WithdrawalView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);

    double width = MediaQuery.of(context).size.width;
    AppTheme.statusBarSetup();
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        leading:   Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.more_vert,
                size: AppConstant.iconSize,
                color: AppColors.appTopBarColor,
              ),
            );
          },
        ),
        actions: [
          SizedBox(
            width: 200,
            child:  Branding(),
          ),
          SizedBox(

            child:  AppLanguage(),
          ),

        ],
      ),
      body: controller.obx(
        (data) {
          var subscriber = data!;
          var currencyList = AppConstant.currencyList(subscriber);
          return Obx(() {
            return Container(
              margin: EdgeInsets.only(
                  right: AppConstant.right, left: AppConstant.left),
              child: CustomScrollView(
                primary: true,
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: AppConstant.smallLeft),
                      child: Text(
                        appLocalization!.wallet_balance,
                        style: TextStyle(
                          color: AppColors.appGrayColor,
                          fontSize: AppConstant.fontHeaderSize,
                          fontWeight: AppConstant.fontWeight,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Card(
                      color: AppColors.appCardColor,
                      elevation: 1.1,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          '\$${controller.selectedCoinBalance.string}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppConstant.fontMediumHeaderSize,
                            fontWeight: AppConstant.fontWeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          appLocalization.coin_balance,
                          style: TextStyle(
                            color: AppColors.appGrayColor,
                            fontSize: AppConstant.fontMediumHeaderSize,
                            fontWeight: AppConstant.fontWeight,
                          ),
                        ),
                        Icon(
                          Icons.monetization_on_outlined,
                          size: AppConstant.iconBigSize,
                          color: AppColors.appIconColor,
                        ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  SliverList.builder(
                    itemBuilder: (BuildContext context, int index) {
                      ItemList data = currencyList[index];
                      return Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 30,
                              child: Radio(
                                  value: data.code,
                                  groupValue: controller.selectedCoin.value,
                                  activeColor: AppColors.appIconColor,
                                  toggleable: true,
                                  onChanged: (onChanged) {
                                    controller.changeCoin(onChanged!, subscriber);
                                  }),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  right: 5, top: 7, bottom: 7),
                              height: 25,
                              width: 25,
                              child: Image.asset(
                                AppConstant.acceptedCurrency()
                                        .contains(data.code)
                                    ? "assets/images/${data.code}.png"
                                    : "assets/images/default.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                data.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.appColor,
                                  fontSize: AppConstant.fontSize,
                                  fontWeight: AppConstant.fontWeight,
                                ),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              child: Text(
                                '\$${AppConstant.formatAmount(data.amount, false)}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.appSuccessColor,
                                  fontSize: AppConstant.fontHeaderSize,
                                  fontWeight: AppConstant.fontWeight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: currencyList.length,
                  ),
                  SliverToBoxAdapter(
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: width,
                            child: Text(
                              appLocalization.amount,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: AppConstant.fontHeaderSize,
                                fontWeight: AppConstant.fontWeight,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: AppConstant.formTop),
                            height: AppConstant.formFieldHeight,
                            child: TextFormField(
                              cursorColor: AppColors.appCursorColor,
                              cursorWidth: AppConstant.cursorWidth,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    AppColors.appFormFieldBackgroundColor,
                                contentPadding: EdgeInsets.all(
                                    AppConstant.formFieldPadding),
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
                              controller: controller.amountEditingController,
                              onSaved: (value) {},
                              validator: (value) {
                                return controller.validateText(
                                    value!, appLocalization);
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: AppConstant.formTop),
                            width: width,
                            child: Text(
                              '${appLocalization.enter} ${controller.selectedCoinName.value} ${appLocalization.address}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: AppConstant.fontHeaderSize,
                                fontWeight: AppConstant.fontWeight,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: AppConstant.formTop),
                            height: AppConstant.formFieldHeight,
                            child: TextFormField(
                              cursorColor: AppColors.appCursorColor,
                              cursorWidth: AppConstant.cursorWidth,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    AppColors.appFormFieldBackgroundColor,
                                contentPadding: EdgeInsets.all(
                                    AppConstant.formFieldPadding),
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
                              controller: controller.addressEditingController,
                              onSaved: (value) {},
                              validator: (value) {
                                return controller.validateText(
                                    value!, appLocalization);
                              },
                            ),
                          ),

                         Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: (controller.isLoading.value == true)
                                  ? LoadingIcon()
                                  : ElevatedButton(
                                      onPressed: () {
                                        controller.submit(
                                            context, subscriber, _formKey, appLocalization);
                                      },
                                      style: AppTheme.appButtonStyle,
                                      child: Text(appLocalization.submit),
                                    ),
                            ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        },
        onLoading: LoadingIcon(),
        onEmpty: UnAvailable(),
        onError: (e) {
          return NetIssue();
        },
      ),
      bottomNavigationBar: AppBottomNavigationBar(2),
    );
  }
}

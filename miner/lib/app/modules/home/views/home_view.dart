import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miner/app/data/models/mining_currency.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/models/item_list.dart';
import '../../../routes/app_pages.dart';
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
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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

          var subscriber = data;
          var settings = controller.settings.value;
          var currencyList = AppConstant.currencyList(subscriber!);

          return Container(
            color: AppColors.appBackgroundColor,
            padding: EdgeInsets.only(
              left: AppConstant.left,
              right: AppConstant.right,
            ),
            child: CustomScrollView(
              primary: true,
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: AppConstant.gridTop,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person,
                        size: AppConstant.fontMediumHeaderSize,
                        color: AppColors.appIconColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${appLocalization!.hello}, ${subscriber.firstName.string}',
                        softWrap: true,
                        style: TextStyle(
                          color: AppColors.appGrayColor,
                          fontSize: AppConstant.fontHeaderSize,
                          fontWeight: AppConstant.fontWeight,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll<Color>(
                              AppColors.appLightColor),
                        ),
                        onPressed: () {
                          Get.offAndToNamed(Routes.NOTIFICATION);
                        },
                        icon: Icon(
                          controller.isNotificationAvailable.value == 1? Icons.notifications_active: Icons.notifications_none_outlined,
                          size: AppConstant.iconSize,
                          color: controller.isNotificationAvailable.value == 1? AppColors.appErrorColor: AppColors.appGrayColor,
                          weight: 10,
                        ),
                      ),
                    ],
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(left: AppConstant.smallLeft, right: AppConstant.smallLeft),
                    margin: EdgeInsets.only(top: AppConstant.top),
                    height: 150,
                    child: Card(
                      color: AppColors.appCardColor,
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 1,
                              ),
                              Text(
                                settings!.header.string,
                                textAlign: TextAlign.start,
                                softWrap: true,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppConstant.fontSize,
                                  fontWeight: AppConstant.fontWeight,
                                ),
                              ),
                              const Divider(
                                color: Colors.white,
                                thickness: 1.7,
                              ),
                              Center(
                                child: Text(

                                  maxLines: 3,
                                  settings!.message.string,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppConstant.fontSize,
                                    fontWeight: AppConstant.fontWeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: AppConstant.gridTop,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization.wallet_balance,
                        style: TextStyle(
                          color: AppColors.appGrayColor,
                          fontSize: AppConstant.fontHeaderSize,
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
                SliverList.builder(
                  itemBuilder: (BuildContext context, int index) {
                    ItemList data = currencyList[index];
                    return Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(
                        left: AppConstant.left,
                        right: AppConstant.right,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                right: 9, top: 7, bottom: 7),
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              controller.acceptedCurrency().contains(data.code)
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
                                fontSize: AppConstant.fontHeaderSize,
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
                const SliverToBoxAdapter(
                  child: SizedBox(height: 20,),
                ),
              ],
            ),
          );
        },
        onLoading: LoadingIcon(),
        onEmpty: UnAvailable(),
        onError: (e) {
          return NetIssue();
        },
      ),
      bottomNavigationBar: AppBottomNavigationBar(0),
    );
  }
}

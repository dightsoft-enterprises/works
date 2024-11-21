import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miner/app/data/models/mining_currency.dart';
import 'package:miner/app/modules/start_mining/views/mining_balance.dart';

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
import '../controllers/start_mining_controller.dart';

class StartMiningView extends GetView<StartMiningController> {
  const StartMiningView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var appLocalization = AppLocalizations.of(context);

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
          var dataList = controller.getMiningCurrency(subscriber);

          return Obx(() {
            return Container(
              color: AppColors.appGrayColor,
              padding: EdgeInsets.only(
                left: AppConstant.left,
                right: AppConstant.right,
              ),
              child: CustomScrollView(
                primary: true,
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: AppConstant.top),
                      child: Text(
                        appLocalization!.mine_currency_header,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: AppConstant.fontHeaderSize,
                          fontWeight: AppConstant.fontWeight,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: AppConstant.formTop),
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(bottom: AppConstant.formTop),
                            padding: EdgeInsets.only(
                                top: 1,
                                left: AppConstant.smallLeft,
                                right: AppConstant.smallLeft),
                            color: Colors.black,
                            height: 150,
                            width: width,
                            child: TextFormField(
                              enableSuggestions: false,
                              autocorrect: false,
                              expands: true,
                              maxLines: null,
                              readOnly: true,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppConstant.smallFontSize,
                                  fontWeight: AppConstant.fontWeight,
                                  letterSpacing: 2),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              cursorColor: AppColors.appCursorColor,
                              cursorWidth: AppConstant.cursorWidth,
                              controller: controller.progressMessage.value,
                              scrollController:
                                  controller.scrollController.value,
                              onSaved: (value) {},
                            ),
                          ),
                          Text(
                            '${appLocalization!.found} ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppConstant.fontHeaderSize,
                              fontWeight: AppConstant.fontWeight,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: AppConstant.formTop),
                            color: Colors.grey[900],
                            height:
                                ((controller.userCoinList.length * 28) + 85),
                            //250,
                            width: width,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: AppConstant.miningTop,
                                        left: AppConstant.smallLeft,
                                        right: AppConstant.smallLeft),
                                    color: Colors.black12,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          appLocalization!.network_hash_rate,
                                          style: TextStyle(
                                            color: AppColors.appWhiteColor,
                                            fontSize: AppConstant.fontSize,
                                            fontWeight: AppConstant.fontWeight,
                                          ),
                                        ),
                                        Text(
                                          '${controller.networkHashRate.string} MH/s',
                                          style: TextStyle(
                                            color: AppColors.appWhiteColor,
                                            fontSize: AppConstant.fontSize,
                                            fontWeight: AppConstant.fontWeight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: AppConstant.miningTop,
                                        left: AppConstant.smallLeft,
                                        right: AppConstant.smallLeft),
                                    color: Colors.black12,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          appLocalization!.pool_hash_rate,
                                          style: TextStyle(
                                            color: AppColors.appWhiteColor,
                                            fontSize: AppConstant.fontSize,
                                            fontWeight: AppConstant.fontWeight,
                                          ),
                                        ),
                                        Text(
                                          '${controller.poolHashRate.string} MH/s',
                                          style: TextStyle(
                                            color: AppColors.appWhiteColor,
                                            fontSize: AppConstant.fontSize,
                                            fontWeight: AppConstant.fontWeight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: AppConstant.miningTop,
                                        left: AppConstant.smallLeft,
                                        right: AppConstant.smallLeft),
                                    color: Colors.black26,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          appLocalization!.block_found,
                                          style: TextStyle(
                                            color: AppColors.appWhiteColor,
                                            fontSize: AppConstant.fontSize,
                                            fontWeight: AppConstant.fontWeight,
                                          ),
                                        ),
                                        Text(
                                          controller.blockFound.string,
                                          style: TextStyle(
                                            color: AppColors.appWhiteColor,
                                            fontSize: AppConstant.fontSize,
                                            fontWeight: AppConstant.fontWeight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  MiningBalance(controller),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: (controller.countCoin(subscriber) * 95), //190,
                      padding: EdgeInsets.only(top: AppConstant.top),
                      child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 1.4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 2,
                        primary: false,
                        children: List.generate(dataList.length, (index) {
                          ItemList data = dataList[index];
                          return Card(
                            elevation: 2,

                            shadowColor: AppColors.appColor,
                            child: Center(
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    width: 100,
                                    height: 125,
                                    child: Column(
                                      children: [
                                        SizedBox(
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
                                              fontSize:
                                                  AppConstant.fontHeaderSize,
                                              fontWeight:
                                                  AppConstant.fontWeight,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 40,
                                    left: 26,
                                    child: Checkbox(
                                        value: controller
                                            .selectedCoinItem(data.code),
                                        activeColor: AppColors.appIconColor,
                                        onChanged: (onChanged) {
                                          controller.selectedCoin(
                                              onChanged, data.code);
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: AppConstant.top),
                      child: ElevatedButton(
                        onPressed: () {
                          if(dataList.isNotEmpty) {
                            controller.startMining(
                                context, subscriber, appLocalization);
                          }else{
                            controller.selectCoinMessage(
                                context, appLocalization);
                          }
                        },
                        style: AppTheme.startButtonStyle,
                        child: Text(appLocalization!.start_trading),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: AppConstant.top),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.stopMining();
                        },
                        style: AppTheme.stopButtonStyle,
                        child: Text(appLocalization!.stop),
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
      bottomNavigationBar: AppBottomNavigationBar(1),
    );
  }
}

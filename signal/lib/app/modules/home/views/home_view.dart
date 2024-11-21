import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:signal/app/modules/home/views/buy_order.dart';
import 'package:signal/app/modules/home/views/sell_order.dart';
import 'package:signal/app/theme/app_theme.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/model/trade.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../util/app_helper.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
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
      body:
      controller.obx(
        (tradeData) {
          List<Trade> tradeList = tradeData!;

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      height: 120,
                      color: AppColors.appColor,
                    ),
                    Container(
                        margin:
                            EdgeInsets.only(left: left, right: right, top: 10),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.center,
                        width: width,
                        height: 120,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0))),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              child: Text(
                                appLocalization!.result_summary,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: "from".tr,
                                      labelStyle: const TextStyle(fontSize: 16),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueGrey, width: 1),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueGrey, width: 1),
                                      ),
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueGrey, width: 1),
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          left: 15, top: 1, bottom: 1),
                                    ),
                                    readOnly: true,
                                    controller:
                                        controller.startEditingController,
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate:
                                                  controller.getStartDate(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2101),
                                              builder: (context, child) {
                                                return AppTheme.appDateRange(
                                                    context, child);
                                              });

                                      if (pickedDate != null) {
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                        controller.startEditingController.text =
                                            formattedDate;
                                        controller.setStartDate(formattedDate);

                                        controller.search();
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Flexible(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: "to".tr,
                                      labelStyle: const TextStyle(fontSize: 16),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueGrey, width: 1),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueGrey, width: 1),
                                      ),
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueGrey, width: 1),
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          left: 10, top: 1, bottom: 1),
                                    ),
                                    readOnly: true,
                                    controller: controller.endEditingController,
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate:
                                                  controller.getEndDate(),
                                              firstDate:
                                                  controller.getStartDate(),
                                              lastDate: DateTime(2101),
                                              builder: (context, child) {
                                                return AppTheme.appDateRange(
                                                    context, child);
                                              });

                                      if (pickedDate != null) {
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                        controller.endEditingController.text =
                                            formattedDate;
                                        controller.setEndDate(formattedDate);
                                        controller.search();
                                      }
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
              SliverPadding(
                  padding: const EdgeInsets.only(top: 5.0),
                  sliver: SliverList.separated(
                    itemBuilder:
                          (BuildContext context, int index) {
                        Trade trade = tradeList[index];
                        if (trade.type.value != null && trade.type.value == 'buy') {
                          return BuyOrder(trade);
                        } else {
                          return SellOrder(trade);
                        }
                      },
                      itemCount: tradeList.length,
                    separatorBuilder: (BuildContext context, int index) {
                    return  const SizedBox(height: 10,);
                    },


                  ),
              ),


            ],
          );
        },
        onLoading: LoadingIcon(),
        onEmpty: Stack(
          children: [
            Container(
              width: width,
              height: 120,
              color: AppColors.appColor,
            ),
            Container(
                margin:
                EdgeInsets.only(left: left, right: right, top: 10),
                padding: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                width: width,
                height: 120,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        appLocalization!.result_summary,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "from".tr,
                              labelStyle: const TextStyle(fontSize: 16),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 1),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 1),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 1),
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 15, top: 1, bottom: 1),
                            ),
                            readOnly: true,
                            controller:
                            controller.startEditingController,
                            onTap: () async {
                              DateTime? pickedDate =
                              await showDatePicker(
                                  context: context,
                                  initialDate:
                                  controller.getStartDate(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                  builder: (context, child) {
                                    return AppTheme.appDateRange(
                                        context, child);
                                  });

                              if (pickedDate != null) {
                                String formattedDate =
                                DateFormat('yyyy-MM-dd')
                                    .format(pickedDate);
                                controller.startEditingController.text =
                                    formattedDate;
                                controller.setStartDate(formattedDate);

                                controller.search();
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "to".tr,
                              labelStyle: const TextStyle(fontSize: 16),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 1),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 1),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 1),
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 10, top: 1, bottom: 1),
                            ),
                            readOnly: true,
                            controller: controller.endEditingController,
                            onTap: () async {
                              DateTime? pickedDate =
                              await showDatePicker(
                                  context: context,
                                  initialDate:
                                  controller.getEndDate(),
                                  firstDate:
                                  controller.getStartDate(),
                                  lastDate: DateTime(2101),
                                  builder: (context, child) {
                                    return AppTheme.appDateRange(
                                        context, child);
                                  });

                              if (pickedDate != null) {
                                String formattedDate =
                                DateFormat('yyyy-MM-dd')
                                    .format(pickedDate);
                                controller.endEditingController.text =
                                    formattedDate;
                                controller.setEndDate(formattedDate);
                                controller.search();
                              }
                            },
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
        onError: (e) {
          return NetIssue();
        },
      ),
      bottomNavigationBar: AppBottomNavigationBar(0),
    );
  }
}

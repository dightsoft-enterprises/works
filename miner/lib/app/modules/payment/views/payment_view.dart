import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../util/app_constant.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
import '../../../widgets/app_drawer.dart';
import '../../../widgets/branding.dart';
import '../../../widgets/loading_icon.dart';
import '../../../widgets/net_issue.dart';
import '../../../widgets/un_available.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);
    double width = MediaQuery.of(context).size.width;
    AppTheme.statusBarSetup();
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        leading: const Text(''),
        actions: [
          Branding(),
          Builder(
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
        ],
      ),
      body: controller.obx(
        (data) {
          var subscriptionPlan = data!;
          var color = AppConstant.setColor(controller.colorIndex);
          var features = AppConstant.getList(subscriptionPlan.features.string);
          return Container(
            margin: EdgeInsets.only(
                top: 20,
                right: AppConstant.right,
                left: AppConstant.left),
            child: CustomScrollView(
              primary: true,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: 200,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 10),
                    color: AppColors.appLightColor,
                    child: Center(
                      child: Text(
                        subscriptionPlan.payment.value!,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppConstant.fontSize,
                            color: AppColors.appLinkColor,
                            fontWeight: AppConstant.fontWeight),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Card(
                    color: color[600],
                    elevation: 1.1,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          color: color[800],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                subscriptionPlan.name.value!,
                                style: TextStyle(
                                    fontSize: AppConstant.fontHeaderSize,
                                    color: Colors.white,
                                    fontWeight: AppConstant.fontWeight),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          color: color[700],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                subscriptionPlan.subtitle.value!,
                                style: TextStyle(
                                    fontSize: AppConstant.fontSize,
                                    color: Colors.white,
                                    fontWeight: AppConstant.fontWeight),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 10,
                              right: AppConstant.right,
                              left: AppConstant.left),
                          child: Card(
                            elevation: 1.1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: color[800],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  subscriptionPlan.amount.value!,
                                  style: TextStyle(
                                      fontSize:
                                          AppConstant.fontMediumHeaderSize,
                                      color: Colors.white,
                                      fontWeight: AppConstant.fontWeight),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              right: AppConstant.right,
                              left: AppConstant.left),
                          height: (features.length * 48),
                          child: ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                var feature = features[index];
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: (35),
                                      child: Icon(
                                        Icons.check_circle,
                                        size: AppConstant.iconBigSize,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: (width - 150),
                                      child: Text(
                                        feature,
                                        softWrap: true,
                                        style: TextStyle(
                                            fontSize: AppConstant.fontSize,
                                            color: Colors.white,
                                            fontWeight: AppConstant.fontWeight),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.only(top: 3, bottom: 3),
                                );
                              },
                              primary: false,
                              clipBehavior: Clip.hardEdge,
                              itemCount: features.length),
                        ),
                      ],
                    ),
                  ),
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
      bottomNavigationBar: AppBottomNavigationBar(1),
    );
  }
}

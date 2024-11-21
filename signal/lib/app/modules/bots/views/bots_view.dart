import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:signal/app/modules/bots/views/pricing_item.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/model/pricing.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
import '../../../widgets/branding.dart';
import '../../../widgets/loading_icon.dart';
import '../../../widgets/net_issue.dart';
import '../../../widgets/un_available.dart';
import '../controllers/bots_controller.dart';

class BotsView extends GetView<BotsController> {
  const BotsView({super.key});

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
      body: controller.obx(
        (pricingData) {
          List<Pricing> pricingList = pricingData!;
          int counter = 0;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      height: 100,
                      color: AppColors.appColor,
                    ),
                    Container(
                        margin:
                            EdgeInsets.only(left: left, right: right, top: 25),
                        alignment: Alignment.center,
                        width: width,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0))),
                        child: Text(
                          appLocalization!.pricing_plan,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey),
                        ))
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 5.0),
                sliver: SliverList.separated(
                  itemBuilder: (BuildContext context, int index) {

                    Color color1 = controller.color1;
                    Color color2 = controller.color11;
                    Pricing pricing = pricingList[index];
                    counter++;

                    if (counter == 2) {
                      color1 = controller.color2;
                      color2 = controller.color22;
                    } else if (counter == 3) {
                      color1 = controller.color3;
                      color2 = controller.color33;
                    } else if (counter == 4) {
                      color1 = controller.color4;
                      color2 = controller.color44;
                      counter = 0;
                    }
                    return PricingItem(pricing, color1, color2);
                  },
                  itemCount: pricingList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
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
              height: 100,
              color: AppColors.appColor,
            ),
            Container(
                margin: EdgeInsets.only(left: left, right: right, top: 25),
                alignment: Alignment.center,
                width: width,
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: Text(
                  appLocalization!.pricing_plan,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ))
          ],
        ),
        onError: (e) {
          return NetIssue();
        },
      ),
      bottomNavigationBar: AppBottomNavigationBar(3),
    );
  }
}

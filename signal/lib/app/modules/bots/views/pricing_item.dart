import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/model/pricing.dart';
import '../../../data/model/trade.dart';
import '../../../routes/app_pages.dart';

import '../../../theme/app_colors.dart';
import '../../../util/app_helper.dart';

class PricingItem extends StatelessWidget {
  final Pricing data;
  final Color color1;
  final Color color2;

  PricingItem(this.data, this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);

    double left = 15;
    double right = 15;
    double width = MediaQuery.of(context).size.width;
    return Card(
      color: AppColors.appBackgroundColor,
      shadowColor: AppColors.appBackgroundColor,
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
      margin: EdgeInsets.only(left: left, right: right),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            color: color1,//Colors.orange[500],
            child: SizedBox(
              width: width,
              child: Text(
                data.name.value!,
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(3),
            color: color2,//Colors.orange[700],
            child: SizedBox(
              width: width,
              child: Text(
                data.amount.value!,
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                appLocalization!.features,
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              )),
          Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization!.min_deposit,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.minDeposit.value!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization!.max_deposit,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.maxDeposit.value!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization!.daily_returns,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.dailyReturns.value!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization!.weekly_returns,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.weeklyReturns.value!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization!.maxdrawdown,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.maxDrawDown.value!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization!.phone_or_computer,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.phoneOrComputer.value!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization!.no_loss_trading,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.noLossTrading.value!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization!.pro_firm_trading,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.proFirmTrading.value!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization!.news_trading,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.newsTrading.value!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization!.take_profit,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.takeProfit.value!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization!.stop_loss,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.stopLoss.value!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization!.trade_optimization,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.tradingOptimization.value!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocalization!.live_demo_account,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.liveDemo.value!,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  SizedBox(
                      child: Text(
                    '${appLocalization!.instruments_dot} ${data.currencyPair.value!}',
                    softWrap: true,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  )),
                  Divider(
                    height: 6,
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/model/trade.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../util/app_helper.dart';

class SellOrder extends StatelessWidget {
  final Trade data;

  SellOrder(this.data);

  @override
  Widget build(BuildContext context) {
    var appLocalization =  AppLocalizations.of(context);
    double width = MediaQuery.of(context).size.width;
    double left = 15;
    double right = 15;

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
            color: Colors.red[500],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.name.value!,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(3),
            color: Colors.red[700],
            child: SizedBox(
              width: width,
              child: Text(
                data.bot.value!,
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.currentPair.value!,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
              appLocalization!.start,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.startDate.value!,
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
                  appLocalization!.end,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.endDate.value!,
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
                  appLocalization!.sell_at,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.option.value!,
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
                  appLocalization!.profit,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.profit.value!,
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
                  appLocalization!.roi,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.roi.value!,
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
                  const SizedBox(
                    height: 15,
                  )
                ],
              )),
          Container(
            padding: const EdgeInsets.all(5),
            color: Colors.orange[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
            appLocalization!.trade_complete,
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  data.status.string.tr,
                  style: TextStyle(
                      fontSize: 20,
                      color: (data.status.string == 'won')
                          ? Colors.green[700]
                          : Colors.red[700],
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

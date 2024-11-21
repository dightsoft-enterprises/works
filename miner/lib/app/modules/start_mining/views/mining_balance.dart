import 'package:flutter/material.dart';
import 'package:miner/app/modules/start_mining/controllers/start_mining_controller.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../theme/app_colors.dart';
import '../../../util/app_constant.dart';

class MiningBalance extends StatelessWidget {
  final StartMiningController controller;

  MiningBalance(this.controller);

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);
    List itemList = controller.userCoinList;

    return Container(
      height: (controller.userCoinList.length * 29),
      child: ListView.builder(
        primary: false,
        itemBuilder: (BuildContext context, int index) {
          var item = itemList[index];

          return Container(
            padding: EdgeInsets.only(
                top: AppConstant.miningTop,
                left: AppConstant.smallLeft,
                right: AppConstant.smallLeft),
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$item ${appLocalization?.balance}',
                  style: TextStyle(
                    color: AppColors.appWhiteColor,
                    fontSize: AppConstant.fontSize,
                    fontWeight: AppConstant.fontWeight,
                  ),
                ),
                Text(
                  AppConstant.formatAmount(controller.selectedCoinBalance(item) , true),
                  style: TextStyle(
                    color: AppColors.appWhiteColor,
                    fontSize: AppConstant.fontSize,
                    fontWeight: AppConstant.fontWeight,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: itemList.length,
      ),
    );

  }
}

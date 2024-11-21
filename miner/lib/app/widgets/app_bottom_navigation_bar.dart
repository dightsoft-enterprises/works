
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../data/service/app_storage_manager.dart';
import '../routes/app_pages.dart';
import '../theme/app_colors.dart';
import '../util/app_constant.dart';


class AppBottomNavigationBar extends StatelessWidget {
  final AppStorageManager _appStorageManager = Get.find();
  int selectedIndex = 0;
  AppBottomNavigationBar(this.selectedIndex);

  @override
  Widget build(BuildContext context) {
   var appLocalization =  AppLocalizations.of(context);
  var settings =  _appStorageManager.getSettings();
    return BottomNavigationBar(
      unselectedItemColor: AppColors.appNavigationIconColor,
      unselectedLabelStyle:
          TextStyle(color: AppColors.appNavigationIconColor, fontWeight: AppConstant.fontWeight),
      showUnselectedLabels: true,
      selectedItemColor: AppColors.appIconColor,
      selectedLabelStyle: TextStyle(
          color: AppColors.appNavigationIconColor, fontWeight: AppConstant.fontWeight, fontSize: 15),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon:  Icon(Icons.insert_chart_outlined_outlined, size: AppConstant.iconBigSize,),
          label: appLocalization!.home,
        ),

        BottomNavigationBarItem(
          icon:  Icon(Icons.currency_exchange_outlined, size: AppConstant.iconBigSize,),
          label: appLocalization.trade_now,
        ),
        BottomNavigationBarItem(
          icon:  Icon(Icons.wallet_giftcard_outlined, size: AppConstant.iconBigSize,),
          label: appLocalization.withdrawal,
        ),

        BottomNavigationBarItem(
          icon:  Icon(Icons.support, size: AppConstant.iconBigSize,),
          label: appLocalization.support,
        ),


      ],
      currentIndex: selectedIndex,
      onTap: (int item) async {


        switch (item) {
          case 0:
            {
              Get.toNamed(Routes.HOME);
            }
            break;

          case 1:
            {
              Get.toNamed(Routes.START_MINING);
            }
            break;

          case 2:
            {
              Get.toNamed(Routes.WITHDRAWAL);
            }
            break;

          case 3:
            {
              await launchUrl(Uri.parse(settings.support.string));
            }
            break;


          default:
            {
              Get.toNamed(Routes.HOME);
            }
        }
      },
    );
  }






}

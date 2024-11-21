import 'package:flutter/material.dart';
import 'package:get/get.dart';




import '../../l10n/app_localizations.dart';
import '../data/app_storage_maneger.dart';
import '../data/model/user.dart';
import '../routes/app_pages.dart';
import '../theme/app_colors.dart';
import '../util/app_helper.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final AppStorageManager _appStorageManager = Get.find();
  final AppHelper _appHelper =  AppHelper();
  int selectedIndex = 0;
  AppBottomNavigationBar(this.selectedIndex);

  @override
  Widget build(BuildContext context) {
   var appLocalization =  AppLocalizations.of(context);


    return BottomNavigationBar(
      unselectedItemColor: AppColors.appColor,
      unselectedLabelStyle:
          TextStyle(color: AppColors.appColor, fontWeight: FontWeight.w600),
      showUnselectedLabels: true,
      selectedItemColor: AppColors.appSecondaryColor,
      selectedLabelStyle: TextStyle(
          color: AppColors.appSecondaryColor, fontWeight: FontWeight.w600),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.insert_chart_outlined_outlined, size: 27,),
          label: appLocalization!.result,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.insert_chart_outlined, size: 27,),
          label: appLocalization!.connect_fx_account,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.area_chart_outlined, size: 27,),
          label: appLocalization!.tomorrow_signal,
        ),

        BottomNavigationBarItem(
          icon: const Icon(Icons.align_vertical_bottom_outlined, size: 27,),
          label: appLocalization!.bots,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.info, size: 27,),
          label: appLocalization!.contact,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.notifications, size: 27,),
          label: appLocalization!.news,
        ),

      ],
      currentIndex: selectedIndex,
      onTap: (int item) async {
        User user = _appStorageManager.getActiveUser();

        switch (item) {
          case 0:
            {
              Get.offAndToNamed(Routes.HOME);
            }
            break;

          case 1:
            {
              Get.offAndToNamed(Routes.CONNECT_ACCOUNT);
            }
            break;

          case 2:
            {

              Get.offAndToNamed(Routes.SIGNALS);
            }
            break;

          case 3:
            {
              Get.offAndToNamed(Routes.BOTS);
            }
            break;

          case 4:
            {
              Get.offAndToNamed(Routes.ABOUT);
            }
            break;

          case 5:
            {
              Get.offAndToNamed(Routes.NEWS);
            }
            break;


          default:
            {
              Get.offAndToNamed(Routes.HOME);
            }
        }
      },
    );
  }






}

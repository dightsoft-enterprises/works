import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../l10n/app_localizations.dart';
import '../data/service/app_storage_manager.dart';
import '../routes/app_pages.dart';
import '../theme/app_colors.dart';
import '../util/app_constant.dart';

class AppDrawer extends StatelessWidget {
  final AppStorageManager _appStorageManager = Get.find();

  @override
  Widget build(BuildContext context) {
    var user = _appStorageManager.getUserDetails();
    var appLocalization = AppLocalizations.of(context);
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: AppColors.appBarBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const Stack(
              children: [],
            ),
            decoration: BoxDecoration(
              color: AppColors.appBarBackgroundColor,
              border: Border(
                bottom: Divider.createBorderSide(context,
                    color: AppColors.appSideBarColor, width: 1.0),
              ),
            ),
            accountName: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.verified_user,
                  size: AppConstant.iconSize,
                  color: AppColors.appSideBarIconColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('${user?.firstName.string} ${user?.lastName.string}',
                    style: TextStyle(
                      fontWeight: AppConstant.fontWeight,
                      fontSize: AppConstant.fontSize,
                      color: AppColors.appSideBarColor,
                    )),
              ],
            ),
            accountEmail: Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  size: AppConstant.iconSize,
                  color: AppColors.appSideBarIconColor,
                ),
                const SizedBox(
                  width: 5,
                ),
               SizedBox(
                 width: (width-200),
                 child:  Text(
                   user!.email.string,
                   softWrap: true,

                   style: TextStyle(
                     fontWeight: AppConstant.fontWeight,
                     fontSize: AppConstant.fontHeaderSize,
                     color: AppColors.appSideBarColor,
                   ),
                 ),
               )
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.card_membership_sharp,
                  size: AppConstant.iconSize,
                  color: AppColors.appSideBarIconColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  child: Text(
                    user.id.string,
                    softWrap: true,
                    style: TextStyle(
                      fontWeight: AppConstant.fontWeight,
                      letterSpacing: 0.5,
                      fontSize: AppConstant.fontSize,
                      color: AppColors.appSideBarColor,
                    ),
                  ),
                )
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.phone_android_outlined,
                  size: AppConstant.iconSize,
                  color: AppColors.appSideBarIconColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  child: Text(
                    user.phone.value!,
                    softWrap: true,
                    style: TextStyle(
                      fontWeight: AppConstant.fontWeight,
                      letterSpacing: 0.5,
                      fontSize: AppConstant.fontSize,
                      color: AppColors.appSideBarColor,
                    ),
                  ),
                )
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.logout_outlined,
                  size: AppConstant.iconSize,
                  color: AppColors.appSideBarIconColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(appLocalization!.sign_out,
                    style: TextStyle(
                      fontWeight: AppConstant.fontWeight,
                      letterSpacing: 0.5,
                      fontSize: AppConstant.fontSize,
                      color: AppColors.appSideBarColor,
                    )),
              ],
            ),
            onTap: () {
              Navigator.of(context).pop();
              Get.offAndToNamed(Routes.LOGIN);
              _appStorageManager.removeActiveUser();
            },
          ),
        ],
      ),
    );
  }
}

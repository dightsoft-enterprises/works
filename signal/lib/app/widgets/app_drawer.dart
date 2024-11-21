import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../data/app_storage_maneger.dart';
import '../data/model/user.dart';
import '../routes/app_pages.dart';
import '../theme/app_colors.dart';


class AppDrawer extends StatelessWidget {
  final AppStorageManager _appStorageManager = Get.find();


  @override
  Widget build(BuildContext context) {
    User user = _appStorageManager.getActiveUser();

    return Drawer(
      backgroundColor: AppColors.appBackgroundLightColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: Stack(
              children: [],
            ),
            decoration: BoxDecoration(
              color: AppColors.appColor,
            ),
            accountName: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.verified_user, color: Colors.white),
                SizedBox(
                  width: 5,
                ),
                Text(user.fullName.value ?? '',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ],
            ),
            accountEmail: Row(
              children: [
                Icon(Icons.email_outlined, color: Colors.white),
                SizedBox(
                  width: 5,
                ),
                Text(user.email.value ?? '',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.logout_outlined, color: AppColors.appSecondaryColor),
                SizedBox(
                  width: 5,
                ),
                Text('logout'.tr,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87)),
              ],
            ),
            onTap: () {
              Navigator.of(context).pop();
              _appStorageManager.logout();
            },
          ),


        ],
      ),
    );
  }
}

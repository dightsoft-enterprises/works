import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:miner/app/data/models/app_notification.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../util/app_constant.dart';
import '../../../widgets/AppLanguage.dart';
import '../../../widgets/branding.dart';
import '../../../widgets/loading_icon.dart';
import '../../../widgets/net_issue.dart';
import '../../../widgets/un_available.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);

    double width = MediaQuery.of(context).size.width;
    AppTheme.statusBarSetup();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        leading:   Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
               Get.offAndToNamed(Routes.HOME);
              },
              icon: Icon(
                Icons.home,
                size: AppConstant.iconSize,
                color: AppColors.appTopBarColor,
              ),
            );
          },
        ),
        actions: [
          SizedBox(
            child:  Branding(),
          ),

        ],
      ),
      body: controller.obx(
        (data) {
          List<AppNotification> dataList = data!;
          return Container(
            margin: EdgeInsets.only(
                top: AppConstant.top,
                right: AppConstant.right,
                left: AppConstant.left),
            child: CustomScrollView(
              primary: true,
              slivers: [
                SliverList.separated(
                  itemBuilder: (BuildContext context, int index) {
                    var notification = dataList[index];

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: AppConstant.left,
                              right: AppConstant.right,
                            ),
                            child: Text(
                              notification.header.string,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: TextStyle(
                                color: AppColors.appTextSuccessColor,
                                fontSize: AppConstant.fontHeaderSize,
                                fontWeight: AppConstant.fontWeight,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: AppConstant.left,
                              right: AppConstant.right,
                            ),
                            child: Text(
                              notification.message.string,
                              textAlign: TextAlign.start,
                              softWrap: true,
                              style: TextStyle(
                                color: AppColors.appFormLabelColor,
                                fontSize: AppConstant.fontHeaderSize,
                                fontWeight: AppConstant.fontWeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      child: const Divider(
                        height: 1,
                        color: Colors.white,
                      ),
                    );
                  },
                  itemCount: dataList.length,
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
    );
  }
}

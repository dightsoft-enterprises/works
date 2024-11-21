import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/model/contact.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
import '../../../widgets/branding.dart';
import '../../../widgets/loading_icon.dart';
import '../../../widgets/net_issue.dart';
import '../../../widgets/un_available.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    var appLocalization =  AppLocalizations.of(context);
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
      body: Container(
        color: Colors.white70,
        child: Column(
          children: [
            Stack(
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
                        appLocalization!.contact,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: left, right: right),
              width: width,
              child: controller.obx(
                (data) {
                  Contact contact = data!;
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Text(
                            contact.about.value!,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                            child: Row(
                          children: [
                            Text(
                              appLocalization!.phone_,
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  color: Colors.black),
                            ),
                            Text(
                              ' ${contact.phone.value!}',
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  color: Colors.black),
                            ),
                          ],
                        )),
                        SizedBox(
                            child: Row(
                          children: [
                            Text(
                              appLocalization!.email_,
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  color: Colors.black),
                            ),
                            Text(
                              ' ${contact.email.value!}',
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  color: Colors.black),
                            ),
                          ],
                        )),
                        SizedBox(
                            child: Row(
                          children: [
                            Text(
                              appLocalization!.telegram_ling_,
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  color: Colors.black),
                            ),
                            InkWell(
                              child:  Text( appLocalization!.visit_our_telegram_channel, style: const TextStyle(color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 19,)),
                              onTap: () async {
                                await launchUrl(Uri.parse(contact.telegram.string));
                              },
                            ),
                          ],
                        ))
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
            )
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(4),
    );
  }
}

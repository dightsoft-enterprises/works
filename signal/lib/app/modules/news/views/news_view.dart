import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:signal/app/modules/bots/views/pricing_item.dart';
import 'package:signal/app/modules/news/controllers/news_controller.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../data/model/news.dart';
import '../../../data/model/pricing.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
import '../../../widgets/branding.dart';
import '../../../widgets/loading_icon.dart';
import '../../../widgets/net_issue.dart';
import '../../../widgets/un_available.dart';


class NewsView extends GetView<NewsController> {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    var appLocalization =  AppLocalizations.of(context);

    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double left = 15;
    double right = 15;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        actions: [
          Branding(),
        ],
      ),
      body: SingleChildScrollView(
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
                      appLocalization!.news_and_market_insight,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width,
              height: height,
              child: controller.obx(
                    (data) {
                  List<News> newsList = data!;
                  return ListView.separated(
                      itemCount: newsList.length,
                      primary: false,
                      separatorBuilder: (BuildContext context,
                          int index) => const SizedBox(height: 10),
                      itemBuilder: (BuildContext context, int index) {
                        News news = newsList[index];
                        return Column(
                          children: [
                            SizedBox(
                              child: Text(
                                news.header.string,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            SizedBox(
                              child: Text(
                                news.description.string,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black87),
                              ),
                            ),
                          ],
                        );
                      });
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
      bottomNavigationBar: AppBottomNavigationBar(5),
    );
  }
}

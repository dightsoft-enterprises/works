import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:language_picker/languages.dart';

import '../../l10n/app_localizations.dart';
import '../data/models/item_list.dart';
import '../data/models/subscriber.dart';
import '../routes/app_pages.dart';
import '../theme/app_colors.dart';

class AppConstant {
  static double top = 10;
  static double miningTop = 1;
  static double gridTop = 25;
  static double smallLeft = 10.0;
  static double left = 25.0;
  static double right = 25.0;
  static double formTop = 4.0;
  static double cursorWidth = 1.0;
  static double fontSize = 16.0;

  static double smallFontSize = 12.0;
  static double errorFontSize = 12.0;
  static double fontSizeSmall = 13.0;
  static double fontHeaderSize = 20.0;
  static double fontMediumHeaderSize = 30.0;
  static double fontBigHeaderSize = 40.0;
  static double iconSize = 20.0;
  static double iconBigSize = 25.0;
  static double iconLargeSize = 38.0;
  static double formFieldHeight = 43.0;
  static double formFieldPadding = 6.0;

  static FontWeight fontWeight = FontWeight.w500;
  static FontWeight bigHeaderFontWeight = FontWeight.w600;

  convertNumber(double number) {
    return number.toStringAsFixed(8);
  }

  static double defaultDouble = 0.00000000;

  static String baseUrl = 'https://www.mashapipro.com/api/';

  //static String baseUrl = 'http://192.168.1.1/api/';

  static bool isAdmin = true;
  static String notificationTopic = "general";
  static String appName = "HASHVAULTP";
  static String activeUser = "MINER_ACTIVE_USER";
  static String clientCode = "MINER_CODE";
  static String settings = "MINER_SETTINGS";
  static String notification = "MINER_ALERT";
  static String registeredDevice = "MINER_DEVICE_REGISTERED";
  static String languageKey = "MINER_LANGUAGE_KEY";
  static String timeSpent = "MINER_TIME_SPENT";

  static List<String> getLocales() {
    List<String> language = [
      Languages.english.nativeName,
      Languages.spanish.nativeName,
      Languages.arabic.nativeName,
      Languages.portuguese.nativeName,
      Languages.italian.nativeName,
      Languages.french.nativeName,
    ];
    return language;
  }

  static getLocale(text) {
    if (text == Languages.english.nativeName) {
      Get.updateLocale(const Locale('en'));
    } else if (text == Languages.spanish.nativeName) {
      Get.updateLocale(const Locale('es'));
    } else if (text == Languages.arabic.nativeName) {
      Get.updateLocale(const Locale('ar'));
    } else if (text == Languages.portuguese.nativeName) {
      Get.updateLocale(const Locale('pt'));
    } else if (text == Languages.french.nativeName) {
      Get.updateLocale(const Locale('fr'));
    } else if (text == Languages.italian.nativeName) {
      Get.updateLocale(const Locale('it'));
    }
  }

  static getLanguages() {
    Map<String, String> supportedLanguages = {
      'en': 'US', // English (United States)
      'fr': 'FR', // French (France)
      'de': 'DE', // German (Germany)
      'zh': 'CN', // Chinese (Simplified: China)
      'ja': 'JP', // Japanese (Japan)
      'ko': 'KR', // Korean (South Korea)
      'pt': 'BR', // Portuguese (Brazil)
      'ar': 'SA', // Arabic (Saudi Arabia)
      'ru': 'RU', // Russian (Russia)
      'it': 'IT', // Italian (Italy)
      'hi': 'IN', // Hindi (India)
      'bn': 'IN', // Bengali (India)
      'es': 'ES', // Spanish (Spain)
      'nl': 'NL', // Dutch (Netherlands)
      'cs': 'CZ', // Czech (Czech Republic)
      'tr': 'TR', // Turkish (Turkey)
    };
    List<Map<String, String>> dataList = List.empty(growable: true);
    dataList.add(supportedLanguages);

    return dataList;
  }

  static List<Locale> supportedLocales = [
    Locale('en'), // English (United States)
    Locale('fr'), // French (France)
    Locale('de'), // German (Germany)
    Locale('zh'), // Chinese (Simplified, China)
    Locale('zh'), // Chinese (Traditional, Taiwan)
    Locale('ja'), // Japanese (Japan)
    Locale('ko'), // Korean (South Korea)
    Locale('pt'), // Portuguese (Brazil)
    Locale('ar'), // Arabic (Saudi Arabia)
    Locale('ru'), // Russian (Russia)
    Locale('it'), // Italian (Italy)
    Locale('hi'), // Hindi (India)
    Locale('bn'), // Bengali (India)
    Locale('es'), // Spanish (Spain)
  ];

  static List<ItemList> currencyList(Subscriber data) {
    List<ItemList> dataList = List.empty(growable: true);
    if (data.bitcoin.value == null) {
      dataList.add(ItemList("Bitcoin", "BTC", 0));
    } else {
      dataList.add(ItemList("Bitcoin", "BTC", data.bitcoin.value!));
    }

    if (data.bitcoin.value == null) {
      dataList.add(ItemList("Ethereum", "ETH", 0));
    } else {
      dataList.add(ItemList("Ethereum", "ETH", data.ethereum.value!));
    }

    if (data.bitcoin.value == null) {
      dataList.add(ItemList("Binance", "BNB", 0));
    } else {
      dataList.add(ItemList("Binance", "BNB", data.binance.value!));
    }

    if (data.bitcoin.value == null) {
      dataList.add(ItemList("Litecoin", "LTC", 0));
    } else {
      dataList.add(ItemList("Litecoin", "LTC", data.litecoin.value!));
    }

    if (data.bitcoin.value == null) {
      dataList.add(ItemList("Tether", "USDT", 0));
    } else {
      dataList.add(ItemList("Tether", "USDT", data.tether.value!));
    }

    if (data.bitcoin.value == null) {
      dataList.add(ItemList("TRON", "TRON", 0));
    } else {
      dataList.add(ItemList("TRON", "TRON", data.tron.value!));
    }

    return dataList;
  }

  static List<String> acceptedCurrency() {
    List<String> dataList = ['BTC', 'ETH', 'BNB', 'LTC', 'USDT', 'TRON'];
    return dataList;
  }

  static List<String> getList(String data) {
    List<String> rows = List.empty(growable: true);
    if (data == '' || data == null) {
      return rows;
    }
    List<String> itemList = data.split(',');
    return itemList;
  }

  static getAmount(value) {
    if (value != null) {
      var p = value + 0.0;
      return p;
    }
    return 0.00;
  }

  static String formatAmount(double amount, cond) {
    var currency = '';
    if (cond) {
      currency = '\$';
    }
    if (amount == null || amount == 0) {
      return '${currency}0.0000';
    }

    return '$currency${amount.toStringAsFixed(4)}';
  }

  static setColor(int number) {
    var color1 = Colors.blue;
    var color2 = Colors.green;
    var color3 = Colors.purple;
    var color4 = Colors.teal;

    if (number == 0) {
      return color1;
    } else if (number == 1) {
      return color2;
    } else if (number == 2) {
      return color3;
    } else if (number == 3) {
      return color4;
    } else {
      return color1;
    }
  }
}

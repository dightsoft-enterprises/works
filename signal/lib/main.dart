import 'dart:io';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/data/service/application_settings_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';
import 'app/translations/app_translations.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  const supportedLocales = [
    Locale('en', 'US'), // English (United States)
    Locale('es', 'MX'), // Spanish (Mexico)
    Locale('fr', 'FR'), // French (France)
    Locale('de', 'DE'), // German (Germany)
    Locale('zh', 'CN'), // Chinese (Simplified, China)
    Locale('zh', 'TW'), // Chinese (Traditional, Taiwan)
    Locale('ja', 'JP'), // Japanese (Japan)
    Locale('ko', 'KR'), // Korean (South Korea)
    Locale('pt', 'BR'), // Portuguese (Brazil)
    Locale('ar', 'SA'), // Arabic (Saudi Arabia)
    Locale('ru', 'RU'), // Russian (Russia)
    Locale('it', 'IT'), // Italian (Italy)
    Locale('hi', 'IN'), // Hindi (India)
    Locale('bn', 'IN'), // Bengali (India)
    Locale('es', 'ES'), // Spanish (Spain)
    Locale('fr', 'CA'), // French (Canada)
    Locale('de', 'AT'), // German (Austria)
    Locale('de', 'CH'), // German (Switzerland)
    Locale('nl', 'NL'), // Dutch (Netherlands)
    Locale('sv', 'SE'), // Swedish (Sweden)
    Locale('da', 'DK'), // Danish (Denmark)
    Locale('no', 'NO'), // Norwegian (Norway)
    Locale('fi', 'FI'), // Finnish (Finland)
    Locale('pl', 'PL'), // Polish (Poland)
    Locale('cs', 'CZ'), // Czech (Czech Republic)
    Locale('hu', 'HU'), // Hungarian (Hungary)
    Locale('el', 'GR'), // Greek (Greece)
    Locale('tr', 'TR'), // Turkish (Turkey)
    Locale('he', 'IL'), // Hebrew (Israel)
    Locale('th', 'TH'), // Thai (Thailand)
    Locale('id', 'ID'), // Indonesian (Indonesia)
    Locale('ms', 'MY'), // Malay (Malaysia)
    Locale('vi', 'VN'), // Vietnamese (Vietnam)
    Locale('uk', 'UA'), // Ukrainian (Ukraine)
    Locale('ro', 'RO'), // Romanian (Romania)
    Locale('bg', 'BG'), // Bulgarian (Bulgaria)
    Locale('hr', 'HR'), // Croatian (Croatia)
    Locale('sk', 'SK'), // Slovak (Slovakia)
    Locale('sl', 'SI'), // Slovenian (Slovenia)
    Locale('lt', 'LT'), // Lithuanian (Lithuania)
    Locale('lv', 'LV'), // Latvian (Latvia)
    Locale('et', 'EE'), // Estonian (Estonia)
  ];

  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationSettingsBinding.initServices();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      fallbackLocale: const Locale('en', 'US'),
      locale: Get.deviceLocale,
      translations: AppTranslations(),
      theme: AppTheme.appThemeData,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
    ),
  );
}

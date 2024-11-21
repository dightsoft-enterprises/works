import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_no.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bg'),
    Locale('bn'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('et'),
    Locale('fi'),
    Locale('fr'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('lt'),
    Locale('lv'),
    Locale('ms'),
    Locale('nl'),
    Locale('no'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sl'),
    Locale('sv'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh')
  ];

  /// No description provided for @email_address.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email_address;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get sign_in;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @net_error.
  ///
  /// In en, this message translates to:
  /// **'unAvailable'**
  String get net_error;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @news_and_market_insight.
  ///
  /// In en, this message translates to:
  /// **'NEWS AND MARKET INSIGHTS'**
  String get news_and_market_insight;

  /// No description provided for @visit_our_telegram_channel.
  ///
  /// In en, this message translates to:
  /// **'Our Telegram Channel'**
  String get visit_our_telegram_channel;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @access_signal.
  ///
  /// In en, this message translates to:
  /// **'Get Access to Our Next Trade Opportunities'**
  String get access_signal;

  /// No description provided for @secret_key.
  ///
  /// In en, this message translates to:
  /// **'Secret Key'**
  String get secret_key;

  /// No description provided for @passkey.
  ///
  /// In en, this message translates to:
  /// **'Passkey'**
  String get passkey;

  /// No description provided for @provide_valid_passkey.
  ///
  /// In en, this message translates to:
  /// **'Please Provide A Valid Passkey'**
  String get provide_valid_passkey;

  /// No description provided for @tomorrow_signal.
  ///
  /// In en, this message translates to:
  /// **'Signal'**
  String get tomorrow_signal;

  /// No description provided for @connect_fx_account.
  ///
  /// In en, this message translates to:
  /// **'Bot Trading'**
  String get connect_fx_account;

  /// No description provided for @end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// No description provided for @wrong_secret_key.
  ///
  /// In en, this message translates to:
  /// **'Invalid Secret Key'**
  String get wrong_secret_key;

  /// No description provided for @activated.
  ///
  /// In en, this message translates to:
  /// **'Activated'**
  String get activated;

  /// No description provided for @access_signal_sub_header.
  ///
  /// In en, this message translates to:
  /// **'Top Secret Market Signals and Analysis from Banks, Hedge Funds, AI and Robots.'**
  String get access_signal_sub_header;

  /// No description provided for @provide_pass_key.
  ///
  /// In en, this message translates to:
  /// **'Provide Your PassKey'**
  String get provide_pass_key;

  /// No description provided for @provide_secret_key.
  ///
  /// In en, this message translates to:
  /// **'PROVIDE A VALID SECRET KEY / PASSWORD'**
  String get provide_secret_key;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @server.
  ///
  /// In en, this message translates to:
  /// **'Server'**
  String get server;

  /// No description provided for @broker_server.
  ///
  /// In en, this message translates to:
  /// **'Broker Name / Server'**
  String get broker_server;

  /// No description provided for @continue_text.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_text;

  /// No description provided for @mt_account.
  ///
  /// In en, this message translates to:
  /// **'MT Account'**
  String get mt_account;

  /// No description provided for @mt_password.
  ///
  /// In en, this message translates to:
  /// **'Your MT4 / MT5 Password'**
  String get mt_password;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @lunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get lunch;

  /// No description provided for @fx_account_header.
  ///
  /// In en, this message translates to:
  /// **'Double Your Capital with Bots Trading, Connect Account Now!!'**
  String get fx_account_header;

  /// No description provided for @result.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get result;

  /// No description provided for @bots.
  ///
  /// In en, this message translates to:
  /// **'Bots'**
  String get bots;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @signal.
  ///
  /// In en, this message translates to:
  /// **'Signal'**
  String get signal;

  /// No description provided for @roi.
  ///
  /// In en, this message translates to:
  /// **'Returns/ROI '**
  String get roi;

  /// No description provided for @result_summary.
  ///
  /// In en, this message translates to:
  /// **'Performance Summary'**
  String get result_summary;

  /// No description provided for @stop_loss.
  ///
  /// In en, this message translates to:
  /// **'Stop Loss'**
  String get stop_loss;

  /// No description provided for @profit.
  ///
  /// In en, this message translates to:
  /// **'Profit'**
  String get profit;

  /// No description provided for @take_profit.
  ///
  /// In en, this message translates to:
  /// **'Take Profit'**
  String get take_profit;

  /// No description provided for @sell_at.
  ///
  /// In en, this message translates to:
  /// **'Sell at'**
  String get sell_at;

  /// No description provided for @buy_at.
  ///
  /// In en, this message translates to:
  /// **'Buy at'**
  String get buy_at;

  /// No description provided for @trade_complete.
  ///
  /// In en, this message translates to:
  /// **'Trade Completed'**
  String get trade_complete;

  /// No description provided for @maxdrawdown.
  ///
  /// In en, this message translates to:
  /// **'Max Drawdown'**
  String get maxdrawdown;

  /// No description provided for @projected_roi_profit.
  ///
  /// In en, this message translates to:
  /// **'Projected ROI/Profits '**
  String get projected_roi_profit;

  /// No description provided for @roi_profit.
  ///
  /// In en, this message translates to:
  /// **'ROI/Profits '**
  String get roi_profit;

  /// No description provided for @lost.
  ///
  /// In en, this message translates to:
  /// **'LOSS'**
  String get lost;

  /// No description provided for @won.
  ///
  /// In en, this message translates to:
  /// **'WON'**
  String get won;

  /// No description provided for @unsuccessful.
  ///
  /// In en, this message translates to:
  /// **'Unsuccessful'**
  String get unsuccessful;

  /// No description provided for @completed_successfully.
  ///
  /// In en, this message translates to:
  /// **'Completed Successfully'**
  String get completed_successfully;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @min_deposit.
  ///
  /// In en, this message translates to:
  /// **'Minimum Deposit'**
  String get min_deposit;

  /// No description provided for @max_deposit.
  ///
  /// In en, this message translates to:
  /// **'Maximum Deposit'**
  String get max_deposit;

  /// No description provided for @password_reset_code.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit pin'**
  String get password_reset_code;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @phone_.
  ///
  /// In en, this message translates to:
  /// **'Phone: '**
  String get phone_;

  /// No description provided for @email_.
  ///
  /// In en, this message translates to:
  /// **'Email: '**
  String get email_;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price: '**
  String get price;

  /// No description provided for @pricing_plan.
  ///
  /// In en, this message translates to:
  /// **'BOTS'**
  String get pricing_plan;

  /// No description provided for @telegram_ling_.
  ///
  /// In en, this message translates to:
  /// **'Telegram: '**
  String get telegram_ling_;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get view_all;

  /// No description provided for @no_record_found.
  ///
  /// In en, this message translates to:
  /// **'NO RECORD FOUND'**
  String get no_record_found;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @bad_credential.
  ///
  /// In en, this message translates to:
  /// **'Bad Credential'**
  String get bad_credential;

  /// No description provided for @please_provide_valid_email.
  ///
  /// In en, this message translates to:
  /// **'Please provide Valid Email'**
  String get please_provide_valid_email;

  /// No description provided for @password_field.
  ///
  /// In en, this message translates to:
  /// **'Password Must be More Than Six Characters'**
  String get password_field;

  /// No description provided for @field_is_required.
  ///
  /// In en, this message translates to:
  /// **'Field Is Required'**
  String get field_is_required;

  /// No description provided for @dont_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Don\"t have an account?'**
  String get dont_have_an_account;

  /// No description provided for @please_sign_in.
  ///
  /// In en, this message translates to:
  /// **'Please Sign In'**
  String get please_sign_in;

  /// No description provided for @already_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_an_account;

  /// No description provided for @register_header.
  ///
  /// In en, this message translates to:
  /// **'Nice To Meet You\nPlease Register'**
  String get register_header;

  /// No description provided for @activation_code.
  ///
  /// In en, this message translates to:
  /// **'Activation Code'**
  String get activation_code;

  /// No description provided for @instruments_dot.
  ///
  /// In en, this message translates to:
  /// **'Instruments: '**
  String get instruments_dot;

  /// No description provided for @wrong_code_key.
  ///
  /// In en, this message translates to:
  /// **'Invalid Code'**
  String get wrong_code_key;

  /// No description provided for @device_activation.
  ///
  /// In en, this message translates to:
  /// **'Device Activation'**
  String get device_activation;

  /// No description provided for @trade_optimization.
  ///
  /// In en, this message translates to:
  /// **'Trade Optimization'**
  String get trade_optimization;

  /// No description provided for @news_trading.
  ///
  /// In en, this message translates to:
  /// **'News Trading'**
  String get news_trading;

  /// No description provided for @live_demo_account.
  ///
  /// In en, this message translates to:
  /// **'Live/Demo Account'**
  String get live_demo_account;

  /// No description provided for @pro_firm_trading.
  ///
  /// In en, this message translates to:
  /// **'Prop Firm Trading'**
  String get pro_firm_trading;

  /// No description provided for @no_loss_trading.
  ///
  /// In en, this message translates to:
  /// **'No Loss Trading'**
  String get no_loss_trading;

  /// No description provided for @phone_or_computer.
  ///
  /// In en, this message translates to:
  /// **'Phone/Computer'**
  String get phone_or_computer;

  /// No description provided for @weekly_returns.
  ///
  /// In en, this message translates to:
  /// **'Weekly Returns'**
  String get weekly_returns;

  /// No description provided for @daily_returns.
  ///
  /// In en, this message translates to:
  /// **'Daily Returns'**
  String get daily_returns;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// No description provided for @pricing_plan_paid_for.
  ///
  /// In en, this message translates to:
  /// **'Select a bot Paid For'**
  String get pricing_plan_paid_for;

  /// No description provided for @signals_head.
  ///
  /// In en, this message translates to:
  /// **'SIGNALS: Forex, Cryptocurrencies, Commodities, Indexes, NASDAQ, Binary Options.'**
  String get signals_head;

  /// No description provided for @signals_yearly_price.
  ///
  /// In en, this message translates to:
  /// **'Yearly Price/Access: \$300'**
  String get signals_yearly_price;

  /// No description provided for @signals_lifetime_price.
  ///
  /// In en, this message translates to:
  /// **'Lifetime Price/Access: \$500'**
  String get signals_lifetime_price;

  /// No description provided for @choose_trading_mode.
  ///
  /// In en, this message translates to:
  /// **'Choose Trading Mode'**
  String get choose_trading_mode;

  /// No description provided for @signal_strength.
  ///
  /// In en, this message translates to:
  /// **'Signal Strength Accuracy'**
  String get signal_strength;

  /// No description provided for @currency_pair_trade.
  ///
  /// In en, this message translates to:
  /// **'Currency Pairs To Trade?'**
  String get currency_pair_trade;

  /// No description provided for @take_profit_p.
  ///
  /// In en, this message translates to:
  /// **'TAKE PROFIT?'**
  String get take_profit_p;

  /// No description provided for @max_drawdown_p.
  ///
  /// In en, this message translates to:
  /// **'MAX DRAWDOWN?'**
  String get max_drawdown_p;

  /// No description provided for @vps_p.
  ///
  /// In en, this message translates to:
  /// **'Virtual Private Server (VPS)'**
  String get vps_p;

  /// No description provided for @trade_on_device.
  ///
  /// In en, this message translates to:
  /// **'Trade On Device'**
  String get trade_on_device;

  /// No description provided for @connect_now.
  ///
  /// In en, this message translates to:
  /// **'Start Trading Now'**
  String get connect_now;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'bg', 'bn', 'cs', 'da', 'de', 'el', 'en', 'es', 'et', 'fi', 'fr', 'he', 'hi', 'hr', 'hu', 'id', 'it', 'ja', 'ko', 'lt', 'lv', 'ms', 'nl', 'no', 'pl', 'pt', 'ro', 'ru', 'sl', 'sv', 'th', 'tr', 'uk', 'vi', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'bg': return AppLocalizationsBg();
    case 'bn': return AppLocalizationsBn();
    case 'cs': return AppLocalizationsCs();
    case 'da': return AppLocalizationsDa();
    case 'de': return AppLocalizationsDe();
    case 'el': return AppLocalizationsEl();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'et': return AppLocalizationsEt();
    case 'fi': return AppLocalizationsFi();
    case 'fr': return AppLocalizationsFr();
    case 'he': return AppLocalizationsHe();
    case 'hi': return AppLocalizationsHi();
    case 'hr': return AppLocalizationsHr();
    case 'hu': return AppLocalizationsHu();
    case 'id': return AppLocalizationsId();
    case 'it': return AppLocalizationsIt();
    case 'ja': return AppLocalizationsJa();
    case 'ko': return AppLocalizationsKo();
    case 'lt': return AppLocalizationsLt();
    case 'lv': return AppLocalizationsLv();
    case 'ms': return AppLocalizationsMs();
    case 'nl': return AppLocalizationsNl();
    case 'no': return AppLocalizationsNo();
    case 'pl': return AppLocalizationsPl();
    case 'pt': return AppLocalizationsPt();
    case 'ro': return AppLocalizationsRo();
    case 'ru': return AppLocalizationsRu();
    case 'sl': return AppLocalizationsSl();
    case 'sv': return AppLocalizationsSv();
    case 'th': return AppLocalizationsTh();
    case 'tr': return AppLocalizationsTr();
    case 'uk': return AppLocalizationsUk();
    case 'vi': return AppLocalizationsVi();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

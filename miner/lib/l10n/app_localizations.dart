import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';

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
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('pt')
  ];

  /// No description provided for @start_mining.
  ///
  /// In en, this message translates to:
  /// **'Start Mining'**
  String get start_mining;

  /// No description provided for @field_is_required.
  ///
  /// In en, this message translates to:
  /// **'field is required'**
  String get field_is_required;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @first_name.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get first_name;

  /// No description provided for @last_name.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get last_name;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

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

  /// No description provided for @start_trading.
  ///
  /// In en, this message translates to:
  /// **'Start Trading'**
  String get start_trading;

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

  /// No description provided for @remember_me.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get remember_me;

  /// No description provided for @forgot_password_.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password_;

  /// No description provided for @sign_in_description.
  ///
  /// In en, this message translates to:
  /// **'Please Sign In'**
  String get sign_in_description;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @sign_out.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get sign_out;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account yet?'**
  String get dont_have_account;

  /// No description provided for @have_account.
  ///
  /// In en, this message translates to:
  /// **'Already registered?'**
  String get have_account;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @withdrawal.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal'**
  String get withdrawal;

  /// No description provided for @wallet_balance.
  ///
  /// In en, this message translates to:
  /// **'Wallet Balance'**
  String get wallet_balance;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @account_verification.
  ///
  /// In en, this message translates to:
  /// **'Account Verification'**
  String get account_verification;

  /// No description provided for @verification_code.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verification_code;

  /// No description provided for @mining_packages.
  ///
  /// In en, this message translates to:
  /// **'Mining Plans'**
  String get mining_packages;

  /// No description provided for @mine_block.
  ///
  /// In en, this message translates to:
  /// **'Mine Now'**
  String get mine_block;

  /// No description provided for @checked.
  ///
  /// In en, this message translates to:
  /// **'Checked'**
  String get checked;

  /// No description provided for @found.
  ///
  /// In en, this message translates to:
  /// **'Found'**
  String get found;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @mine_currency_header.
  ///
  /// In en, this message translates to:
  /// **'Generate Blockchain Assets'**
  String get mine_currency_header;

  /// No description provided for @time_remaining.
  ///
  /// In en, this message translates to:
  /// **'Time Remaining'**
  String get time_remaining;

  /// No description provided for @hash_rate.
  ///
  /// In en, this message translates to:
  /// **'Hash Rate'**
  String get hash_rate;

  /// No description provided for @block_reward.
  ///
  /// In en, this message translates to:
  /// **'Block Reward'**
  String get block_reward;

  /// No description provided for @login_failed_message.
  ///
  /// In en, this message translates to:
  /// **'Wrong Password/Email'**
  String get login_failed_message;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @how_to_pay.
  ///
  /// In en, this message translates to:
  /// **'How to pay'**
  String get how_to_pay;

  /// No description provided for @buy_now.
  ///
  /// In en, this message translates to:
  /// **'Buy Now'**
  String get buy_now;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @insufficient_fund.
  ///
  /// In en, this message translates to:
  /// **'Insufficient Fund'**
  String get insufficient_fund;

  /// No description provided for @enter_bitcoin_address.
  ///
  /// In en, this message translates to:
  /// **'Enter Bitcoin Address'**
  String get enter_bitcoin_address;

  /// No description provided for @enter_ethereum_address.
  ///
  /// In en, this message translates to:
  /// **'Enter Ethereum Address'**
  String get enter_ethereum_address;

  /// No description provided for @enter_binance_address.
  ///
  /// In en, this message translates to:
  /// **'Enter Binance Address'**
  String get enter_binance_address;

  /// No description provided for @enter_litecoin_address.
  ///
  /// In en, this message translates to:
  /// **'Enter Litecoin Address'**
  String get enter_litecoin_address;

  /// No description provided for @enter_tether_address.
  ///
  /// In en, this message translates to:
  /// **'Enter Tether Address'**
  String get enter_tether_address;

  /// No description provided for @enter_tron_address.
  ///
  /// In en, this message translates to:
  /// **'Enter TRON Address'**
  String get enter_tron_address;

  /// No description provided for @network_percentage.
  ///
  /// In en, this message translates to:
  /// **'Network Percentage'**
  String get network_percentage;

  /// No description provided for @network_hash_rate.
  ///
  /// In en, this message translates to:
  /// **'Network Hash Rate'**
  String get network_hash_rate;

  /// No description provided for @pool_hash_rate.
  ///
  /// In en, this message translates to:
  /// **'Pool Hash Rate'**
  String get pool_hash_rate;

  /// No description provided for @miners.
  ///
  /// In en, this message translates to:
  /// **'Miners'**
  String get miners;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enter;

  /// No description provided for @trade_now.
  ///
  /// In en, this message translates to:
  /// **'Trade Now'**
  String get trade_now;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @coin_balance.
  ///
  /// In en, this message translates to:
  /// **'Coin Balance'**
  String get coin_balance;

  /// No description provided for @block_found.
  ///
  /// In en, this message translates to:
  /// **'Block Found'**
  String get block_found;

  /// No description provided for @account_verification_message.
  ///
  /// In en, this message translates to:
  /// **'Kindly enter the verification code sent to your email to complete your registration'**
  String get account_verification_message;

  /// No description provided for @current_effort.
  ///
  /// In en, this message translates to:
  /// **'Current Effort'**
  String get current_effort;

  /// No description provided for @wrong_code.
  ///
  /// In en, this message translates to:
  /// **'Wrong Code'**
  String get wrong_code;

  /// No description provided for @timeout.
  ///
  /// In en, this message translates to:
  /// **'Timeout'**
  String get timeout;

  /// No description provided for @password_reset.
  ///
  /// In en, this message translates to:
  /// **'Password Reset'**
  String get password_reset;

  /// No description provided for @password_reset_message.
  ///
  /// In en, this message translates to:
  /// **'Kindly enter the code sent to your email'**
  String get password_reset_message;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @email_not_valid.
  ///
  /// In en, this message translates to:
  /// **'Email not valid'**
  String get email_not_valid;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get new_password;

  /// No description provided for @s.
  ///
  /// In en, this message translates to:
  /// **'s'**
  String get s;

  /// No description provided for @wait_before_resend.
  ///
  /// In en, this message translates to:
  /// **'Wait before resend'**
  String get wait_before_resend;

  /// No description provided for @mining_timeout_header.
  ///
  /// In en, this message translates to:
  /// **'Timeout'**
  String get mining_timeout_header;

  /// No description provided for @minimum_withdrawal_message.
  ///
  /// In en, this message translates to:
  /// **'Please enter an amount that meets or exceeds the minimum withdrawal limit.'**
  String get minimum_withdrawal_message;

  /// No description provided for @transaction_successful.
  ///
  /// In en, this message translates to:
  /// **'Transaction Successful'**
  String get transaction_successful;

  /// No description provided for @forgot_password_message.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to reset your password'**
  String get forgot_password_message;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'es', 'fr', 'it', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'it': return AppLocalizationsIt();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

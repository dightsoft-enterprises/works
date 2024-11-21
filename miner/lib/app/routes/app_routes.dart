part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const CUSTOMER_VERIFICATION = _Paths.CUSTOMER_VERIFICATION;
  static const MINING_TERMS = _Paths.MINING_TERMS;
  static const START_MINING = _Paths.START_MINING;
  static const PROFILE = _Paths.PROFILE;
  static const WITHDRAWAL = _Paths.WITHDRAWAL;
  static const FORUM = _Paths.FORUM;
  static const PRICING = _Paths.PRICING;

  static const PAYMENT = _Paths.PAYMENT;
  static const NOTIFICATION = _Paths.NOTIFICATION;
  static const PASSWORD_RESET = _Paths.PASSWORD_RESET;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const CUSTOMER_VERIFICATION = '/customer-verification';
  static const MINING_TERMS = '/mining-terms';
  static const START_MINING = '/start-mining';
  static const PROFILE = '/profile';
  static const WITHDRAWAL = '/withdrawal';
  static const FORUM = '/forum';
  static const PRICING = '/pricing';
  static const PAYMENT = '/payment';
  static const NOTIFICATION = '/notification';
  static const PASSWORD_RESET = '/password-reset';
}

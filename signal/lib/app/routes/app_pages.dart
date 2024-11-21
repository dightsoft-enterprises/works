import 'package:get/get.dart';
import 'package:signal/app/middleware/authorization_middleware.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/botLevel1/bindings/bot_level1_binding.dart';
import '../modules/botLevel1/views/bot_level1_view.dart';
import '../modules/botLevel2/bindings/bot_level2_binding.dart';
import '../modules/botLevel2/views/bot_level2_view.dart';
import '../modules/bots/bindings/bots_binding.dart';
import '../modules/bots/views/bots_view.dart';
import '../modules/connectAccount/bindings/connect_account_binding.dart';
import '../modules/connectAccount/views/connect_account_view.dart';
import '../modules/device/bindings/device_binding.dart';
import '../modules/device/views/device_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';
import '../modules/passKey/bindings/pass_key_binding.dart';
import '../modules/passKey/views/pass_key_view.dart';
import '../modules/signalLevel2/bindings/signal_level2_binding.dart';
import '../modules/signalLevel2/views/signal_level2_view.dart';
import '../modules/signals/bindings/signals_binding.dart';
import '../modules/signals/views/signals_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        middlewares: [AuthorizationMiddleware()]),
    GetPage(
        name: _Paths.DEVICE,
        page: () =>  DeviceView(),
        binding: DeviceBinding(),
       ),
    GetPage(
      name: _Paths.LOGIN,
      page: () =>  LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: _Paths.CONNECT_ACCOUNT,
        page: () => ConnectAccountView(),
        binding: ConnectAccountBinding(),
        middlewares: [AuthorizationMiddleware()]),
    GetPage(
        name: _Paths.SIGNALS,
        page: () => SignalsView(),
        binding: SignalsBinding(),
        middlewares: [AuthorizationMiddleware()]),
    GetPage(
        name: _Paths.PASS_KEY,
        page: () => PassKeyView(),
        binding: PassKeyBinding(),
        middlewares: [AuthorizationMiddleware()]),
    GetPage(
        name: _Paths.BOTS,
        page: () => const BotsView(),
        binding: BotsBinding(),
        middlewares: [AuthorizationMiddleware()]),
    GetPage(
        name: _Paths.ABOUT,
        page: () => const AboutView(),
        binding: AboutBinding(),
        middlewares: [AuthorizationMiddleware()]),
    GetPage(
        name: _Paths.NEWS,
        page: () => const NewsView(),
        binding: NewsBinding(),
        middlewares: [AuthorizationMiddleware()]),
    GetPage(
        name: _Paths.SIGNAL_LEVEL2,
        page: () => const SignalLevel2View(),
        binding: SignalLevel2Binding(),
        middlewares: [AuthorizationMiddleware()]),

    GetPage(
        name: _Paths.BOT_LEVEL1,
        page: () =>  BotLevel1View(),
        binding:  BotLevel1Binding(),
        middlewares: [AuthorizationMiddleware()]),
    GetPage(
        name: _Paths.BOT_LEVEL2,
        page: () =>  BotLevel2View(),
        binding:  BotLevel2Binding(),
        middlewares: [AuthorizationMiddleware()]),
  ];
}

import 'package:get/get.dart';

import '../middleware/authorization_middleware.dart';
import '../middleware/notification_middleware.dart';
import '../modules/customer_verification/bindings/customer_verification_binding.dart';
import '../modules/customer_verification/views/customer_verification_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/forum/bindings/forum_binding.dart';
import '../modules/forum/views/forum_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mining_terms/bindings/mining_terms_binding.dart';
import '../modules/mining_terms/views/mining_terms_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/passwordReset/bindings/password_reset_binding.dart';
import '../modules/passwordReset/views/password_reset_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/pricing/bindings/pricing_binding.dart';
import '../modules/pricing/views/pricing_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/start_mining/bindings/start_mining_binding.dart';
import '../modules/start_mining/views/start_mining_view.dart';
import '../modules/withdrawal/bindings/withdrawal_binding.dart';
import '../modules/withdrawal/views/withdrawal_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthorizationMiddleware()],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_VERIFICATION,
      page: () => CustomerVerificationView(),
      binding: CustomerVerificationBinding(),
    ),
    GetPage(
      name: _Paths.MINING_TERMS,
      page: () => MiningTermsView(),
      binding: MiningTermsBinding(),
      middlewares: [AuthorizationMiddleware()],
    ),
    GetPage(
      name: _Paths.START_MINING,
      page: () => StartMiningView(),
      binding: StartMiningBinding(),
      middlewares: [AuthorizationMiddleware()],
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      middlewares: [AuthorizationMiddleware()],
    ),
    GetPage(
      name: _Paths.WITHDRAWAL,
      page: () => WithdrawalView(),
      binding: WithdrawalBinding(),
      middlewares: [AuthorizationMiddleware()],
    ),
    GetPage(
      name: _Paths.FORUM,
      page: () => const ForumView(),
      binding: ForumBinding(),
    ),
    GetPage(
      name: _Paths.PRICING,
      page: () => PricingView(),
      binding: PricingBinding(),
      middlewares: [AuthorizationMiddleware()],
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
      middlewares: [AuthorizationMiddleware()],
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_RESET,
      page: () =>  PasswordResetView(),
      binding: PasswordResetBinding(),
    ),
  ];
}

import 'package:get/get.dart';

import '../modules/home/profile/profile_controller.dart';
import '../modules/home/estimation/estimation_controller.dart';
import '../modules/home/estimation/estimation_page.dart';
import '../modules/home/plantation/plantation.dart';
import '../modules/home/profile/profile_page.dart';
import '../modules/home/home/home.dart';
import '../modules/login/login.dart';
import '../modules/estimate_result/estimate_result.dart';
import '../modules/water_quality/water_quality.dart';
import '../modules/water_savings/water_savings.dart';
import '../modules/register/register.dart';

List<GetPage> getAppPages() {
  return [
    GetPage(
      name: HomeScreen.route,
      page: () => const HomeScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => EstimationController())),
        BindingsBuilder(() => Get.lazyPut(() => ProfileController())),
      ],
    ),
    GetPage(name: LoginScreen.route, page: () => const LoginScreen()),
    GetPage(name: RegisterScreen.route, page: () => RegisterScreen()),
    GetPage(name: EstimationPage.route, page: () => const EstimationPage()),
    GetPage(name: PlantationSection.route, page: () => const PlantationSection()),
    GetPage(name: ProfilePage.route, page: () => const ProfilePage()),
    GetPage(name: EstimateResultScreen.route, page: () => const EstimateResultScreen()),
    GetPage(name: WaterQualityScreen.route, page: () => const WaterQualityScreen(), transition: Transition.circularReveal),
    GetPage(name: WaterSavingsScreen.route, page: () => const WaterSavingsScreen()),
  ];
}

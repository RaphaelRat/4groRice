import 'package:agrorice/app/modules/home/home/home_controller.dart';
import 'package:get/get.dart';

import '../modules/login/login_controller.dart';
import '../modules/register/register_controller.dart';
import '../modules/home/sections/estimation_page.dart';
import '../modules/home/sections/plantation.dart';
import '../modules/home/sections/profile_page.dart';
import '../modules/home/home/home.dart';
import '../modules/login/login.dart';
import '../modules/estimate_result/estimate_result.dart';
import '../modules/water_quality/water_quality.dart';
import '../modules/water_savings/water_savings.dart';
import '../modules/register/register.dart';

List<GetPage> getAppPages() {
  return [
    GetPage(name: HomeScreen.route, page: () => const HomeScreen(), binding: BindingsBuilder(() => Get.lazyPut(() => HomeController()))),
    GetPage(name: LoginScreen.route, page: () => const LoginScreen(), binding: BindingsBuilder(() => Get.lazyPut(() => LoginController()))),
    GetPage(name: RegisterScreen.route, page: () => RegisterScreen(), binding: BindingsBuilder(() => Get.lazyPut(() => RegisterController()))),
    GetPage(name: EstimationPage.route, page: () => const EstimationPage()),
    GetPage(name: PlantationSection.route, page: () => const PlantationSection()),
    GetPage(name: ProfilePage.route, page: () => const ProfilePage()),
    GetPage(name: EstimateResultScreen.route, page: () => EstimateResultScreen()),
    GetPage(name: WaterQualityScreen.route, page: () => const WaterQualityScreen(), transition: Transition.circularReveal),
    GetPage(name: WaterSavingsScreen.route, page: () => const WaterSavingsScreen()),
  ];
}

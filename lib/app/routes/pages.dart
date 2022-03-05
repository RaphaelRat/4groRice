import 'package:get/get.dart';

import '../modules/home/estimation/estimation.dart';
import '../modules/home/plantation/plantation.dart';
import '../modules/home/profile/profile.dart';
import '../modules/home/home/home.dart';
import '../modules/login/login.dart';
import '../modules/estimate_result/estimate_result.dart';
import '../modules/water_quality/water_quality.dart';
import '../modules/water_savings/water_savings.dart';
import '../modules/register/register.dart';

List<GetPage> getAppPages() {
  return [
    GetPage(name: HomeScreen.route, page: () => const HomeScreen()),
    GetPage(name: LoginScreen.route, page: () => const LoginScreen()),
    GetPage(name: RegisterScreen.route, page: () => const RegisterScreen()),
    GetPage(name: EstimationSection.route, page: () => const EstimationSection()),
    GetPage(name: PlantationSection.route, page: () => const PlantationSection()),
    GetPage(name: ProfileSection.route, page: () => const ProfileSection()),
    GetPage(name: EstimateResultScreen.route, page: () => const EstimateResultScreen()),
    GetPage(name: WaterQualityScreen.route, page: () => const WaterQualityScreen()),
    GetPage(name: WaterSavingsScreen.route, page: () => const WaterSavingsScreen()),
  ];
}

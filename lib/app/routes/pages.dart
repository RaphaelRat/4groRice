import 'package:get/get.dart';

import '../screens/bottom_navigation_bar/estimation.dart';
import '../screens/bottom_navigation_bar/plantation.dart';
import '../screens/bottom_navigation_bar/profile.dart';
import '../screens/home.dart';
import '../screens/login.dart';
import '../screens/popup/estimate_result.dart';
import '../screens/popup/water_quality.dart';
import '../screens/popup/water_savings.dart';
import '../screens/register.dart';

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

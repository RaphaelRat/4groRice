import 'package:agrorice/screens/bottom_navigation_bar/estimation.dart';
import 'package:agrorice/screens/bottom_navigation_bar/plantation.dart';
import 'package:agrorice/screens/bottom_navigation_bar/profile.dart';
import 'package:agrorice/screens/home.dart';
import 'package:agrorice/screens/login.dart';
import 'package:agrorice/screens/register.dart';
import 'package:get/get.dart';

List<GetPage> getAppPages() {
  return [
    GetPage(name: HomeScreen.route, page: () => const HomeScreen()),
    GetPage(name: LoginScreen.route, page: () => const LoginScreen()),
    GetPage(name: RegisterScreen.route, page: () => const RegisterScreen()),
    GetPage(name: EstimationSection.route, page: () => const EstimationSection()),
    GetPage(name: PlantationSection.route, page: () => const PlantationSection()),
    GetPage(name: ProfileSection.route, page: () => const ProfileSection()),
  ];
}

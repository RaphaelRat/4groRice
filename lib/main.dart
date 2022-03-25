import 'package:agrorice/app/data/repository/authentication.dart';
import 'package:agrorice/app/modules/home/home/home_page.dart';
import 'package:agrorice/app/modules/login/login_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './app/routes/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '4groRice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: Authentication.isLogged() ? HomeScreen.route : LoginScreen.route,
      getPages: getAppPages(),
      themeMode: ThemeMode.light,
    );
  }
}

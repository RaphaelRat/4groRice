import 'package:flutter/material.dart';

import './bottom_navigation_bar/estimation.dart';
import './bottom_navigation_bar/plantation.dart';
import './bottom_navigation_bar/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 232, 231),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 14),
          child: Image.asset('lib/assets/images/logo.png'),
        ),
        elevation: 0,
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: const [
            PlantationSection(),
            EstimationSection(),
            ProfileSection(),
          ],
          onPageChanged: (i) => setState(() {
            _selectedIndex = i;
          }),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.grass), label: 'Plantações', tooltip: 'Histórico'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Calculadora', tooltip: 'Calcule'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil', tooltip: 'Seus dados'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease),
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        backgroundColor: const Color.fromARGB(255, 65, 112, 110),
        unselectedItemColor: const Color.fromARGB(255, 206, 218, 217),
      ),
    );
  }
}

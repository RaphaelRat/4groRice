import 'package:flutter/material.dart';

import './bottom_navigation_bar/estimation.dart';
import './bottom_navigation_bar/plantation.dart';
import './bottom_navigation_bar/profile.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/home';

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
        centerTitle: MediaQuery.of(context).size.width >= 720 ? true : false,
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
          onPageChanged: _selectIndex,
        ),
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width >= 720 ? _webBottomNavigationBar() : _mobileBottomNavigationBar(),
    );
  }

  void _selectIndex(int index) {
    return setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBar _mobileBottomNavigationBar() {
    return BottomNavigationBar(
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
    );
  }

  Container _webBottomNavigationBar() {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 65, 112, 110),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _myItem(text: 'Plantações', index: 0),
          const SizedBox(width: 120),
          _myItem(text: 'Calculadora', index: 1),
          const SizedBox(width: 120),
          _myItem(text: 'Perfil', index: 2),
        ],
      ),
    );
  }

  TextButton _myItem({required int index, required String text}) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () => _pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            index == 0
                ? Icons.grass
                : index == 1
                    ? Icons.pie_chart
                    : Icons.person,
            size: 32,
            color: _selectedIndex == index ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 206, 218, 217),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: _selectedIndex == index ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 206, 218, 217),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:agrorice/screens/bottom_navigation_bar/estimation.dart';
import 'package:agrorice/screens/bottom_navigation_bar/plantation.dart';
import 'package:agrorice/screens/bottom_navigation_bar/profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PlantationSection(),
    EstimationSection(),
    ProfileSection(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: PageView(
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
      // body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.grass),
            label: 'Plantações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Cálculos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        backgroundColor: const Color.fromARGB(255, 65, 112, 110),
        unselectedItemColor: const Color.fromARGB(255, 206, 218, 217),
      ),
    );
  }
}

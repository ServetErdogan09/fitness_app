// lib/screens/main_navigation.dart
import 'package:fitness_app/features/tracking/screens/body_measurements_screen.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [const BodyMeasurementScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF13EC5B), // primary
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(0xFF102216), // background-dark
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight),
            label: 'Vücut Ölçümü',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Beslenme',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Antrenman',
          ),
        ],
      ),
    );
  }
}

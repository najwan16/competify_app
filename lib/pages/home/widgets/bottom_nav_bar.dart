import 'package:competify_app/pages/home/matching_page.dart';
import 'package:competify_app/pages/home/profile_page.dart';
import 'package:competify_app/pages/home/progress_page.dart';
import 'package:flutter/material.dart';
import 'package:competify_app/pages/home/home_page.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ProgressPage(),
    const MatchingPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Matching'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: const Color(0xFF464D81),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
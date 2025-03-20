import 'package:competify_app/presentation/pages/event/event_page.dart';
import 'package:competify_app/presentation/pages/matching/matching_page.dart';
import 'package:competify_app/presentation/pages/profile/profile_page.dart';
import 'package:competify_app/presentation/pages/progress/progress_page.dart';
import 'package:competify_app/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePageContent(),
    const ProgressPage(),
    EventPage(),
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
      backgroundColor: Colors.white,
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Home Page", style: TextStyle(fontSize: 20)));
  }
}

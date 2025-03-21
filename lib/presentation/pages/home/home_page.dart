import 'package:competify_app/presentation/pages/event/event_page.dart';
import 'package:competify_app/presentation/pages/home/widget/event_list.dart';
import 'package:competify_app/presentation/pages/home/widget/home_header.dart';
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

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      HomePageContent(onNavigateToEvent: _onItemTapped),
      const ProgressPage(),
      const EventPage(),
      const MatchingPage(),
      const ProfilePage(),
    ]);
  }

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
  final Function(int) onNavigateToEvent;

  const HomePageContent({super.key, required this.onNavigateToEvent});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeader(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Competify Update",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Rekomendasi Event",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                EventList(onNavigateToEvent: onNavigateToEvent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

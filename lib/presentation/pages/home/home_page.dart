import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:competify_app/presentation/pages/event/event_page.dart';
import 'package:competify_app/presentation/pages/home/widget/event_list.dart';
import 'package:competify_app/presentation/pages/home/widget/home_header.dart';
import 'package:competify_app/presentation/pages/matching/matching_page.dart';
import 'package:competify_app/presentation/pages/profile/profile_page.dart';
import 'package:competify_app/presentation/pages/progress/progress_page.dart';
import 'package:competify_app/presentation/widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _username = "User";

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  Future<void> _fetchUsername() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return; 

    try {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();
      if (userDoc.exists && userDoc.data() != null) {
        setState(() {
          _username = userDoc['username'] ?? "User";
        });
      }
    } catch (e) {
      debugPrint("Error fetching username: $e");
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePageContent(onNavigateToEvent: _onItemTapped, username: _username),
      const ProgressPage(),
      const EventPage(),
      const MatchingPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(index: _selectedIndex, children: pages),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  final Function(int) onNavigateToEvent;
  final String username;

  const HomePageContent({
    super.key,
    required this.onNavigateToEvent,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(username: username),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
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

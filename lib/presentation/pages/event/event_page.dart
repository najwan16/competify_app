import 'package:competify_app/presentation/pages/event/lomba/lomba_page.dart';
import 'package:competify_app/presentation/pages/event/mentor/mentor_page.dart';
import 'package:competify_app/presentation/pages/event/team/team_page.dart';
import 'package:competify_app/presentation/widgets/appbar_event.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [LombaPage(), MentorPage(), const TeamPage()];

  final List<String> _titles = ["Info Lomba", "Cari Mentor", "Cari Team"];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(
            title: _titles[_selectedIndex],
            selectedIndex: _selectedIndex,
            onItemSelected: _onNavItemTapped,
          ),
          const SizedBox(height: 16),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}

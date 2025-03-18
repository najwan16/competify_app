// import 'package:competify_app/pages/home/lomba_page.dart';
// import 'package:competify_app/pages/home/mentor_page.dart';
// import 'package:competify_app/pages/home/team_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionNavbar extends StatefulWidget {
  const SectionNavbar({super.key});

  @override
  _SectionNavbarState createState() => _SectionNavbarState();
}

class _SectionNavbarState extends State<SectionNavbar> {
  int _selectedIndex = 0;

  // final List<Widget> _pages = [
  //   const LombaPage(),
  //   const MentorPage(),
  //   const TeamPage(),
  // ];

  final List<Map<String, dynamic>> _sections = [
    {'label': "Lomba", 'icon': Icons.emoji_events},
    {'label': "Mentor", 'icon': Icons.school},
    {'label': "Team", 'icon': Icons.people},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: Color(0xFF464D81),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_sections.length, (index) {
          bool isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0XFFF9F1BE) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black54),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_sections[index]['icon'], size: 20, color: Colors.black),
                  const SizedBox(width: 8),
                  Text(
                    _sections[index]['label'],
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

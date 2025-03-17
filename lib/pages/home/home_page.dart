import 'package:competify_app/pages/home/lomba/lomba_page.dart';
import 'package:competify_app/pages/home/mentor/mentor_page.dart';
import 'package:competify_app/pages/home/team/team_page.dart';
import 'package:competify_app/pages/widgets/section_navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:competify_app/pages/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    LombaPage(),
    MentorPage(),
    const TeamPage(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Future<void> _signOut() async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //   } catch (e) {
  //     print('Error signing out: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom AppBar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            decoration: const BoxDecoration(
              color: Color(0xFF464D81),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 24,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Info Lomba",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 24), 
                  ],
                ),
                const SizedBox(height: 33),
                const SearchBarWidget(),
                const SizedBox(height: 10),
                SectionNavbar(
                  onItemSelected: _onNavItemTapped,
                  selectedIndex: _selectedIndex,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}

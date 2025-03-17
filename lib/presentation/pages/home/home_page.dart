import 'package:competify_app/presentation/pages/event/lomba/lomba_page.dart';
import 'package:competify_app/presentation/pages/event/mentor/mentor_page.dart';
import 'package:competify_app/presentation/pages/event/team/team_page.dart';
import 'package:competify_app/presentation/widgets/section_navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:competify_app/presentation/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [const SizedBox(height: 16)]),
    );
  }
}

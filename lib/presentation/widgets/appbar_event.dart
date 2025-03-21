import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:competify_app/presentation/widgets/search_bar.dart';
import 'package:competify_app/presentation/pages/event/widget/section_navbar.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              // const Icon(Icons.chevron_left, color: Colors.white, size: 24),
              Expanded(
                child: Center(
                  child: Text(
                    title,
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
            onItemSelected: onItemSelected,
            selectedIndex: selectedIndex,
          ),
        ],
      ),
    );
  }
}

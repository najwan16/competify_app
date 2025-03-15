import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const SectionNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final List<Map<String, dynamic>> _sections = const [
    {'label': "Lomba", 'icon': Icons.emoji_events},
    {'label': "Mentor", 'icon': Icons.people_outlined},
    {'label': "Team", 'icon': Icons.chat},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_sections.length, (index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onItemSelected(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0XFFF9F1BE) : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black54),
                boxShadow: isSelected
                    ? [
                        const BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_sections[index]['icon'], size: 20, color: Colors.black),
                  const SizedBox(width: 6),
                  Text(
                    _sections[index]['label'],
                    style: GoogleFonts.poppins(
                      fontSize: 13,
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

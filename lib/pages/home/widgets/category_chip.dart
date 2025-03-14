import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0XFFF9F1BE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          CategoryChip(label: "UI/UX"),
          SizedBox(width: 10),
          CategoryChip(label: "Debat"),
          SizedBox(width: 10),
          CategoryChip(label: "Business Plan"),
          SizedBox(width: 10),
          CategoryChip(label: "Robotik"),
          SizedBox(width: 10),
          CategoryChip(label: "Menulis"),
          SizedBox(width: 10),
          CategoryChip(label: "Karya Tulis Ilmiah"),
        ],
      ),
    );
  }
}

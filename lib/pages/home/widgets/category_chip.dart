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
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Pastikan teks terlihat jelas
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16), // Memberi jarak dari sisi layar
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoryChip(label: "UI/UX"),
            const SizedBox(width: 10),
            CategoryChip(label: "Debat"),
            const SizedBox(width: 10),
            CategoryChip(label: "Business Plan"),
            const SizedBox(width: 10),
            CategoryChip(label: "Robotik"),
            const SizedBox(width: 10),
            CategoryChip(label: "Menulis"),
            const SizedBox(width: 10),
            CategoryChip(label: "Karya Tulis Ilmiah"),
          ],
        ),
      ),
    );
  }
}

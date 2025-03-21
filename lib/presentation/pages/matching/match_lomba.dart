import 'package:competify_app/presentation/pages/matching/create_match.dart';
import 'package:competify_app/presentation/pages/matching/widgets/match_button.dart';
import 'package:flutter/material.dart';

class MatchGroupLomba extends StatelessWidget {
  final String imagePath;
  final String title;

  const MatchGroupLomba({
    required this.imagePath,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match Group"),
        backgroundColor: const Color(0xFF464D81),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Supaya tidak memenuhi layar penuh
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePath, width: 280, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              MatchGroupButton(
                text: "Gabung Team",
                icon: Icons.group,
                color: Colors.blue,
                onPressed: () {},
              ),
              const SizedBox(height: 12),
              MatchGroupButton(
                text: "Buat Team",
                icon: Icons.add_circle,
                color: Colors.green,
                onPressed: () {
                 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateMatch()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

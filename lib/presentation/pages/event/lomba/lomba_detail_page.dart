import 'package:flutter/material.dart';
import 'package:competify_app/presentation/pages/event/team/match_lomba.dart';

class LombaDetailPage extends StatefulWidget {
  final Map<String, dynamic> lomba;

  const LombaDetailPage({required this.lomba, super.key});

  @override
  _LombaDetailPageState createState() => _LombaDetailPageState();
}

class _LombaDetailPageState extends State<LombaDetailPage> {
  bool isExpanded = false;

  Widget _buildImage(String imagePath) {
    if (imagePath.startsWith('http')) {
      return Image.network(
        imagePath,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
        },
      );
    } else {
      return Image.asset(
        imagePath,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.image_not_supported,
            size: 100,
            color: Colors.grey,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> timeline = List<String>.from(widget.lomba['timeline'] ?? []);
    List<String> rules = List<String>.from(widget.lomba['rules'] ?? []);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lomba['title']),
        backgroundColor: const Color(0xFF464D81),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _buildImage(widget.lomba['imagePath']),
              ),
              const SizedBox(height: 16),
              Text(
                "Tema: ${widget.lomba['theme'] ?? 'Tidak tersedia'}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Timeline & Ketentuan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                    ],
                  ),
                ),
              ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (timeline.isNotEmpty) ...[
                        const Text(
                          "Timeline:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ...timeline.map((item) => Text("- $item")),
                        const SizedBox(height: 8),
                      ],
                      if (rules.isNotEmpty) ...[
                        const Text(
                          "Ketentuan:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ...rules.map((rule) => Text("- $rule")),
                      ],
                    ],
                  ),
                ),
                crossFadeState:
                    isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
              ),
              const SizedBox(height: 16),
              if (widget.lomba['additionalInfo'] != null) ...[
                const Text(
                  "Informasi Tambahan",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(widget.lomba['additionalInfo']),
              ],
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => MatchGroupLomba(
                            lombaData:
                                widget.lomba, // Mengirim semua data lomba
                          ),
                    ),
                  );
                },
                child: const Text("Match Group"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

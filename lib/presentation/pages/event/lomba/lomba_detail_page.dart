import 'package:flutter/material.dart';

class LombaDetailPage extends StatefulWidget {
  final Map<String, dynamic> lomba;

  const LombaDetailPage({required this.lomba, super.key});

  @override
  _LombaDetailPageState createState() => _LombaDetailPageState();
}

class _LombaDetailPageState extends State<LombaDetailPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(
                  widget.lomba['imagePath'],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
                      if (widget.lomba['timeline'] != null) ...[
                        const Text(
                          "Timeline:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ...widget.lomba['timeline']
                            .map<Widget>((item) => Text("- $item"))
                            .toList(),
                        const SizedBox(height: 8),
                      ],
                      if (widget.lomba['rules'] != null) ...[
                        const Text(
                          "Ketentuan:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ...widget.lomba['rules']
                            .map<Widget>((rule) => Text("- $rule"))
                            .toList(),
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
                  "Additional Information",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(widget.lomba['additionalInfo']),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String username;

  const HomeHeader({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 36),
      decoration: const BoxDecoration(
        color: Color(0xFF464A7E),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.notifications, color: Colors.white, size: 24),

              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                          color: Color(0XFFF9F1BE),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "Competify",
            style: TextStyle(
              color: Color(0XFFF9F1BE),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Selamat datang calon juara!",
            style: TextStyle(color: Color(0XFFF9F1BE), fontSize: 16),
          ),

          const SizedBox(height: 15),

          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0XFFF9F1BE),
              hintText: "Klik untuk mencari",
              prefixIcon: const Icon(Icons.search, color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

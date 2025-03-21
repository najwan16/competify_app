import 'package:flutter/material.dart';

class MatchingPage extends StatelessWidget {
  const MatchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pesan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4A4E8C),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterButton('Semua', isSelected: true),
                _buildFilterButton('Mentor'),
                _buildFilterButton('Tim'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Komunikasi Lebih Mudah dengan Tim & Mentor!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildChatItem(
                  'Selina Putri',
                  'Halo kak Selina, kami ingin meminta..',
                  '11.20',
                  'assets/profile1.png',
                  true,
                ),
                _buildChatItem(
                  'Clarissa Belvania',
                  'Bagus! Jangan lupa gunakan warna yang..',
                  '10.15',
                  'assets/profile2.png',
                ),
                _buildChatItem(
                  'Pixel Pioneers',
                  'Aku bisa fokus di wireframe & prototype',
                  '14.50',
                  'assets/profile3.png',
                ),
                _buildChatItem(
                  'Raffi Aditya',
                  'Oke noted, nanti kami tambahkan..',
                  '08.45',
                  'assets/profile4.png',
                  true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Coming Soon...',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, {bool isSelected = false}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color(0xFF4A4E8C) : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }

  Widget _buildChatItem(
    String name,
    String message,
    String time,
    String avatarPath, [
    bool isRead = false,
  ]) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(avatarPath)),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message, overflow: TextOverflow.ellipsis),
      trailing: Text(time),
    );
  }
}

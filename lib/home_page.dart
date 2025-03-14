import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const BottomNavigationBarExampleApp());

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // AppBar Custom
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                    const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                    const Spacer(),
                    Text(
                      "Halo Expert!",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const CircleAvatar(radius: 22),
                  ],
                ),
                const SizedBox(height: 16),
                // Search Bar
                Container(
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0XFFF9F1BE),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Cari lomba terbaru",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Color(0XFF2B2B2B),
                      ),
                      border: InputBorder.none,
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Color(0XFF2B2B2B),
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Color(0XFF2B2B2B),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Kategori Lomba
                SingleChildScrollView(
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
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Isi Konten
          Expanded(
            child: Center(
              child: Text(
                "Isi Konten",
                style: GoogleFonts.poppins(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BottomNavigationBarExample());
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    Text(
      'Progress Page',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Matching Page',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Profile Page',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Progress',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Matching'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white, // Warna ikon aktif lebih jelas
        unselectedItemColor:
            Colors.grey[400], // Warna ikon tidak aktif agar kontras
        backgroundColor: const Color(0xFF464D81), // Latar belakang navbar tetap
        showUnselectedLabels: true, // Menampilkan label untuk ikon tidak aktif
        onTap: _onItemTapped,
      ),
    );
  }
}

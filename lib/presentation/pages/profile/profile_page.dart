import 'package:competify_app/presentation/pages/auth/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(color: const Color(0xFF464D81), height: 150),
                const Positioned(
                  bottom: -50,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Color(0XFFE6E6E6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            const Text(
              "Jenny Wilson",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 23),
            _buildExperienceSection("Work Experience"),
            _buildExperienceSection("Organization Experience"),
            _buildExperienceLevelSection(),
            _buildExperienceDocument("CV"),
            _buildExperienceDocument("Portofolio"),
            _buildExperienceDocument("Account configuration"),
            _buildExperienceDocument("Contact Support"),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceSection(String title) {
    return Column(
      children: [
        const Divider(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 24),
              label: const Text("Add"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFFC6C8D8),
                foregroundColor: const Color(0XFF2B2B2B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceLevelSection() {
    return Column(
      children: [
        const Divider(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          margin: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Experience level",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text("You can add some certificate"),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceDocument(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () {},
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              "Log Out",
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.red),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.logout, color: Colors.red),
              onPressed: () => _showLogoutConfirmationDialog(context),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Log Out"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // Tutup dialog
                await FirebaseAuth.instance.signOut(); // Logout dari Firebase
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AuthPage()),
                  (route) => false, // Menghapus semua halaman sebelumnya
                );
              },
              child: const Text(
                "Log Out",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}

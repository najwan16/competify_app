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
                Container(color: Color(0xFF464D81), height: 150),
                Positioned(
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
            _buildExperienceDocument("Log Out"),
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
          decoration: const BoxDecoration(),
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
          margin: EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Experience level",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  // ElevatedButton.icon(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.add, size: 24),
                  //   label: const Text("Add"),
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Color(0XFFC6C8D8),
                  //     foregroundColor: Color(0XFF2B2B2B),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(40),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const Text("You can add some certificate"),
              const Divider(),
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
}

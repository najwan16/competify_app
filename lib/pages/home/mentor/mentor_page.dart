import 'package:competify_app/pages/widgets/mentor_card.dart';
import 'package:flutter/material.dart';

class MentorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            MentorCard(
              imagePath: 'assets/image/person.jpg',
              name: 'Ziva Amalia',
              university: 'Melbourne University, Education',
              expertise: 'Paper Writing Expert',
              experience: 'Help 10+ teams',
              onTap: () {},
            ),
            MentorCard(
              imagePath: 'assets/image/person.jpg',
              name: 'Raffi Aditya',
              university: 'Princeton University, Computer Science',
              expertise: 'Software Engineer',
              experience: 'Help 25+ teams',
              onTap: () {},
            ),
            MentorCard(
              imagePath: 'assets/image/person.jpg',
              name: 'Clarissa Belvania',
              university: 'Universitas Brawijaya, Ilmu Komputer',
              expertise: 'UI/UX Expert',
              experience: 'Help 23+ teams',
              onTap: () {},
            ),
            MentorCard(
              imagePath: 'assets/image/person.jpg',
              name: 'Safira Livia',
              university: 'Yale University, Film and Cinema Studies',
              expertise: 'Director, Screenwriter',
              experience: 'Help 24+ teams',
              onTap: () {},
            ),
            MentorCard(
              imagePath: 'assets/image/person.jpg',
              name: 'Damar Pratama',
              university: 'Universitas Brawijaya, Ilmu Komputer',
              expertise: 'UI/UX Expert',
              experience: 'Help 20+ teams',
              onTap: () {},
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

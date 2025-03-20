import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:competify_app/presentation/widgets/mentor_card.dart';
import 'package:competify_app/presentation/provider/mentor_provider.dart';

class MentorPage extends StatefulWidget {
  const MentorPage({super.key});

  @override
  _MentorPageState createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Consumer<MentorProvider>(
                builder: (context, mentorProvider, child) {
                  return ListView.separated(
                    itemCount: mentorProvider.mentorList.length,
                    separatorBuilder: (_, __) => SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final mentor = mentorProvider.mentorList[index];
                      return MentorCard(
                        imagePath: mentor['imagePath'],
                        name: mentor['name'],
                        university: mentor['university'],
                        expertise: mentor['expertise'],
                        experience: mentor['experience'],
                        onTap: () {
                          // Bisa tambahkan navigasi ke detail mentor
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

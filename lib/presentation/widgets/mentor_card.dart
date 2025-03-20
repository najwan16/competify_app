import 'package:flutter/material.dart';

class MentorCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String university;
  final String expertise;
  final String experience;
  final VoidCallback onTap;

  const MentorCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.university,
    required this.expertise,
    required this.experience,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFC6C8D8),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 6),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF9F1BE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                      side: BorderSide(color: Colors.black, width: 1.5),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(width: 12.0),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Name
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 9.0),
                // University
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.school, size: 16, color: Colors.black),
                    SizedBox(width: 4.0),
                    Flexible(
                      child: Text(
                        university,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 9.0),

                // Expertise
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.emoji_events_outlined, size: 16, color: Colors.black),
                    SizedBox(width: 4.0),
                    Flexible(
                      child: Text(
                        expertise,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 9.0),

                // Experience
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.group_add_outlined, size: 24, color: Colors.black),
                    SizedBox(width: 4.0),
                    Flexible(
                      child: Text(
                        experience,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

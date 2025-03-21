import 'package:flutter/material.dart';

class ScheduleMentoring extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jadwal Mentoring',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: List.generate(
              6,
              (index) => Chip(label: Text('${19 + index} Maret')),
            ),
          ),
        ],
      ),
    );
  }
}

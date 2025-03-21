import 'package:flutter/material.dart';

class DailyProgressWidget extends StatelessWidget {
  final List<bool> progress;

  const DailyProgressWidget({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Daily Progress',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(7, (index) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: progress[index] ? Colors.blue : Colors.grey[300],
                  child: progress[index] ? Icon(Icons.check, color: Colors.white, size: 16) : null,
                ),
                SizedBox(height: 4),
                Text(days[index]),
              ],
            );
          }),
        ),
      ],
    );
  }
}

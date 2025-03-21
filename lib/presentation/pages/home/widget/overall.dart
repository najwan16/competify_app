import 'package:flutter/material.dart';

class OverallProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overall Progress',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('Tetap konsisten dan semangat!'),
          SizedBox(height: 10),
          LinearProgressIndicator(value: 0.75),
        ],
      ),
    );
  }
}

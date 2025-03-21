import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatelineWidget extends StatelessWidget {
  final DateTime deadline;

  const DatelineWidget({
    Key? key,
    required this.deadline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final difference = deadline.difference(now).inDays;
    final formattedDate = DateFormat('dd MMMM yyyy').format(deadline);

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Dateline',
            style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            formattedDate,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 4),
          Text(
            'H-$difference',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

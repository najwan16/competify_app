import 'package:flutter/material.dart';

class LombaCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String organizer;
  final DateTime date;
  final String status;
  final bool isOnline;
  final VoidCallback onTap;
  final DateTime currentDateTime;

  const LombaCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.organizer,
    required this.date,
    required this.status,
    required this.isOnline,
    required this.onTap,
    required this.currentDateTime,
  }) : super(key: key);

  String _calculateTimeDifference(DateTime eventDate, DateTime currentDate) {
    final difference = eventDate.difference(currentDate);
    if (difference.isNegative) {
      return 'Event telah berakhir';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} hari lagi';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} jam lagi';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} menit lagi';
    } else {
      return 'Segera dimulai';
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeDifference = _calculateTimeDifference(date, currentDateTime);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
              ),
              child: Image.asset(
                imagePath,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Penyelenggara: $organizer',
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                        const SizedBox(width: 4.0),
                        Text(
                          "${date.day} ${_monthName(date.month)} ${date.year}",
                          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        Icon(Icons.circle, size: 12, color: isOnline ? Colors.green : Colors.orange),
                        const SizedBox(width: 4.0),
                        Text(
                          status,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isOnline ? Colors.green : Colors.orange),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 14, color: Colors.grey),
                        const SizedBox(width: 4.0),
                        Text(
                          timeDifference,
                          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
    ];
    return months[month];
  }
}

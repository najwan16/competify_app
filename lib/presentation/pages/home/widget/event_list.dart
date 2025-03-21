import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:competify_app/presentation/provider/lomba_provider.dart';

class EventList extends StatelessWidget {
  final Function(int) onNavigateToEvent;

  const EventList({super.key, required this.onNavigateToEvent});

  @override
  Widget build(BuildContext context) {
    final lombaProvider = Provider.of<LombaProvider>(context);
    final lombaList = lombaProvider.lombaList;

    return lombaList.isEmpty
        ? const Center(child: Text("Belum ada lomba tersedia."))
        : SizedBox(
          height: 380,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lombaList.length,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return EventCard(
                lomba: lombaList[index],
                onNavigateToEvent: onNavigateToEvent,
              );
            },
          ),
        );
  }
}

class EventCard extends StatelessWidget {
  final Map<String, dynamic> lomba;
  final Function(int) onNavigateToEvent;

  const EventCard({
    super.key,
    required this.lomba,
    required this.onNavigateToEvent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onNavigateToEvent(2);
      },
      child: Container(
        height: 70,
        width: 250,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0XFFE3E4EC),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                lomba['imagePath'],
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              lomba['title'],
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              "Penyelenggara",
              style: const TextStyle(
                fontSize: 14,
                color: Color(0XFF202020),
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              lomba['organizer'],
              style: const TextStyle(
                fontSize: 14,
                color: Color(0XFF202020),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                onNavigateToEvent(2);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFFC6C8D8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                "Lihat",
                style: TextStyle(
                  color: Color(0XFF202020),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

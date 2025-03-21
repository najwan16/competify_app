import 'package:flutter/material.dart';

class CompetifyUpdate extends StatelessWidget {
  const CompetifyUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Competify Update",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 180, // Sesuaikan tinggi card
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              UpdateCard(
                imageUrl: "assets/image/update1.png",
                title: "Congratulations!",
                description:
                    "Tim Achieverse berhasil meraih peringkat pertama UI/UX competition!",
              ),
              UpdateCard(
                imageUrl: "assets/image/update2.png",
                title: "Photography Update",
                description:
                    "Tahukan kamu bahwa foto tim PhotoTech meraih kemenangan nasional lho!",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UpdateCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const UpdateCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Sesuaikan lebar card
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Temukan Tim Terbaikmu!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Gabung dengan tim yang cocok dengan keahlian dan visi kamu.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("groups").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("Belum ada tim yang tersedia"));
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var group = snapshot.data!.docs[index];
                      return TeamCard(
                        namaGrup: group["Nama Grup"] ?? "Tanpa Nama",
                        deskripsi: group["Deskripsi"] ?? "Tidak ada deskripsi",
                        keterampilan: group["Kategori"] ?? "Tidak ada kategori",
                        jumlahOrang: group["Jumlah Partisipan"] ?? 0,
                        gambarUrl: group["Gambar"] ?? "",
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  final String namaGrup;
  final String deskripsi;
  final String keterampilan;
  final int jumlahOrang;
  final String gambarUrl;

  const TeamCard({
    super.key,
    required this.namaGrup,
    required this.deskripsi,
    required this.keterampilan,
    required this.jumlahOrang,
    required this.gambarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gambarUrl.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(gambarUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
                  )
                : Container(height: 150, color: Colors.grey[300], child: const Icon(Icons.image, size: 50)),
            const SizedBox(height: 10),
            Text(
              namaGrup,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(deskripsi, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.work, size: 18),
                const SizedBox(width: 5),
                Text(keterampilan, style: const TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.people, size: 18),
                const SizedBox(width: 5),
                Text("$jumlahOrang Orang", style: const TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Gabung"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

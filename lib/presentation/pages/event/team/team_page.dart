import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TeamPage());
  }
}

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Temukan Tim Terbaikmu!",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              "Gabung dengan tim yang cocok dengan keahlian dan visi kamu.",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(179, 0, 0, 0),
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: StreamBuilder(
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
              var data = group.data() as Map<String, dynamic>;

              return TeamCard(
                namaGrup: data["Nama Grup"] ?? "Tanpa Nama",
                deskripsi: data["Deskripsi"] ?? "Tidak ada deskripsi",
                kategori: data["Kategori"] ?? "Tidak ada kategori",
                jumlahAnggota: data["Jumlah Partisipan"] ?? 0,
              );
            },
          );
        },
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  final String namaGrup;
  final String deskripsi;
  final String kategori;
  final int jumlahAnggota;

  const TeamCard({
    super.key,
    required this.namaGrup,
    required this.deskripsi,
    required this.kategori,
    required this.jumlahAnggota,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              namaGrup,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(deskripsi, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 4),
            Text(
              "Kategori: $kategori",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Text(
              "Jumlah Partisipan: $jumlahAnggota",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            ElevatedButton(
              onPressed: () {
                // Fungsi gabung ke tim bisa ditambahkan di sini
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Gabung"),
            ),
          ],
        ),
      ),
    );
  }
}

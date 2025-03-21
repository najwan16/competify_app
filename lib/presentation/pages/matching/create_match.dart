import 'package:competify_app/presentation/pages/matching/succes_page.dart';
import 'package:competify_app/presentation/provider/DatabaseMethods.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateMatch extends StatefulWidget {
  const CreateMatch({super.key});

  @override
  _CreateMatchState createState() => _CreateMatchState();
}

class _CreateMatchState extends State<CreateMatch> {
  TextEditingController _groupNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _participantCountController = TextEditingController();
  uploadData() async {
    Map<String, dynamic> uploaddata = {
      "Nama Grup": _groupNameController.text,
      "Deskripsi": _descriptionController.text,
      "Jumlah Partisipan": _participantCountController.text,
    };

    await DatabaseMethods().addGroupDetails(uploaddata);

    Fluttertoast.showToast(
      msg: "Group Berhasil Dibuat",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => GroupSuccessPage(
              groupName: _groupNameController.text,
              description: _descriptionController.text,
              category: "Kategori Lomba", // Bisa diubah sesuai input kategori
              participantCount: int.parse(_participantCountController.text),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buat Group',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF464D81),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade700,
                child: const Icon(Icons.group, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 8),
              const Text(
                'Profile',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: _groupNameController,
                decoration: InputDecoration(
                  labelText: 'Nama grup',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Deskripsi singkat',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: _participantCountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Jumlah orang dalam lomba',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  uploadData();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Buat Group',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF464D81),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade300,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Event'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Match'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

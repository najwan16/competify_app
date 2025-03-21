import 'package:competify_app/presentation/pages/matching/succes_page.dart';
import 'package:competify_app/presentation/provider/DatabaseMethods.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateMatch extends StatefulWidget {
  final Map<String, dynamic> lombaData;
  const CreateMatch({required this.lombaData, super.key});

  @override
  _CreateMatchState createState() => _CreateMatchState();
}

class _CreateMatchState extends State<CreateMatch> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _participantCountController =
      TextEditingController();

  @override
  void dispose() {
    _groupNameController.dispose();
    _descriptionController.dispose();
    _participantCountController.dispose();
    super.dispose();
  }

  uploadData() async {
    String groupName = _groupNameController.text.trim();
    String description = _descriptionController.text.trim();
    String participantText = _participantCountController.text.trim();

    if (groupName.isEmpty || description.isEmpty || participantText.isEmpty) {
      Fluttertoast.showToast(
        msg: "Harap isi semua kolom!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    int? participantCount;
    try {
      participantCount = int.parse(participantText);
      if (participantCount <= 0) throw Exception();
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Jumlah peserta harus berupa angka positif!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    Map<String, dynamic> uploaddata = {
      "Nama Grup": groupName,
      "Deskripsi": description,
      "Jumlah Partisipan": participantCount,
      "Lomba": widget.lombaData["title"] ?? "Tidak Diketahui",
      "Kategori": widget.lombaData["category"] ?? "Tidak Diketahui",
      "Tanggal": widget.lombaData["date"] ?? "Tidak Diketahui",
      "Gambar": widget.lombaData["imagePath"] ?? "",
    };

    try {
      await DatabaseMethods().addGroupDetails(uploaddata);
      Fluttertoast.showToast(
        msg: "Group Berhasil Dibuat",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => GroupSuccessPage(
                groupName: groupName,
                description: description,
                category: widget.lombaData["category"] ?? "Tidak Diketahui",
                participantCount: participantCount ?? 0,
              ),
        ),
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Terjadi kesalahan saat menyimpan data!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String? imagePath = widget.lombaData['imagePath'];
    bool isNetworkImage = imagePath != null && imagePath.startsWith("http");

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
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                    imagePath != null
                        ? (isNetworkImage
                            ? Image.network(
                              imagePath,
                              width: 280,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return _errorImage();
                              },
                            )
                            : Image.asset(
                              imagePath,
                              width: 280,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return _errorImage();
                              },
                            ))
                        : _errorImage(),
              ),
              const SizedBox(height: 16),
              Text(
                widget.lombaData['title'] ?? "Judul Tidak Diketahui",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              _buildTextField(_groupNameController, 'Nama grup'),
              const SizedBox(height: 16),
              _buildTextField(
                _descriptionController,
                'Deskripsi singkat',
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                _participantCountController,
                'Jumlah orang dalam lomba',
                isNumber: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: uploadData,
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
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    int maxLines = 1,
    bool isNumber = false,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade300,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _errorImage() {
    return Container(
      width: 280,
      height: 150,
      color: Colors.grey.shade300,
      child: const Center(child: Text("Gambar tidak tersedia")),
    );
  }
}

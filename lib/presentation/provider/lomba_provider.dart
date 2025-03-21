import 'package:flutter/material.dart';

class LombaProvider extends ChangeNotifier {
  String _filter = 'online';

  String get filter => _filter;

  final List<Map<String, dynamic>> _lombaList = [
    {
      'imagePath': 'assets/image/poster.jpg',
      'title': 'NEURON 2025',
      'theme': 'Inovasi Teknologi Masa Depan',
      'organizer': 'Universitas Negeri Malang',
      'date': DateTime(2025, 7, 8),
      'status': 'Luring/Offline',
      'isOnline': false,
      'category': 'Teknologi',
      'timeline': [
        'Pendaftaran: 1 Mei - 30 Juni 2025',
        'Babak Penyisihan: 8 Juli 2025',
      ],
      'rules': ['Peserta adalah mahasiswa aktif', 'Karya harus orisinal'],
      'additionalInfo':
          'Kompetisi teknologi yang menguji kreativitas dan inovasi mahasiswa dalam bidang sains dan teknologi.',
    },
    {
      'imagePath': 'assets/image/poster.jpg',
      'title': 'National Robotics Competition',
      'theme': 'Robotika dalam Industri 4.0',
      'organizer': 'Universitas Brawijaya',
      'date': DateTime(2025, 10, 12),
      'status': 'Luring/Offline',
      'isOnline': false,
      'category': 'Robotika',
      'timeline': [
        'Registrasi: 1 Juli - 30 Agustus 2025',
        'Final: 12 Oktober 2025',
      ],
      'rules': [
        'Tim maksimal 5 orang',
        'Robot harus sesuai spesifikasi yang ditentukan',
      ],
      'additionalInfo':
          'Kompetisi robotik tingkat nasional yang mempertemukan inovator dari berbagai universitas.',
    },
    {
      'imagePath': 'assets/image/poster.jpg',
      'title': 'AI & Data Science Hackathon',
      'theme': 'Masa Depan AI dan Data Science',
      'organizer': 'Institut Teknologi Bandung',
      'date': DateTime(2025, 3, 25),
      'status': 'Online',
      'isOnline': true,
      'category': 'Data Science',
      'timeline': [
        'Pendaftaran: 1 Maret - 20 Maret 2025',
        'Hackathon: 25 Maret 2025',
      ],
      'rules': [
        'Peserta individu atau tim maksimal 4 orang',
        'Karya harus berbasis AI atau Data Science',
      ],
      'additionalInfo':
          'Hackathon tingkat nasional yang menantang peserta untuk menciptakan solusi berbasis AI dan Data Science.',
    },
    {
      'imagePath': 'assets/image/poster.jpg',
      'title': 'UI/UX Design Challenge',
      'theme': 'Inovasi Desain untuk Pengalaman Pengguna yang Lebih Baik',
      'organizer': 'Universitas Indonesia',
      'date': DateTime(2025, 3, 15),
      'status': 'Online',
      'isOnline': true,
      'category': 'Desain',
      'timeline': [
        'Pendaftaran: 1 Februari - 10 Maret 2025',
        'Final: 15 Maret 2025',
      ],
      'rules': ['Peserta individu', 'Desain harus orisinal dan inovatif'],
      'additionalInfo':
          'Kompetisi desain UI/UX bagi mahasiswa untuk menunjukkan kreativitas dalam meningkatkan pengalaman pengguna.',
    },
  ];

  List<Map<String, dynamic>> get lombaList => _lombaList;

  void setFilter(String value) {
    _filter = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> getFilteredLombaList(DateTime currentDate) {
    List<Map<String, dynamic>> filteredList = _lombaList;

    if (_filter == 'online') {
      filteredList = _lombaList.where((lomba) => lomba['isOnline']).toList();
    } else if (_filter == 'offline') {
      filteredList = _lombaList.where((lomba) => !lomba['isOnline']).toList();
    }

    return filteredList;
  }
}
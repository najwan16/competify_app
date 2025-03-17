import 'package:flutter/material.dart';

class MentorProvider extends ChangeNotifier {
  String _filter = 'all';

  String get filter => _filter;

  final List<Map<String, dynamic>> _allMentors = [
    {
      'imagePath': 'assets/image/person.jpg',
      'name': 'Ziva Amalia',
      'university': 'Melbourne University, Education',
      'expertise': 'Paper Writing Expert',
      'experience': 'Help 10+ teams',
    },
    {
      'imagePath': 'assets/image/person.jpg',
      'name': 'Raffi Aditya',
      'university': 'Princeton University, Computer Science',
      'expertise': 'Software Engineer',
      'experience': 'Help 25+ teams',
    },
    {
      'imagePath': 'assets/image/person.jpg',
      'name': 'Clarissa Belvania',
      'university': 'Universitas Brawijaya, Ilmu Komputer',
      'expertise': 'UI/UX Expert',
      'experience': 'Help 23+ teams',
    },
    {
      'imagePath': 'assets/image/person.jpg',
      'name': 'Safira Livia',
      'university': 'Yale University, Film and Cinema Studies',
      'expertise': 'Director, Screenwriter',
      'experience': 'Help 24+ teams',
    },
    {
      'imagePath': 'assets/image/person.jpg',
      'name': 'Damar Pratama',
      'university': 'Universitas Brawijaya, Ilmu Komputer',
      'expertise': 'UI/UX Expert',
      'experience': 'Help 20+ teams',
    },
  ];

  List<Map<String, dynamic>> get mentorList {
    if (_filter == 'all') {
      return _allMentors;
    }
    return _allMentors
        .where((mentor) => mentor['expertise'] == _filter)
        .toList();
  }

  void setFilter(String value) {
    _filter = value;
    notifyListeners();
  }
}

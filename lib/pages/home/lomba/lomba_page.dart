import 'package:competify_app/pages/widgets/lomba_card.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LombaPage extends StatefulWidget {
  @override
  _LombaPageState createState() => _LombaPageState();
}

class _LombaPageState extends State<LombaPage> {
  String filter = 'semua';
  late Stream<DateTime> dateTimeStream;

  List<Map<String, dynamic>> lombaList = [
    {
      'imagePath': 'assets/image/poster.jpg',
      'title': 'NEURON 2025',
      'organizer': 'Universitas Negeri Malang',
      'date': DateTime(2025, 7, 8),
      'status': 'Luring/Offline',
      'isOnline': false,
    },
    {
      'imagePath': 'assets/image/poster.jpg',
      'title': 'National Robotics Competition',
      'organizer': 'Universitas Brawijaya',
      'date': DateTime(2025, 10, 12),
      'status': 'Luring/Offline',
      'isOnline': false,
    },
    {
      'imagePath': 'assets/image/poster.jpg',
      'title': 'Startup Pitching Competition',
      'organizer': 'Universitas Brawijaya',
      'date': DateTime(2025, 4, 10),
      'status': 'Luring/Offline',
      'isOnline': false,
    },
    {
      'imagePath': 'assets/image/poster.jpg',
      'title': 'Blockchain Development Hackathon',
      'organizer': 'Universitas Brawijaya',
      'date': DateTime(2025, 4, 1),
      'status': 'Luring/Offline',
      'isOnline': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    dateTimeStream = Stream.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now(),
    );
  }

  List<Map<String, dynamic>> getFilteredLombaList(DateTime currentDate) {
    if (filter == 'terdekat') {
      return lombaList.where((lomba) {
        final difference = lomba['date'].difference(currentDate).inDays;
        return difference <= 30 && difference >= 0;
      }).toList();
    }
    return lombaList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DateTime>(
        stream: dateTimeStream,
        builder: (context, snapshot) {
          final currentDateTime = snapshot.data ?? DateTime.now();
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0XFF464D81),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              filter = 'semua';
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: filter == 'semua'
                                  ? Color(0XFF464D81)
                                  : Color(0XFFE3E4EC),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Semua',
                                style: TextStyle(
                                  color: filter == 'semua'
                                      ? Color(0XFFE3E4EC)
                                      : Color(0XFF464D81),
                                  fontWeight: filter == 'semua'
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              filter = 'terdekat';
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: filter == 'terdekat'
                                  ? Color(0XFF464D81)
                                  : Color(0XFFE3E4EC),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Terdekat',
                                style: TextStyle(
                                  color: filter == 'terdekat'
                                      ? Color(0XFFE3E4EC)
                                      : Color(0XFF464D81),
                                  fontWeight: filter == 'terdekat'
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: getFilteredLombaList(currentDateTime)
                      .map(
                        (lomba) => LombaCard(
                          imagePath: lomba['imagePath'],
                          title: lomba['title'],
                          organizer: lomba['organizer'],
                          date: lomba['date'],
                          status: lomba['status'],
                          isOnline: lomba['isOnline'],
                          onTap: () {
                            print(
                              'Navigasi ke detail lomba: ${lomba['title']}',
                            );
                          },
                          currentDateTime: currentDateTime,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

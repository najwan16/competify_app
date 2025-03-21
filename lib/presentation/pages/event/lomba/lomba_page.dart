import 'package:competify_app/presentation/provider/lomba_provider.dart';
import 'package:competify_app/presentation/pages/event/widget/lomba_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'lomba_detail_page.dart';

class LombaPage extends StatefulWidget {
  const LombaPage({super.key});

  @override
  _LombaPageState createState() => _LombaPageState();
}

class _LombaPageState extends State<LombaPage> {
  late Stream<DateTime> dateTimeStream;
  

  @override
  void initState() {
    super.initState();
    dateTimeStream = Stream.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now(),
    );
  }

  void _showLombaDetail(Map<String, dynamic> lomba) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LombaDetailPage(lomba: lomba)),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildLombaList());
  }

  Widget _buildLombaList() {
    return StreamBuilder<DateTime>(
      stream: dateTimeStream,
      builder: (context, snapshot) {
        final currentDateTime = snapshot.data ?? DateTime.now();

        return Consumer<LombaProvider>(
          builder: (context, lombaProvider, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 27.0,
                    vertical: 8.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0XFF464D81),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        _buildFilterButton('Semua', 'semua'),
                        _buildFilterButton('Terdekat', 'terdekat'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children:
                        lombaProvider
                            .getFilteredLombaList(currentDateTime)
                            .map(
                              (lomba) => LombaCard(
                                imagePath: lomba['imagePath'],
                                title: lomba['title'],
                                organizer: lomba['organizer'],
                                date: lomba['date'],
                                status: lomba['status'],
                                isOnline: lomba['isOnline'],
                                onTap: () => _showLombaDetail(lomba),
                                currentDateTime: currentDateTime,
                              ),
                            )
                            .toList(),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildFilterButton(String label, String value) {
    return Consumer<LombaProvider>(
      builder: (context, lombaProvider, child) {
        return Expanded(
          child: GestureDetector(
            onTap: () => lombaProvider.setFilter(value),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color:
                    lombaProvider.filter == value
                        ? const Color(0XFF464D81)
                        : const Color(0XFFE3E4EC),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color:
                        lombaProvider.filter == value
                            ? const Color(0XFFE3E4EC)
                            : const Color(0XFF464D81),
                    fontWeight:
                        lombaProvider.filter == value
                            ? FontWeight.bold
                            : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

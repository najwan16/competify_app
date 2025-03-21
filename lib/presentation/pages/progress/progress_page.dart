import 'package:competify_app/presentation/pages/progress/widget/progress_header.dart';
import 'package:competify_app/presentation/pages/progress/progress_waitinglist.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const ProgressHeader(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  // Summary Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSummaryCard('Win', '2/5', Icons.emoji_events),
                      _buildSummaryCard('Selesai', '5', Icons.checklist),
                      _buildSummaryCard('List', '2', Icons.list),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // On Progress Event
                  _buildSectionTitle('On Progress Event'),
                  _buildEventCard(),

                  // Tracking Progress
                  _buildSectionTitle('Tracking Progress'),
                  _buildPieChartWithLegend(),

                  const SizedBox(height: 20),

                  // Waiting List (Clickable Button)
                  _buildWaitingListButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.deepPurple),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildEventCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior:
          Clip.antiAlias, // Menjaga agar gambar tidak keluar dari card
      child: ListTile(
        leading: Image.asset(
          'assets/image/poster.jpg',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: const Text(
          'Essay Competition',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('📍 PT. Gramedia'),
            Text('📅 28 Maret 2025'),
            Text('🟢 Online'),
            Text('👥 Teams - Beyond Limits'),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChartWithLegend() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: 70,
                  color: Colors.deepPurple,
                  title: '70%',
                  radius: 50,
                ),
                PieChartSectionData(
                  value: 20,
                  color: Colors.yellow,
                  title: '20%',
                  radius: 40,
                ),
                PieChartSectionData(
                  value: 10,
                  color: Colors.blue,
                  title: '10%',
                  radius: 30,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _LegendItem(color: Colors.deepPurple, text: "Completed"),
            _LegendItem(color: Colors.yellow, text: "In Progress"),
            _LegendItem(color: Colors.blue, text: "Pending"),
          ],
        ),
      ],
    );
  }

  Widget _buildWaitingListButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WaitingListPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
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
            const Text(
              'Waiting List',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'One event on waiting list to search a mentor',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const _LegendItem({required this.color, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

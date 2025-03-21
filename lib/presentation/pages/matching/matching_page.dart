import 'package:flutter/material.dart';

class MatchingPage extends StatelessWidget {
  const MatchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text('Matching Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

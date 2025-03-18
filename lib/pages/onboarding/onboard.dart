import 'package:flutter/material.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _Onboard();
}

class _Onboard extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xFF464D81),
    body: Center(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/LogoFull.png', height: 285),
              const SizedBox(
                width: 246, 
                height: 54),
                  const Text(
                   'Competify',
                    style: TextStyle(
                      fontSize: 45,
                       fontWeight: FontWeight.bold,
                       color: Color(0XFFF9F1BE),
                    ),
                  ),
            ],
          ),
        ),
    ),);
  }
}

//belom dipanggil di main

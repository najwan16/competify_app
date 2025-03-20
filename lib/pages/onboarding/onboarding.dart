import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _Onboarding();
}

class _Onboarding extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF464D81),
      body: PageView(
        children: [
          SizedBox.square(),
          Center(
            child: SvgPicture.asset('assets/image/ob1.svg'),
          ),
          Center(
            child: SvgPicture.asset('assets/image/ob2.svg'),
          ),Center(
            child: SvgPicture.asset('assets/image/ob3.svg'),
          ), 
        ],
      )
    );
  }
}

//belom dipanggil di main

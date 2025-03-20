import 'package:flutter/material.dart';
import 'package:competify_app/pages/auth/auth_page.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _Start();
}

class _Start extends State<Start> {
  String logo = "assets/image/Logo.svg";
  String logoText = "Competify";
  bool isDone = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF464D81),
      body: Stack(
        alignment: Alignment.center,
        children: [
          isDone
              ? Center(
                    child: Text(
                      logoText,
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        color: Color(0XFFF9F1BE),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 1000.ms)
                  .then(delay: 600.ms)
                  .slideX(begin: -0.07, end: 0.2)
                  .then(delay: 1000.ms)
                  .slideX(end: -0.3, duration: 1200.ms)
                  .then(delay: 200.ms)
                  .fadeOut(duration: 1000.ms)
              : Container(),
          Center(child: SvgPicture.asset(logo, width: 100))
              .animate()
              .fadeIn(duration: 3000.ms)
              .then(delay: 1200.ms)
              .slideX(end: -0.2, duration: 2000.ms)
              .callback(
                duration: 600.ms,
                callback: (_) {
                  setState(() {
                    isDone = true;
                  });
                },
              )
              .then(delay: 6500.ms)
              .slideX(end: 0.2)
              .then(delay: 1000.ms)
              .callback(
                callback: (_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AuthPage()),
                  );
                },
              ),
        ],
      ),
    );
  }
}

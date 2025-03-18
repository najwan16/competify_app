import 'package:flutter/material.dart';


class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _Start();
}

class _Start extends State<Start> {
  // @override
  // void inistate() {
  //   super.initState();
  //   //ntar hubungin ke halaman loginnya
  //   // Timer(const Duration(seconds: 3)), (){

  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF464D81),
      body: Container(
        width: 380,
        height: 917,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Color(0XFF464D81)),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 296.0,
            bottom: 381.02,
            left: 86.01,
            right: 86.01,
          ),
          child: Stack(
            children: [
              Image.asset('assets/image/LogoFull.png'),
            ],
          ),
        ),
      ),
    );
  }
}

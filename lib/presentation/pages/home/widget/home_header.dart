import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:48, vertical: 36),
      decoration: BoxDecoration(
        color: Color(0xFF464A7E),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.notifications, color: Colors.white, size: 24),

              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Jenni Will",
                        style: TextStyle(
                          color: Color(0XFFF9F1BE),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 20),

          Text(
            "Competify",
            style: TextStyle(
              color: Color(0XFFF9F1BE),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Selamat datang calon juara!",
            style: TextStyle(color: Color(0XFFF9F1BE), fontSize: 16),
          ),

          SizedBox(height: 15),

          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0XFFF9F1BE),
              hintText: "Klik untuk mencari",
              prefixIcon: Icon(Icons.search, color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
